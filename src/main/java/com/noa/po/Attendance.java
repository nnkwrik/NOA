package com.noa.po;

import java.util.Date;

public class Attendance {
	private Integer id; // 唯一标识

	private Integer employeeId;// 员工id

	private Date date; // 当天日期

	private Date onTime; // 出勤时间

	private Date offTime; // 退勤时间

	private Integer state; // 状态 : 0正常 1加班 2迟到早退

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getOnTime() {
		return onTime;
	}

	public void setOnTime(Date onTime) {
		this.onTime = onTime;
	}

	public Date getOffTime() {
		return offTime;
	}

	public void setOffTime(Date offTime) {
		this.offTime = offTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}