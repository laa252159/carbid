package com.ted.repository;

import com.ted.model.Suggestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SuggestionRepository extends JpaRepository<Suggestion, Long> {
	
	List<Suggestion> findBySentToAdmin(byte sent);

}
