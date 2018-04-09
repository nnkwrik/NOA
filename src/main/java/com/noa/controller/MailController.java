package com.noa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.noa.po.EmployeeCustom;
import com.noa.po.Mail;
import com.noa.po.MailCustom;
import com.noa.service.EmployeeService;
import com.noa.service.MailService;
import com.noa.service.SysService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailService mailService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private SysService sysService;

	// 展示收到的邮件
	@RequestMapping("")
	public String showMailPage(Model model, HttpSession session, HttpServletRequest request) throws Exception {

		List<MailCustom> mailList = new ArrayList<MailCustom>();

		switch ((String) request.getParameter("view")) {
		case "all":
			mailList = mailService.findMailToMe((EmployeeCustom) session.getAttribute("activeEmp"));
			model.addAttribute("isSend", false);
			break;
		case "unread":
			mailList = mailService.findUnreadMailToMe((EmployeeCustom) session.getAttribute("activeEmp"));
			model.addAttribute("isSend", false);
			break;
		case "read":
			mailList = mailService.findReadMailToMe((EmployeeCustom) session.getAttribute("activeEmp"));
			model.addAttribute("isSend", false);
			break;
		case "send":
			mailList = mailService.findMailSendByMe((EmployeeCustom) session.getAttribute("activeEmp"));
			model.addAttribute("isSend", true);
			break;

		default:
			mailList = mailService.findMailToMe((EmployeeCustom) session.getAttribute("activeEmp"));
			model.addAttribute("isSend", false);
			break;
		}
		model.addAttribute("mailList", mailList);
		model.addAttribute("isInbox", true);// mail_common中右上角的的按钮

		return "mail/mail_inbox";
	}

	@RequestMapping("/mail_view")
	public String showMailDetail(Model model, HttpServletRequest request) throws Exception {

		MailCustom mailDetail = mailService.showMailDetail(Integer.parseInt(request.getParameter("mail_id")),
				Integer.parseInt(request.getParameter("otherside_id")));

		model.addAttribute("mail", mailDetail);
		model.addAttribute("isSend", Boolean.parseBoolean(request.getParameter("isSend")));

		return "mail/mail_view";
	}

	@RequestMapping("/send_mail.action")
	public String sendMail(Mail mail, MultipartFile mail_pic) throws Exception {

		// 上传图片
		// 原始名称
		String originalFilename = null;
		if (mail_pic != null) {
			mail_pic.getOriginalFilename();
		} 
		if (mail_pic != null && originalFilename != null && originalFilename.trim() != "") {

			mail.setPic(sysService.uploadPic("mail", mail_pic));
		}

		// 将新图片名称写入
		mail.setText(mail.getText().replaceAll("\r\n", "<br>"));
		mailService.sendMail(mail);

		return "redirect:/mail?view=all";
	}

	@RequestMapping("/mail_compose")
	public String showComposeForm(Model model, Integer receiver) throws Exception {

		if (receiver != null) {
			model.addAttribute("receiver", employeeService.findEmployeeById(receiver));
		}

		return "mail/mail_compose";
	}

}
