package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ted.model.Similar;
import com.ted.model.SimilarPK;
import com.ted.model.User;

public interface SimilarRepository extends JpaRepository<Similar, SimilarPK> {
	
	List<Similar> findByUser1(User user);
	
	@Query(value = "SELECT s.user1 FROM Similar as s GROUP BY s.user1")
	List<User> getUsersWithSimilarity();

}
