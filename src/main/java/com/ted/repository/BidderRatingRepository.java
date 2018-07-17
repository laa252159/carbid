package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ted.model.BidderRating;
import com.ted.model.BidderRatingPK;
import com.ted.model.User;

@Repository
public interface BidderRatingRepository extends JpaRepository<BidderRating, BidderRatingPK> {

	@Query(value = "SELECT avg(s.rating) FROM BidderRating s WHERE s.rated = :user")
	float userAvgRating(@Param("user") User user);
	
}
