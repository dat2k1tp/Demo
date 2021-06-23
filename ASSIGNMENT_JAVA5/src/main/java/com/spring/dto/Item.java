package com.spring.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	private Integer id;
	private String name;
	private Double price;
	private String image;
	private Integer available;
	private String createDate;
	private Integer categoryId;
	private Integer quantity=1;
}
