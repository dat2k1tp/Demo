package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.ProductDTO;
import com.spring.entity.Product;

@Service
public class ProductMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  Product convertToEntity(ProductDTO productDTO) 
	{
		Product entity=mapper.map(productDTO,Product.class);
		return entity;
	}
	
	//convert entity->dto
	public  ProductDTO convertToDTO(Product entity) {
		ProductDTO productDTO =mapper.map(entity,ProductDTO.class);
		return productDTO;
	}
}
