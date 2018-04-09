package com.noa.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noa.po.Announcement;
import com.noa.po.AnnouncementCustom;
import com.noa.po.EmployeeCustom;
import com.noa.service.AnnouncementService;
import com.noa.service.AttendanceService;
import com.noa.service.EmployeeService;
import com.noa.service.SysService;



@Controller
public class HomeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	AttendanceService attendanceService;
	
	@Autowired
	AnnouncementService announcementService;
	
	@Autowired
	SysService sysService;
	
	EmployeeCustom activeEmp;
	

	@RequestMapping("/home")
	public String showHome(Model model,HttpSession session) throws Exception{

		
		activeEmp = (EmployeeCustom) SecurityUtils.getSubject().getPrincipal();
		session.setAttribute("activeEmp", activeEmp);
		
	
		//展示出勤率,[0]正常 [1]加班 [2]迟到早退 [3]缺席[4]剩余天数
		int[] attendance = attendanceService.countMonthState(activeEmp);
		
		model.addAttribute("attendance",attendance);

		//公告一览
		List<AnnouncementCustom> announceList = announcementService.showAllAnnouncement(activeEmp);
		model.addAttribute("announceList", announceList);
		
		//可发布公告的对象
		model.addAttribute("departmentList", sysService.getAbleToAnnounceDeps());
		
		return "/home/home";
	}
	
	@RequestMapping("/announce.action")
	@RequiresPermissions(value={"announce:create:all","announce:create:main","announce:create:sub"},logical=Logical.OR)
	public String annouce(HttpSession session,String target,Announcement announcement) throws Exception{
		activeEmp = (EmployeeCustom)session.getAttribute("activeEmp");

		announcement.setText(announcement.getText().replaceAll("\r\n", "<br>"));
		announcementService.announce(announcement, activeEmp);
		
		return "redirect:/home";
	}
	
	@RequestMapping("/delete_announce.action")
	public String deleteAnnouce(HttpSession session,Integer delete_id) throws Exception{
		announcementService.deleteAnnouncement(delete_id);
		return "redirect:/home";
	}
	
}
