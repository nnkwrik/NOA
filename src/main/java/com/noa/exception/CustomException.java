package com.noa.exception;

//自定义的异常类
@SuppressWarnings("serial")
public class CustomException extends Exception {
	// 异常信息
	public String messages;

	public CustomException(String messages) {
		super(messages);
		this.messages = messages;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}
}
