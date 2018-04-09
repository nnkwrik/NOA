package com.noa.exception;
<<<<<<< HEAD
@SuppressWarnings("all")
=======

>>>>>>> aa6a6779d6208500b5349615db2e00aad7cd97b9
//自定义的异常类
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
