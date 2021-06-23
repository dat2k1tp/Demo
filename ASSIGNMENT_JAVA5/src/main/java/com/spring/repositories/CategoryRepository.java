package com.spring.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.spring.entity.Category;



public interface CategoryRepository  extends JpaRepository<Category, Integer>{
	@Query("SELECT entity FROM Category entity WHERE entity.delete_at=0")
	public Page<Category> findCategoryUnSoftDelete(Pageable pageable);
	
	@Query("SELECT entity FROM Category entity WHERE entity.delete_at=1")
	public Page<Category> findCategorySotfDelete(Pageable pageable);
}
