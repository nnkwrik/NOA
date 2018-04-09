package com.noa.po;

import java.util.Date;

public class Mail {
	private Integer id;// 唯一标识

	private Date sendtime; // 发送时间

	private Integer serverId;// 送信者id

	private Integer recieverId;// 收信者id

	private String title; // 邮件名

	private String pic;// 图片

	private String text;// 文本

	private Integer read;// 已读

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getServerId() {
		return serverId;
	}

	public void setServerId(Integer serverId) {
		this.serverId = serverId;
	}

	public Integer getRecieverId() {
		return recieverId;
	}

	public void setRecieverId(Integer recieverId) {
		this.recieverId = recieverId;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic == null ? null : pic.trim();
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text == null ? null : text.trim();
	}

	public Integer getRead() {
		return read;
	}

	public void setRead(Integer read) {
		this.read = read;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

}