package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.Message;
import com.ted.model.User;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long>{
	
	@Query(value = "select count(*) from messages message0_ left outer join users user1_ on "
			+ "message0_.receiver_id=user1_.userid where user1_.userid=:id and message0_.is_read =0",
            nativeQuery=true)
    public Integer newMessagesCount(@Param("id") Integer id);
	
	List<Message> findByReceiverAndReceiverDeleteOrderByDateDesc(User receiver, byte delete);
	
	List<Message> findBySenderAndSenderDeleteOrderByDateDesc(User sender, byte delete);

	Message findByMessageId(int id);
	
	@Transactional
	Integer deleteBymessageId(int id);

}
