package com.noa.mapper;

import java.util.List;

import com.noa.po.Announcement;
import com.noa.po.AnnouncementCustom;


public interface AnnouncementMapper {


	List<AnnouncementCustom> filterAnnouncement(Integer department_id) throws Exception;
	
	List<AnnouncementCustom> showAnnouncementList(List<Integer> department_ids) throws Exception;

	Announcement announcementDetail(Integer announcement_id) throws Exception;

	void announce(Announcement announcement) throws Exception;

	void deleteAnnouncement(Integer id) throws Exception;

}
