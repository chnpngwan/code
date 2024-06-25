package com.example.cinema.service;

public interface MailService {
    boolean sendMessage(String to, String subject, String text);
}
