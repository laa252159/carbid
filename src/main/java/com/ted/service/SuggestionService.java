package com.ted.service;

import com.ted.model.Suggestion;

import java.util.List;

public interface SuggestionService {
	
	List<Suggestion> getAllSuggestions();

	List<Suggestion> getNewSuggestions();

	Suggestion sendToAdmin(Suggestion suggestion);

	public void updateSuggestions();

}
