package com.ted.mail;

import com.ted.model.Auction;
import com.ted.model.User;
import com.ted.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class Mailer implements MailService
{
    @Autowired
    private MailSender mailSender;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public void notifyAdminAboutNewUser(User user) {
        sendMail(SENDER,GUMAEV_EMAIL,"На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user );
        sendMail(SENDER,DEV_EMAIL,"На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user );
    }

    @Override
    public void notifyUsersAboutNewAuction(Auction auction) {

    }

    @Override
    public void notifyUserAboutApprovement() {

    }

    private void sendMail(String from, String to, String subject, String msg) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        mailSender.send(message);
    }
}
