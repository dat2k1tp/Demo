package com.spring.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
//	@NotNull
	private Integer id;
	
	@NotNull
	@NotBlank
	private String username;
	
	@NotNull
	@NotBlank
	@Email
	private String email;
	
	@NotNull
	@NotBlank
	private String password;
	
//	@NotNull
//	@NotBlank
//	private String passwordConfirm;
	
	@NotNull
	private MultipartFile photo;
	
	@NotNull
	private Integer admin;
	
	@NotNull
	private Integer activated;
}
