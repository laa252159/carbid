package com.ted.mail;

import com.ted.model.Auction;
import com.ted.model.User;
import com.ted.service.MailService;
import com.ted.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Mailer implements MailService {

    @Autowired
    private UserService userService;

    @Autowired
    private MailSender mailSender;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    static {
        System.setProperty("mail.mime.charset", "utf8");
    }

    @Override
    public void notifyAdminAboutNewUser(User user) {
        sendMail(SENDER,GUMAEV_EMAIL,"На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user );
        sendMail(SENDER,DEV_EMAIL,"На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user );
    }

    @Override
    public void notifyUsersAboutNewAuction(Auction auction) {
        List<User> users = userService.getApprovedUsers();
        for(User user : users){
            StringBuilder subject = new StringBuilder();
            StringBuilder message = new StringBuilder();

            subject.append("Новый Аукцион на Perekup64: ");
            subject.append(" | Марка - ");
            subject.append(auction.getBrand());
            subject.append(" | Модель - ");
            subject.append(auction.getModel());
            subject.append(" | Год выпуска - ");
            subject.append(auction.getReleased());


            message.append("Уважаемый " + user.getFirstName() + " запущен новый аукцион: \n");
            message.append("\nМарка - ");
            message.append(auction.getBrand());
            message.append("\nМодель - ");
            message.append(auction.getModel());
            message.append("\nГод выпуска - ");
            message.append(auction.getReleased());
            message.append("\nПробег - ");
            message.append(auction.getRun());
            message.append("\nСтартовая цена - ");
            message.append(auction.getFirstBid() + " 000 Руб");
            message.append("\nКупить до завершения аукциона можно за - ");
            message.append(auction.getBuyPrice() + " 000 Руб");
            message.append("\nДля получения более подробной информации зайдите на сайт под своей учетной записью");
            message.append("\nСсылка для незарегистрированных пользователей: http://www.perekup64.ru/auction/" + auction.getAuctionid());

            sendMail(SENDER, user.getEmail(), subject.toString(), message.toString());
        }
    }

    @Override
    public void notifyUsersAboutApprovement(List<String> approved) {
        for (String userName : approved) {
            User user = userService.getUserByUsername(userName);
            StringBuilder msg = new StringBuilder();
            msg.append("Уважаемый ");
            msg.append(user.getFirstName());
            msg.append(" ваша учетная запись активирована! ");
            msg.append(" Теперь у Вас есть возможность принимать участие в торгах.");

            if (user.getEmail() != null && !user.getEmail().isEmpty()) {
                sendMail(SENDER, user.getEmail(), "Подтверждение учетной записи", msg.toString());
            }
        }
    }

    private void sendMail(String from, String to, String subject, String msg) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        try {
            mailSender.send(message);
        } catch (MailSendException ex) {
            System.out.println("mailsend error: " + "to: " + to);
            sendMail(SENDER, GUMAEV_EMAIL, "ошибка при автоматической отправке письма для: " + to + " с текстом: ", msg);
            sendMail(SENDER, DEV_EMAIL, "ошибка при автоматической отправке письма для: " + to + " с текстом: ", msg);
        }
    }
}
