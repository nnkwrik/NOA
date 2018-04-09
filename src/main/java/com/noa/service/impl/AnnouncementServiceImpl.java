package com.noa.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.noa.mapper.AnnouncementMapper;
import com.noa.po.Announcement;
import com.noa.po.AnnouncementCustom;
import com.noa.po.EmployeeCustom;
import com.noa.service.AnnouncementService;
import com.noa.service.SysService;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	private AnnouncementMapper announcementMapper;

	@Autowired
	private SysService sysService;

	// 展示所有给我的公告
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AnnouncementCustom> showAllAnnouncement(EmployeeCustom employeeCustom) throws Exception {

		Integer departmentId = employeeCustom.getDepartmentId();
		List<Integer> depIds = null;

		if (departmentId % 10 == 0) { // 无所属的子部门,获取该大部门下的所有子部门
			depIds = sysService.getSubDepByMain(departmentId);
			depIds.add(0); // 加上全体
			return announcementMapper.showAnnouncementList(depIds);
		}

		// 有所属的组部门
		depIds = new ArrayList<Integer>();
		depIds.add(0); // 全体
		depIds.add((departmentId / 10) * 10); // main
		depIds.add(departmentId); // sub
		return announcementMapper.showAnnouncementList(depIds);

	}

	// 筛选显示的公告
	public List<AnnouncementCustom> filterAnnouncement(Integer department_id) throws Exception {
		return announcementMapper.filterAnnouncement(department_id);
	}

	// 展示公告详细
	public Announcement announcementDetail(Integer announcement_id) throws Exception {

		return announcementMapper.announcementDetail(announcement_id);
	}

	// 发布公告
	public void announce(Announcement announcement, EmployeeCustom employeeCustom) throws Exception {
		announcement.setAutherId(employeeCustom.getId());
		announcementMapper.announce(announcement);
	}

	// 删除公告
	public void deleteAnnouncement(Integer announcementId) throws Exception {

		announcementMapper.deleteAnnouncement(announcementId);
	}

}
