package com.noa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.noa.exception.CustomException;
import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;
import com.noa.service.EmployeeService;
import com.noa.service.SysService;

@Controller
public class AccountController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private SysService sysService;

	EmployeeCustom activeEmp;

	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request) throws Exception {

		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		if (exceptionClassName != null) {
			if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
				// 最终会抛给异常处理器

				model.addAttribute("message", "账号不存在");
			} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
				model.addAttribute("message", "用户名/密码错误");
				// throw new CustomException("用户名/密码错误");
			} else {
				model.addAttribute("message", "未知错误");
				// throw new Exception();// 最终在异常处理器生成未知错误
			}
		}

		// 访问/login时, 自动进行认证,认证成功后直接跳转出去
		// 初次访问时exceptionClassName== null直接到这里
		// 认证失败时exceptionClassName!= null , 传递信息后又回到这里
		return "misc/login";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String showSignupPage(Model model) throws Exception {
		return "misc/signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String checkUsername(Model model, Employee employee) throws Exception {

		try {
			employeeService.checkUsername(employee);
			model.addAttribute("employee", employee);

			model.addAttribute("positionList", sysService.getAbleToRegPos());

			return "misc/signup_detail";

		} catch (CustomException e) {
			model.addAttribute("message", e.getMessage());
		}

		return "misc/signup";
	}

	@RequestMapping(value = "/signup2", method = RequestMethod.POST)
	public String confirmPosition(Model model, Employee employee, MultipartFile employee_pic) throws Exception {

		// 上传图片
		String originalFilename = employee_pic.getOriginalFilename();
		if (employee_pic != null && originalFilename != null && originalFilename.trim() != "") {
			employee.setPic(sysService.uploadPic("employee", employee_pic));
		}

		model.addAttribute("employee", employee);
		model.addAttribute("departmentList", sysService.getAbleToRegDep(employee.getPositionId()));

		return "misc/signup_dep";
	}

	@RequestMapping(value = "/formal_signup", method = RequestMethod.POST)
	public String register(Model model, Employee employee) throws Exception {
		try {

			employeeService.register(employee);

			UsernamePasswordToken token = new UsernamePasswordToken(employee.getUsername(), employee.getPassword());
			SecurityUtils.getSubject().login(token);
			return "redirect:home";

		} catch (CustomException e) {
			model.addAttribute("message", e.getMessage());
		}
		// 注册失败
		return "misc/signup_detail";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		activeEmp = (EmployeeCustom) session.getAttribute("activeEmp");
		employeeService.logout(activeEmp);
		session.removeAttribute("activeEmp");

		return "redirect:/login";
	}

	@RequestMapping("/refuse")
	public String refuse() throws Exception {
		return "misc/refuse";
	}

}
