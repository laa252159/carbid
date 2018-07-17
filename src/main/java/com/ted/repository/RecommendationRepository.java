package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ted.model.Recommendation;
import com.ted.model.RecommendationPK;

@Repository
public interface RecommendationRepository extends JpaRepository<Recommendation, RecommendationPK> {
	
	@Query(value = "SELECT auction_id FROM recommendations WHERE user_id = :userid ORDER BY prediction DESC", nativeQuery = true)
	List<Integer> getRecommendedAuctionsIds(@Param("userid") int userid);
	
	

}
