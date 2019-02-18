package com.ted.service;

import com.ted.model.*;

import java.util.List;

public interface MailService {

    String SENDER = "noreply@perekup64.ru";

    String[] admins_emails = {
            "alexey221284@mail.ru",
            "laa252159@gmail.com",
            "svda16@mail.ru",
            "mga3556276@gmail.com"
    };

    void notifyAdminAboutNewUser(User user);

    void notifyUsersAboutNewAuction(Auction auction);

    void notifyUsersAboutApprovement(List<String> approved);

    void notifyUsersAboutVictory(Auction auction);

    void suggestAuction(SuggestAuctionDto suggestAuctionDto);

    void suggestAuction(Suggestion suggestion);

    void spamPromo(PromoDto promoDto);

    void sendToUserMailConfirmationLink(User user);

    void sendToUserMailPasswordVerificationLink(User user, String token);

}
