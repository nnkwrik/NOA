package com.noa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.noa.po.Mail;
import com.noa.po.MailCustom;

public interface MailMapper {

	List<MailCustom> findMailToMe(Integer employeeId) throws Exception;

	List<MailCustom> findUnreadMailToMe(Integer employeeId) throws Exception;

	List<MailCustom> findReadMailToMe(Integer employeeId) throws Exception;

	List<MailCustom> findMailSendByMe(Integer employeeId) throws Exception;

	MailCustom showMailDetail(@Param("mail_id")Integer mailId ,@Param("otherside_id")Integer otherside_id) throws Exception;

	void updateRead(Integer mailId) throws Exception;

	void SendMail(Mail mail) throws Exception;

}
