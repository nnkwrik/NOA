package com.noa.po;

public class AnnouncementCustom extends Announcement {

	private String targetName; // 对象部门名
	private EmployeeCustom auther;

	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	public EmployeeCustom getAuther() {
		return auther;
	}

	public void setAuther(EmployeeCustom auther) {
		this.auther = auther;
	}

}