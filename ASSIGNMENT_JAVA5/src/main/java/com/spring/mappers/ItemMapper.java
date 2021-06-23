package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.Item;
import com.spring.entity.Product;

@Service
public class ItemMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto->entity
	public  Product convertToEntity(Item item) 
	{
		Product entity=mapper.map(item,Product.class);
		return entity;
	}
	
	//convert entity->dto
	public  Item convertToDTO(Product entity) {
		Item item =mapper.map(entity,Item.class);
		return item;
	}
}
