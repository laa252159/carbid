package com.ted.mail;

import com.ted.model.Auction;
import com.ted.model.PromoDto;
import com.ted.model.SuggestAuctionDto;
import com.ted.model.User;
import com.ted.service.MailService;
import com.ted.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSendException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Component
public class Mailer implements MailService {

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    static {
        System.setProperty("mail.mime.charset", "utf8");
    }

    @Override
    public void notifyAdminAboutNewUser(User user) {
        sendMail(SENDER, GUMAEV_EMAIL, "На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user);
        sendMail(SENDER, DEV_EMAIL, "На Perekup64.ru зарегистрировался новый пользователь", "Зарегистрировался : \n\n" + user);
    }

    @Override
    public void notifyUsersAboutNewAuction(Auction auction) {
        List<User> users = userService.getApprovedUsers();
        for (User user : users) {
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

    private void sendMimeMail(String from, String to, String subject, String msg, MultipartFile multipartFile) {
        MimeMessage message = mailSender.createMimeMessage();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(from);
        simpleMailMessage.setTo(to);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(msg);

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom(simpleMailMessage.getFrom());
            helper.setTo(simpleMailMessage.getTo());
            helper.setSubject(simpleMailMessage.getSubject());
            helper.setText(String.format(
                    simpleMailMessage.getText()));

            if(multipartFile != null){
                InputStreamSource inputStreamSource = () -> multipartFile.getInputStream();
                helper.addAttachment(multipartFile.getOriginalFilename(), inputStreamSource);
            }

        } catch (MessagingException e) {
            throw new MailParseException(e);
        }
        mailSender.send(message);
    }

    @Override
    public void suggestAuction(SuggestAuctionDto suggestAuctionDto) {
        StringBuilder sb = new StringBuilder();
        sb.append(" | Имя - ");
        sb.append(suggestAuctionDto.getName());
        sb.append(" | телефон - ");
        sb.append(suggestAuctionDto.getPhone());
        sb.append(" | email - ");
        sb.append(suggestAuctionDto.getEmail());
        sb.append(" | Марка - ");
        sb.append(suggestAuctionDto.getBrand());
        sb.append(" | Модель - ");
        sb.append(suggestAuctionDto.getModel());
        sb.append(" | Год выпуска - ");
        sb.append(suggestAuctionDto.getYear());
        sendMimeMail(suggestAuctionDto.getEmail(), DEV_EMAIL, "Предложение авто", sb.toString(), suggestAuctionDto.getPhoto());
        sendMimeMail(suggestAuctionDto.getEmail(), GUMAEV_EMAIL, "Предложение авто", sb.toString(), suggestAuctionDto.getPhoto());
        sendMimeMail(suggestAuctionDto.getEmail(), suggestAuctionDto.getEmail(), "Предложение авто", "Ваша заявка принята. С Вами свяжется наш сотрудник.", suggestAuctionDto.getPhoto());
    }

    @Override
    public void spamPromo(PromoDto promoDto) {
        List<User> users = userService.getApprovedUsers();
        for (User user : users) {
            StringBuilder subject = new StringBuilder();
            StringBuilder message = new StringBuilder();

            subject.append(promoDto.getSubject());

            message.append(promoDto.getSuggestion());
            //TODO раскомментировать
            if(user.getEmail().equals("laa252159@gmail.com")){
                sendMail(SENDER, user.getEmail(), subject.toString(), message.toString());
            }
        }
    }

    @Override
    public void notifyUsersAboutVictory(Auction auction) {
        StringBuilder sb = new StringBuilder();
        sb.append(auction.getBuyer().getUsername() + ", поздравляем Вас! Вы выйграли аукцион http://www.perekup64.ru/auction/" + auction.getAuctionid() + "\n");
        sb.append(auction.getBrand() + " " + auction.getModel() + " " + auction.getReleased() + "\n");
        sb.append("За " + auction.getCurrently() + " 000 рублей \n");
        sendMail(SENDER, auction.getBuyer().getEmail(), "Победа на аукционе", sb.toString());



        StringBuilder sb2 = new StringBuilder();
        sb2.append(auction.getBuyer().getUsername() + ", пользователь выйграл аукцион http://www.perekup64.ru/auction/" + auction.getAuctionid() + "\n");
        sb2.append(auction.getBrand() + " " + auction.getModel() + " " + auction.getReleased() + "\n");
        sb2.append("За " + auction.getCurrently() + " 000 рублей \n");
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        sendMail(SENDER, GUMAEV_EMAIL, "Победа на аукционе", sb2.toString());
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        sendMail(SENDER, DEV_EMAIL, "Победа на аукционе", sb2.toString());
    }
}
