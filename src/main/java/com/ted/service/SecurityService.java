package com.ted.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);

    void autologin(String username);
}
