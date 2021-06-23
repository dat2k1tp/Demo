package com.spring.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.entity.Order;


public interface OrderRepository  extends JpaRepository<Order, Integer>{
	@Query("SELECT entity FROM Order entity WHERE user.id=:userId")
	public Page<Order> findByOrderView(@Param("userId") Integer userId,Pageable pageable);
}
