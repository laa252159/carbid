package com.ted.service;

import com.ted.model.*;

import java.util.List;

public interface MailService {

    String SENDER = "noreply@perekup64.ru";

    String[] admins_emails = {
            "laa252159@gmail.com",
            "alexey221284@mail.ru",
            "svda16@mail.ru",
            "sourw@bk.ru"
    };

    void notifyAdminAboutPostConfirmation(User user);

    void notifyAdminAboutRegistration(User user);

    void notifyUsersAboutNewAuction(Auction auction);

    void notifyUsersAboutApprovement(List<String> approved);

    void notifyUsersAboutVictory(Auction auction);

    void suggestAuction(SuggestAuctionDto suggestAuctionDto);

    void suggestAuction(Suggestion suggestion);

    void spamPromo(PromoDto promoDto);

    void sendToUserMailConfirmationLink(User user);

    void sendToUserChangePasswordLink(User user, String token);

}
