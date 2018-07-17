package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ted.model.Location;

@Repository
public interface LocationRepository  extends JpaRepository<Location, Long> {
	
	Location findByName(String namme);

}
