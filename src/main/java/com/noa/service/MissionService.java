package com.noa.service;

import java.util.List;

import com.noa.po.EmployeeCustom;
import com.noa.po.Mission;
import com.noa.po.MissionCustom;
import com.noa.po.MissionVo;

public interface MissionService {
	List<MissionCustom> showAllMission(EmployeeCustom employeeCustom) throws Exception;

	List<MissionCustom> filterMission(Integer department_id) throws Exception;

	MissionVo missionDetail(Integer mission_id) throws Exception;

	void postMission(Mission mission, EmployeeCustom employeeCustom) throws Exception;

	void updateProgress(Integer missionId, Integer progress) throws Exception;

	void comment(Integer missionId, String oldComment, String newComment, EmployeeCustom employeeCustom)
			throws Exception;

	void deleteComment(Integer missionId, Integer commentEmp, String comment, String allComment) throws Exception;

	void deleteMission(Integer missionId) throws Exception;

	void editMission(Mission mission, EmployeeCustom employeeCustom) throws Exception;
}
