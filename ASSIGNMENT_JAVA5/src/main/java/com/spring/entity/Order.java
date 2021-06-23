package com.spring.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="create_date")
	private String createDate;
	
	@Column(name="address")
	private String address;
	
	@Column(name="telephone")
	private String telephone;
	
	@Column(name="activated")
	private Integer activated;
	
	@Column(name="total")
	private Double total;
	
	@ManyToOne()
	@JoinColumn(name="user_id",referencedColumnName = "id")
	private User user;
	
	@OneToMany(mappedBy ="order")
	List<OrderDetail> orderDetail;
}
