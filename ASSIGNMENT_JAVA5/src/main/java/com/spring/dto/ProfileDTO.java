package com.spring.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProfileDTO {
	private String id;
	
	@NotNull
	@NotBlank
	private String username;
	
	@NotNull
	@NotBlank
	private String password;
	
	@NotNull
	@NotBlank
	private String passwordConfirm;
	
	private String photo;
	
}
