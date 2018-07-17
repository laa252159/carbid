package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ted.model.GlobalMessage;

public interface GlobalMessageRepository extends JpaRepository<GlobalMessage, Long>{

}
