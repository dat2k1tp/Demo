package com.spring.repositories;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.entity.Product;


public interface ProductRepository  extends JpaRepository<Product, Integer>{
	@Query("SELECT entity FROM Product entity WHERE entity.category.id=:categoryId AND entity.delete_at=0")
	public Page<Product> findByCategory(@Param("categoryId") Integer id,Pageable pageable);
	
	@Query("SELECT entity FROM Product entity WHERE entity.category.id=:categoryId"
			+ " AND entity.delete_at=1 AND entity.name LIKE:keyword")
	public Page<Product> findByProductSotfDelete(@Param("categoryId") Integer categoryId,@Param("keyword") String keyword,Pageable pageable);
	
	@Query("SELECT entity FROM Product entity WHERE entity.category.id=:categoryId"
			+ " AND entity.delete_at=0 AND entity.name LIKE:keyword")
	public Page<Product> findByKeyWord(@Param("categoryId") Integer categoryId,@Param("keyword") String keyword,Pageable pageable);
	
	
}
