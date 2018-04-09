package com.noa.po;

public class MissionCustom extends Mission{
	
	private String targetName; // 对象部门名
	
	private EmployeeCustom auther;	//作者情报
	

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
