package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.RegisterDTO;
import com.spring.entity.User;

@Service
public class RegisterMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  User convertToEntity(RegisterDTO registerDTO) 
	{
		User entity=mapper.map(registerDTO,User.class);
		return entity;
	}
	
	//convert entity->dto
	public  RegisterDTO convertToDTO(User entity) {
		RegisterDTO registerDTO =mapper.map(entity,RegisterDTO.class);
		return registerDTO;
	}
}
