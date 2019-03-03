package com.ted.service;

import com.ted.model.*;
import com.ted.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("suggestionService")
public class SuggestionServiceImpl implements SuggestionService {

    @Autowired
    SuggestionRepository suggestionRepository;

    @Qualifier("mailMail")
    @Autowired
    private MailService mailService;

    @Override
    public List<Suggestion> getAllSuggestions() {
        return suggestionRepository.findAll();
    }

    @Override
    public List<Suggestion> getNewSuggestions() {
        return suggestionRepository.findBySentToAdmin((byte) 0);
    }

    @Override
    public Suggestion sendToAdmin(Suggestion suggestion) {
        mailService.suggestAuction(suggestion);
        suggestion.setSentToAdmin((byte) 1);
        suggestionRepository.saveAndFlush(suggestion);
        return suggestion;
    }

    @Scheduled(fixedDelay = 180000)    // Every 3 minutes
    @Transactional
    public void updateSuggestions() {

        /* Send new suggestions */
        List<Suggestion> suggestions = suggestionRepository.findBySentToAdmin((byte)0);
        for (Suggestion suggestion : suggestions) {
            sendToAdmin(suggestion);
        }
    }
}
