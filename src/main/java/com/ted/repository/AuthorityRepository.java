package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ted.model.Authority;
import com.ted.model.AuthorityPK;

@Repository("authorityRepository")
public interface AuthorityRepository extends JpaRepository<Authority, AuthorityPK>  {

}
