package com.placement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service("mailManager")
public class MailManager {

	@Autowired
	private MailSender mailSender;

	public void send(String to, String subject, String message) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(to);
		msg.setSubject(subject);
		msg.setText(message);
		mailSender.send(msg);
	}
}
