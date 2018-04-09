package com.noa.po;

import java.util.Map;

public class MissionVo {

	private MissionCustom missionDetail;

	private Map<EmployeeCustom, String> employeeCommentMap; // ∆¿¬€’π æ

	public MissionCustom getMissionDetail() {
		return missionDetail;
	}

	public void setMissionDetail(MissionCustom missionDetail) {
		this.missionDetail = missionDetail;
	}

	public Map<EmployeeCustom, String> getEmployeeCommentMap() {
		return employeeCommentMap;
	}

	public void setEmployeeCommentMap(Map<EmployeeCustom, String> employeeCommentMap) {
		this.employeeCommentMap = employeeCommentMap;
	}

}
