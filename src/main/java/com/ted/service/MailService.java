package com.ted.service;

import com.ted.model.Auction;
import com.ted.model.User;

import java.util.List;

public interface MailService {

    String SENDER = "perekup64mail@gmail.com";

    String GUMAEV_EMAIL = "alexey221284@mail.ru";

    String DEV_EMAIL = "laa252159@gmail.com";

    void notifyAdminAboutNewUser(User user);

    void notifyUsersAboutNewAuction(Auction auction);

    void notifyUsersAboutApprovement(List<String> approved);

}
