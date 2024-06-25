package com.example.cinema.service.impl;

import com.example.cinema.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String from;

    @Override
    public boolean sendMessage(String to, String subject, String text) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(from);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(text);
        simpleMailMessage.setTo(to);
        try {
            javaMailSender.send(simpleMailMessage);
        } catch (Throwable e) {
            return false;
        }
        return true;
    }
}
