package com.spring.controller.user;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.Item;
import com.spring.dto.OrderDTO;
import com.spring.dto.ProductDTO;
import com.spring.entity.Category;
import com.spring.entity.Order;
import com.spring.entity.OrderDetail;
import com.spring.entity.Product;
import com.spring.entity.User;
import com.spring.mappers.OrderMapper;
import com.spring.repositories.CategoryRepository;
import com.spring.repositories.OrderDetailRepository;
import com.spring.repositories.OrderRepository;
import com.spring.repositories.ProductRepository;
import com.spring.utilities.ShoppingCartService;

@Controller
@RequestMapping("/member/cart")
public class ShoppingController {
	@Autowired
	ShoppingCartService cart;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	
	@Autowired
	private OrderMapper mapper;

	
	@GetMapping()
	public String index(Model model,OrderDTO orderDTO) {
		model.addAttribute("cart",cart);
		model.addAttribute("order",orderDTO);
		return "member/cart/index";
	}
	
	@PostMapping("/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		String catetgoryId=request.getParameter("categoryId");
		System.out.println(catetgoryId);
		String idCate=catetgoryId==null?"1":catetgoryId;
		
		
		HttpSession session=request.getSession();
		Product product=this.productRepo.getOne(id);
		
		if(product.getAvailable()==0) {
			session.setAttribute("messCart","San pham da het hang !");
		}else {
			session.setAttribute("messCart","Them gio hang thanh cong !");
			cart.add(id);
		}
		
		return "redirect:/home?categoryId="+idCate;
	}
	
	@GetMapping("/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/member/cart";
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Integer id
			,@RequestParam("qty")Integer quantity) {
		cart.update(id, quantity);
		return "redirect:/member/cart";
	}
	
	@GetMapping("/clear")
	public String clear() {
		cart.clear();
		return "redirect:/member/cart";
	}
	
	
	@PostMapping("/checkout")
	public String checkout(Model model,
			@ModelAttribute("order")
			@Valid OrderDTO order,
			BindingResult result) {
		
		if(result.hasErrors()) {
			model.addAttribute("cart",cart);
			System.out.println("co loi"+result.getAllErrors());
			return "member/cart/index";
		}else {
			HttpSession session=request.getSession();
			User auth=(User) session.getAttribute("user");
			
			order.setTelephone(order.getTelephone().trim());
			Order entity =this.mapper.convertToEntity(order);
			
			//save order
			entity.setCreateDate(LocalDateTime.now()+"");
			entity.setActivated(1);
			entity.setUser(auth);
			entity.setTotal(cart.getAmount());
			orderRepo.save(entity);
			
			//save order deatails
			for(Item item :cart.getItems()) {
				OrderDetail orderDetail=new OrderDetail();
				orderDetail.setOrder(entity);
				productRepo.findById(item.getId()).ifPresent(
						product->{
							orderDetail.setProduct(product);
				});
				orderDetail.setPrice(item.getPrice());
				orderDetail.setQuantity(item.getQuantity());
				orderDetailRepo.save(orderDetail);
		
			}
			
			session.setAttribute("buy","Dat hang thanh cong !");
			
			cart.clear();  
			return "redirect:/member/cart";	
		}
		
	}
}



//listOrderDetail.add(orderDetail);
//List<OrderDetail> listOrderDetail=new ArrayList<>();
//for(OrderDetail detail: listOrderDetail) {
//	
//}

//entity.setOrderDetail(listOrderDetail);
//System.out.println(listOrderDetail+"orderDetail");
