package com.noa.po;

import java.util.Date;

public class Mission {
	private Integer id;// 唯一标识

	private Integer autherId;// 作者id

	private String pic;// 上传的照片

	private String title;

	private String text;

	private Integer targetId; // 任务对象

	private Integer progress; // 进度

	private String comment; // 员工id:#评论文本:&员工id:#评论文本:&

	private Date time; // 发表时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAutherId() {
		return autherId;
	}

	public void setAutherId(Integer autherId) {
		this.autherId = autherId;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic == null ? null : pic.trim();
	}

	public Integer getTargetId() {
		return targetId;
	}

	public void setTargetId(Integer targetId) {
		this.targetId = targetId;
	}

	public Integer getProgress() {
		return progress;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}