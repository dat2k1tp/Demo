package com.spring.repositories;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.entity.User;


public interface UserRepository extends JpaRepository<User, Integer>{
	@Query("SELECT entity FROM User entity WHERE entity.email=:email AND entity.activated=1")
	public User findByEmail(@Param("email") String email);
	
	@Query("SELECT entity FROM User entity WHERE entity.activated=1")
	public Page<User> findProductActivated(Pageable pageable);
	
	@Query("SELECT entity FROM User entity WHERE entity.activated=0")
	public Page<User> findProductUnActivated(Pageable pageable);

}
