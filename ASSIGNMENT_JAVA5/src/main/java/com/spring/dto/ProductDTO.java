package com.spring.dto;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private Integer id;
	
	@NotNull
	@NotBlank
	private String name;
	
	@NotNull
	private MultipartFile image;
	
	@NotNull
	private Double price;
	
	@NotNull
	private String createDate;
	
	@NotNull
	private Integer available;
	
	@NotNull
	private Integer categoryId;
	
	
}
