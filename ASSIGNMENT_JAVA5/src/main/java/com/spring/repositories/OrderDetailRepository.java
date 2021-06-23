package com.spring.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.entity.Order;
import com.spring.entity.OrderDetail;

public interface OrderDetailRepository  extends JpaRepository<OrderDetail, Integer>{
	@Query("SELECT entity FROM OrderDetail entity WHERE order.id=:orderId")
	public Page<OrderDetail> findByOrderDetailsView(@Param("orderId") Integer orderId,Pageable page);
	
	@Query("SELECT  entity.product,sum(entity.price*entity.quantity),"
	+ "sum(entity.quantity) FROM OrderDetail entity GROUP BY entity.product ")
	public Page<Object[]> findReport(Pageable page);
}
