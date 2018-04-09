package com.noa.service;

import java.util.List;

import com.noa.po.Announcement;
import com.noa.po.AnnouncementCustom;
import com.noa.po.EmployeeCustom;

public interface AnnouncementService {
	List<AnnouncementCustom> showAllAnnouncement(EmployeeCustom employeeCustom) throws Exception;

	List<AnnouncementCustom> filterAnnouncement(Integer department_id) throws Exception;

	Announcement announcementDetail(Integer announcement_id) throws Exception;

	void announce(Announcement announcement, EmployeeCustom employeeCustom) throws Exception;

	void deleteAnnouncement(Integer announcementId) throws Exception ;
}
