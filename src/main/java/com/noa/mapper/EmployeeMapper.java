package com.noa.mapper;

import java.util.List;

import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;

public interface EmployeeMapper {

	List<EmployeeCustom> findEmployee(Employee employeeInfo) throws Exception;

	EmployeeCustom findEmployeeById(Integer id) throws Exception;

	void changeWorkingState(EmployeeCustom employeeCustom) throws Exception;


	Integer existedUsername(Employee employee) throws Exception;

	void register(Employee employee) throws Exception;

	EmployeeCustom login(Employee employee) throws Exception;

	void registerPosition(Employee employee) throws Exception;

	Employee findAccountByUsername(String username) throws Exception;

}
