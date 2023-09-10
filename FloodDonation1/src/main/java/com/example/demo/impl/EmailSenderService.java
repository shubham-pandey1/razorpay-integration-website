package com.example.demo.impl;

public interface EmailSenderService {
	void sendEmail(String to, String sub, String msg);
}
