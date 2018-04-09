package com.noa.service;

import java.util.List;

import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;

public interface EmployeeService {

	List<EmployeeCustom> findEmployee(Employee employeeInfo) throws Exception;

	EmployeeCustom findEmployeeById(Integer employeeId) throws Exception;

	EmployeeCustom changeWorkingState(EmployeeCustom employeeCustom, int workingState) throws Exception;

	void checkUsername(Employee employee) throws Exception;

	void register(Employee employee) throws Exception;

	EmployeeCustom login(Employee employee) throws Exception;

	void logout(EmployeeCustom employeeCustom) throws Exception;

	Employee findAccountByUsername(String username) throws Exception;

}
