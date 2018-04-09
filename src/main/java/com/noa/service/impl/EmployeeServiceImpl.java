package com.noa.service.impl;

import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.noa.exception.CustomException;
import com.noa.mapper.EmployeeMapper;
import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;
import com.noa.service.AttendanceService;
import com.noa.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	@Autowired
	private AttendanceService attendanceService;

	// 根据员工信息查找用户
	public List<EmployeeCustom> findEmployee(Employee employeeInfo) throws Exception {

		List<EmployeeCustom> employeeList = employeeMapper.findEmployee(employeeInfo);
		if (employeeList == null) {
			throw new CustomException("没有符合该条件的员工!");
		}
		return employeeList;

	}

	public EmployeeCustom findEmployeeById(Integer employeeId) throws Exception {
		return employeeMapper.findEmployeeById(employeeId);
	}

	// 更改工作状态,此时前端应该只提供1(在公司)和3(离开)的选项
	public EmployeeCustom changeWorkingState(EmployeeCustom employeeCustom, int workingState) throws Exception {
		employeeCustom.setWorkingState(workingState);
		employeeMapper.changeWorkingState(employeeCustom);
		return employeeCustom;
	}

	// 用户名是否被使用
	public void checkUsername(Employee employee) throws Exception {
		if (employee.getUsername() == null || employee.getUsername().trim() == "") {
			throw new CustomException("请输入用户名!");
		}
		if (employee.getPassword() == null || employee.getPassword().trim() == "") {
			throw new CustomException("请输入密码!");
		}
		if (employeeMapper.existedUsername(employee) != 0) {
			throw new CustomException("该账号已被注册!");
		}
	}

	// 注册
	@Transactional(propagation = Propagation.REQUIRED)
	public void register(Employee employee) throws Exception {
		// 需要改成前端验证
		if (employee.getName() == null || employee.getName().trim() == "" || employee.getSex() == null
				|| employee.getDepartmentId() == null || employee.getPositionId() == null
				|| employee.getUsername() == null || employee.getUsername().trim() == ""
				|| employee.getPassword() == null || employee.getPassword().trim() == "") {
			throw new CustomException("请完善信息!");
		}

		// md5
		// 原始密码
		String source = employee.getPassword();
		// 盐 = username + pass
		String salt = "salt";
		// 散列次数, 要按照shiro.xml中设置的
		int hashIterations = 1;

		Md5Hash md5Hash = new Md5Hash(source, salt, hashIterations);

		// 因为注册后要进行认证,不能改变原来的值
		Employee newEmployee = new Employee();
		BeanUtils.copyProperties(employee, newEmployee);
		newEmployee.setPassword(md5Hash.toString());
		newEmployee.setSalt(salt);

		employeeMapper.register(newEmployee);
		employeeMapper.registerPosition(newEmployee);
		// 通过LAST_INSERT_ID()获得刚注册的employee的id 然后写入sys_employee_position表

	}

	// 登录, 还需要把状态改为在线 是否在公司(0(默认):不在,1:在,(2:离开))
	@Transactional(propagation = Propagation.REQUIRED)
	public EmployeeCustom login(Employee employee) throws Exception {
		if (employee.getUsername() == null || employee.getUsername().trim() == "") {
			throw new CustomException("请输入用户名!");
		}
		if (employee.getPassword() == null || employee.getPassword().trim() == "") {
			throw new CustomException("请输入密码!");
		}

		// 账户密码验证
		EmployeeCustom employeeCustom = employeeMapper.login(employee);
		if (employeeCustom == null) {
			throw new CustomException("账号或密码错误!");
		}
		if (employeeCustom.getLocked() == 1) {
			throw new CustomException("该账号不可用!");
		}

		employeeCustom.setWorkingState(1);
		changeWorkingState(employeeCustom, 1);

		// 今天还没登陆过
		if (attendanceService.getOnTime(employeeCustom.getId()) == null) {

			attendanceService.on(employeeCustom);
		}

		return employeeCustom;
	}

	// 退勤,
	@Transactional(propagation = Propagation.REQUIRED)
	public void logout(EmployeeCustom employeeCustom) throws Exception {
		// TODO Auto-generated method stub

		attendanceService.off(employeeCustom);

	}

	// shiro认证用
	public Employee findAccountByUsername(String username) throws Exception {

		return employeeMapper.findAccountByUsername(username);
	}
}
