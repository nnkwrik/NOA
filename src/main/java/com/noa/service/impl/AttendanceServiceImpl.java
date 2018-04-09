package com.noa.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noa.mapper.AttendanceMapper;
import com.noa.mapper.EmployeeMapper;
import com.noa.po.EmployeeCustom;
import com.noa.service.AttendanceService;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired
	private AttendanceMapper attendanceMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	//出勤
	public void on(EmployeeCustom employeeCustom) throws Exception {
		attendanceMapper.on(employeeCustom.getId());
		
	}
	

	//退勤
	public void off(EmployeeCustom employeeCustom) throws Exception {

		Date onTime = attendanceMapper.getOnTime(employeeCustom.getId());
		Date offTime = new Date();
		//计算8小时前
		long period = offTime.getTime() - onTime.getTime() -8*60*60*1000;
		//时间不足7个半小时算迟到早退(2) , 超过9小时算加班(1),正常0
		//-8*60*60*1000
		int state =(period>60*60*1000)?1:(period<-30*60*1000)?2:0;
		
		attendanceMapper.off(employeeCustom.getId(), state);
		employeeCustom.setWorkingState(0);
		employeeMapper.changeWorkingState(employeeCustom);
		
	}
	//本月的出勤状况
	public int[] countMonthState(EmployeeCustom employeeCustom) throws Exception {
		
		List<Integer> resultList = attendanceMapper.countMonthState(employeeCustom.getId());
		
		int maxday = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
		int today = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
		
		
		//[0]正常 [1]加班 [2]迟到早退 ([3]外勤)[3]缺席[4]剩余天数
		int[] states = new int[5];
		int attend = 0;
		for (Integer integer : resultList) {
			if (integer!=null) {
				
			states[integer]++;
			attend++;
			}
		}
		states[3] = today - attend;
		states[4] = maxday - today;
		
		
		return states;
	}
	
	
	public Date getOnTime(Integer empId) throws Exception {
		return attendanceMapper.getOnTime(empId);
	}
	
}
