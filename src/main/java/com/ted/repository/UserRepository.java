package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ted.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	User findByEmail(String email);
	
	User findByUsername(String username);
	
	User findByAfm(String afm);
	
	User findByUserid(int id);
	
	/* Dashboard Info */
	List<User> findTop5ByOrderByUseridDesc();
	
	Long countByApproved(byte approved);
	
	@Query(value = "SELECT COUNT(*) FROM users u, authorities a WHERE u.userid = a.userid AND a.role = \"ROLE_SELLER\"", nativeQuery = true)
	Long countSellers();
	
	

}
