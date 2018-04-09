package com.noa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noa.exception.CustomException;
import com.noa.mapper.MailMapper;
import com.noa.po.EmployeeCustom;
import com.noa.po.Mail;
import com.noa.po.MailCustom;
import com.noa.service.MailService;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private MailMapper mailMapper;

	// 展示所有给我的邮件
	public List<MailCustom> findMailToMe(EmployeeCustom employeeCustom) throws Exception {

		return mailMapper.findMailToMe(employeeCustom.getId());
	}

	// 展示未读的邮件
	public List<MailCustom> findUnreadMailToMe(EmployeeCustom employeeCustom) throws Exception {

		return mailMapper.findUnreadMailToMe(employeeCustom.getId());
	}

	// 展示已读的邮件
	public List<MailCustom> findReadMailToMe(EmployeeCustom employeeCustom) throws Exception {
		return mailMapper.findReadMailToMe(employeeCustom.getId());
	}

	// 展示我发送的邮件
	public List<MailCustom> findMailSendByMe(EmployeeCustom employeeCustom) throws Exception {
		return mailMapper.findMailSendByMe(employeeCustom.getId());
	}

	// 邮件详情(text,pic)
	public MailCustom showMailDetail(Integer mailId, Integer othersideId) throws Exception {
		mailMapper.updateRead(mailId);
		return mailMapper.showMailDetail(mailId, othersideId);
	}

	public void sendMail(Mail mail) throws Exception {
		if (mail.getServerId() == null || mail.getRecieverId() == null) {
			throw new CustomException("收件人或发件人为空");
		}
		mailMapper.SendMail(mail);
	}
}
