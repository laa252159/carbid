package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ted.model.SellerRating;
import com.ted.model.SellerRatingPK;
import com.ted.model.User;

@Repository
public interface SellerRatingRepository extends JpaRepository<SellerRating, SellerRatingPK> {
	
	@Query(value = "SELECT avg(s.rating) FROM SellerRating s WHERE s.rated = :user")
	float userAvgRating(@Param("user") User user);

}
