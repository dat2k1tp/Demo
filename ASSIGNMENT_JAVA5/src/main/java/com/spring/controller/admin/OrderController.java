package com.spring.controller.admin;

import javax.servlet.http.HttpServletRequest;
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

import com.spring.dto.UserDTO;
import com.spring.entity.Order;
import com.spring.entity.OrderDetail;
import com.spring.entity.User;
import com.spring.repositories.OrderDetailRepository;
import com.spring.repositories.OrderRepository;

@Controller
@RequestMapping(value="/admin/orders")
public class OrderController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	
	@GetMapping()
	public String index(Model model) {
		String sortBy=request.getParameter("sort_by");
		String sortDriection=request.getParameter("sort_direction");
		String pageParams=request.getParameter("page");
		String limitParams=request.getParameter("limit");
		
		String sortField = sortBy==null?"id":sortBy;
		Sort sort=(sortDriection==null|| sortDriection.equals("asc"))?
				Sort.by(Direction.ASC,sortField):
				Sort.by(Direction.DESC,sortField);
		int page=pageParams==null?0:Integer.parseInt(pageParams);
		int limit=limitParams==null?3:Integer.parseInt(limitParams);
			
		Pageable pageable=PageRequest.of(page,limit,sort);
		Page<Order> pageData=this.orderRepo.findAll(pageable);		
				
				
		model.addAttribute("pageData",pageData);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return "admin/orders/index";
	}
	
	@PostMapping(value="/update/{id}")
	public String update(
			Model model,@PathVariable("id") Integer id,
			@RequestParam("activated") Integer activated
	){
		
			Order order=this.orderRepo.getOne(id);
			order.setActivated(activated);
			this.orderRepo.save(order);
			return "redirect:/admin/orders";
	
		
		
	}
	
	@GetMapping("/order-details/{id}")
	public String order_details(Model model,@PathVariable("id") Integer id) {
		String pageParams=request.getParameter("page");
		
		Sort sort=Sort.by(Direction.ASC,"id");
		int page=pageParams==null?0:Integer.parseInt(pageParams);
		int limit=3;
			
		Pageable pageable=PageRequest.of(page,limit,sort);
		Page<OrderDetail> pageData=this.orderDetailRepo
				.findByOrderDetailsView(id, pageable);		
				
				
		model.addAttribute("pageData",pageData);
		model.addAttribute("id",id);
		return "admin/orders/order_details";
	}
	
}

