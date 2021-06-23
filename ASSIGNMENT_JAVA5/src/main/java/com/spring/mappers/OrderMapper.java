package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.OrderDTO;
import com.spring.entity.Order;

@Service
public class OrderMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  Order convertToEntity(OrderDTO orderDTO) 
	{
		Order entity=mapper.map(orderDTO,Order.class);
		return entity;
	}
	
	//convert entity->dto
	public  OrderDTO convertToDTO(Order entity) {
		OrderDTO dto =mapper.map(entity,OrderDTO.class);
		return dto;
	}
}
