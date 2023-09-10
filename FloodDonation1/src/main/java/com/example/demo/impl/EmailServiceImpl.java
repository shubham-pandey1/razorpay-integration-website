package com.example.demo.impl;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailSenderService{
	
	private final JavaMailSender mailSender; 
	
	public EmailServiceImpl(JavaMailSender javaMailSender) {
		// TODO Auto-generated constructor stub
		this.mailSender = javaMailSender;
	}
	
	@Override
	public void sendEmail(String to, String sub, String msg) {
		// TODO Auto-generated method stub
		SimpleMailMessage smsg = new SimpleMailMessage();
		smsg.setFrom("shubhamgenuse@gmail.com");
		smsg.setTo(to);
		smsg.setSubject(sub);
		smsg.setText(msg);
		
		this.mailSender.send(smsg);
	}
	
	
}
