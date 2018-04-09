package com.noa.service;

import java.util.Date;

import com.noa.po.EmployeeCustom;

public interface AttendanceService {
	void on(EmployeeCustom employeeCustom) throws Exception;
	void off(EmployeeCustom employeeCustom) throws Exception;
	int[] countMonthState(EmployeeCustom employeeCustom) throws Exception;
	Date getOnTime(Integer empId) throws Exception;
}
