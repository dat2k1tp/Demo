package com.spring.utilities;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.spring.dto.Item;
import com.spring.entity.Product;
import com.spring.mappers.ItemMapper;
import com.spring.repositories.ProductRepository;


@SessionScope
@Service
public class ShoppingCartServiceImp implements ShoppingCartService{
	Map<Integer,Item> map= new HashMap<>();
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private ItemMapper mapper;
	
	@Autowired
	HttpServletRequest request;
	
	//them vao gio hang
	@Override
	public Item add(Integer id) {
		Item cart=map.get(id);
		Product product=this.productRepo.getOne(id);
		HttpSession session=request.getSession();
		if(cart==null) {
			cart=this.mapper.convertToDTO(product);
			cart.setQuantity(1);
			map.put(id,cart);
		}else if(product.getAvailable()<=cart.getQuantity()) {
			session.removeAttribute("messCart");
			session.setAttribute("errorCart","So luong khong phu hop !");
		}
		else{
			cart.setQuantity(cart.getQuantity()+1);
		}
		return cart;
	}
	
	
	
	//xoa tung mon hang =id
	@Override
	public void remove(Integer id) {
		map.remove(id);
		
	}
	
	
	//thay doi so luong hang=id
	@Override
	public Item update(Integer id, Integer qty) {
		Item cart=map.get(id);
		Product product=this.productRepo.getOne(id);
		HttpSession session=request.getSession();
		if(qty>product.getAvailable()) {
			session.setAttribute("errorCart","So luong khong phu hop !");
		}else if(qty<0) {
			session.setAttribute("errorCart","So luong >0 !");
		}else {
			cart.setQuantity(qty);
		}
		
		return cart;
	}
	
	
	//clear all cart
	@Override
	public void clear() {
		map.clear();
		
	}
	
	//ds cac mon hang
	@Override
	public Collection<Item> getItems() {
		return map.values();
	}
	
	
	//tong so luong hang
	@Override
	public int getCount() {
		
		return map.values().stream().mapToInt(cart->cart.getQuantity()).sum();
	}
	
	//tong so luong tien
	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(cart->cart.getQuantity()*cart.getPrice()).sum();
	}
	
	
	
}
