package com.noa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;
import com.noa.service.EmployeeService;
import com.noa.service.SysService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private SysService sysService;

	@RequestMapping(value = "/changeStage")
	public void changeState(Model model, HttpRequest request, HttpSession session, Integer state) throws Exception {

	}

	@RequestMapping(value = "/search_emp")
	public String showSearchPage(Model model, String name, Integer depId, Integer state) throws Exception {

		List<EmployeeCustom> employeeList = new ArrayList<EmployeeCustom>();

		if ((name != null && name.trim() != "") || depId != null || state != null) {
			Employee condition = new Employee();
			if (name != null && name.trim() != "") {
				condition.setName(name);
				model.addAttribute("name", name);
			}
			if (depId != null) {
				condition.setDepartmentId(depId);
				model.addAttribute("depId", depId);
			}
			if (state != null) {
				condition.setWorkingState(state);
				model.addAttribute("state", state);
			}
			employeeList = employeeService.findEmployee(condition);
		} else {
			// show all employee
			employeeList = employeeService.findEmployee(new Employee());

		}
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("allDepartment", sysService.getAllDepartment());

		return "search/search_emp";

	}

}
