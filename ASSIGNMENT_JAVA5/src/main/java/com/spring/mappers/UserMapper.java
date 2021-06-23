package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.UserDTO;
import com.spring.entity.User;


@Service
public class UserMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  User convertToEntity(UserDTO userDTO) 
	{
		User entity=mapper.map(userDTO,User.class);
		return entity;
	}
	
	//convert entity->dto
	public  UserDTO convertToDTO(User entity) {
		UserDTO userDTO =mapper.map(entity,UserDTO.class);
		return userDTO;
	}
}
