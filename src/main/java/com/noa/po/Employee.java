package com.noa.po;

public class Employee {
	private Integer id; // 员工id

	private String name; // 员工姓名

	private Integer sex; // 员工性别 ,男1女0

	private String pic; // 头像

	private Integer departmentId; // 部门id

	private Integer positionId; // 职位id,在sys_employee_position表中.

	private String username;
	private String password;
	private String salt;

	private Integer workingState; // 状态 : 0(默认):离线,1:在线

	private Integer locked; // 是否可用, 不可用时1 可用时0

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getWorkingState() {
		return workingState;
	}

	public void setWorkingState(Integer workingState) {
		this.workingState = workingState;
	}

	public Integer getLocked() {
		return locked;
	}

	public void setLocked(Integer locked) {
		this.locked = locked;
	}
}