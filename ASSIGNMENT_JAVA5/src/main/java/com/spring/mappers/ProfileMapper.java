package com.spring.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.ProfileDTO;
import com.spring.entity.User;

@Service
public class ProfileMapper {
	@Autowired
	private  ModelMapper mapper;
	
	//convert dto-> entity
	public  User convertToEntity(ProfileDTO profileDTO) 
	{
		User entity=mapper.map(profileDTO,User.class);
		return entity;
	}
	
	//convert entity->dto
	public  ProfileDTO convertToDTO(User entity) {
		ProfileDTO profileDTO =mapper.map(entity,ProfileDTO.class);
		return profileDTO;
	}
}
