package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.CategoryDTO;
import com.spring.entity.Category;

@Service
public class CategoryMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  Category convertToEntity(CategoryDTO categoryDTO) 
	{
		Category entity=mapper.map(categoryDTO,Category.class);
		return entity;
	}
	
	//convert entity->dto
	public  CategoryDTO convertToDTO(Category entity) {
		CategoryDTO categoryDTO =mapper.map(entity,CategoryDTO.class);
		return categoryDTO;
	}
}
