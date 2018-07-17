package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ted.model.Auction;
import com.ted.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
	
	@Query(value = "SELECT * FROM categories WHERE parent_id is NULL ORDER BY name",
            nativeQuery=true)
    List<Category> getTopCategories();
	
	Category findByName(String name);
	
	Category findByCategoryId(int id);
	
	@Query(value = "SELECT c FROM Category c WHERE :auction MEMBER OF c.auctions")
	List<Category> findByAuction(@Param("auction") Auction auction);

}
