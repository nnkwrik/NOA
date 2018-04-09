package com.noa.service;

import java.util.List;

import com.noa.po.EmployeeCustom;
import com.noa.po.Mail;
import com.noa.po.MailCustom;

public interface MailService {

	List<MailCustom> findMailToMe(EmployeeCustom employeeCustom) throws Exception;

	List<MailCustom> findUnreadMailToMe(EmployeeCustom employeeCustom) throws Exception;

	List<MailCustom> findReadMailToMe(EmployeeCustom employeeCustom) throws Exception;

	List<MailCustom> findMailSendByMe(EmployeeCustom employeeCustom) throws Exception;

	MailCustom showMailDetail(Integer mailId, Integer othersideId) throws Exception;

	void sendMail(Mail mail) throws Exception;
}
