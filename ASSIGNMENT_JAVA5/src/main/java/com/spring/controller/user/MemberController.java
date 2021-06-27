package com.spring.controller.user;

import java.util.List;
import java.util.UUID;

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

import com.spring.dto.ProfileDTO;
import com.spring.entity.Order;
import com.spring.entity.OrderDetail;
import com.spring.entity.User;
import com.spring.mappers.ProfileMapper;
import com.spring.repositories.OrderDetailRepository;
import com.spring.repositories.OrderRepository;
import com.spring.repositories.UserRepository;
import com.spring.utilities.HashUtil;
import com.spring.utilities.UploadFileUtils;



@Controller
@RequestMapping(value="/member/account")
public class MemberController {
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	
	@Autowired
	private ProfileMapper mapper;
	
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UploadFileUtils uploadFiles;
	
	
	@GetMapping(value="/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") User entity) {
		ProfileDTO user=this.mapper.convertToDTO(entity);
		model.addAttribute("user",user);
		return "member/edit";
	}
	
	@PostMapping(value="/update/{id}")
	public String update(
			Model model,
			@ModelAttribute("user")
			@Valid ProfileDTO user,
			BindingResult result,
			@PathVariable("id") Integer id
	){
		
		if (user.getPhoto().getOriginalFilename().isEmpty()) {
			model.addAttribute("photoError","Anh chua duoc cap nhat !");
			return "member/edit";
		}
		else if(result.hasErrors()) {
			System.out.println("có lỗi nhé"+result.getAllErrors());
			return "member/edit";
		}else if(!user.getPasswordConfirm().equalsIgnoreCase(user.getPassword())) {
			model.addAttribute("errorPass","Password va Password Confirm phai khop nhau !");
			return "member/edit";
		}
		else {
			
			User entity =this.mapper.convertToEntity(user);
			entity.setActivated(1);
			entity.setAdmin(0);
			String hashedPassword=HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPassword);
			User entityFindEmail=this.userRepo.getOne(id);
			entity.setEmail(entityFindEmail.getEmail());
			
			//luu vao storage
			String uuid=UUID.randomUUID().toString();
			String fileName=uuid.substring(0, 13)+"_"
			+user.getPhoto().getOriginalFilename();
			this.uploadFiles.handleUploadFile(user.getPhoto(), fileName);
			//set up anh de luu vao db
			entity.setPhoto(fileName);
			
			this.userRepo.save(entity);
			System.out.println("không có lỗi");
			return "redirect:/home";
		}
		
		
	}
	
	
	@GetMapping("/order-details/{id}")
	public String order_detail(Model model,@PathVariable("id") Integer id) {
		String pageParams=request.getParameter("page");
		
		Sort sort=Sort.by(Direction.ASC,"id");
		int page=pageParams==null?0:Integer.parseInt(pageParams);
		int limit=3;
			
		Pageable pageable=PageRequest.of(page,limit,sort);
		Page<OrderDetail> pageData=this.orderDetailRepo
				.findByOrderDetailsView(id, pageable);		
				
				
		model.addAttribute("pageData",pageData);
		model.addAttribute("id",id);
		
		return "member/order_details";
	}
	
	@GetMapping("/orders")
	public String order(Model model) {
		HttpSession session=request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
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
			Page<Order> pageData=this.orderRepo.findByOrderView(user.getId(), pageable);		
					
					
			model.addAttribute("pageData",pageData);
			String sortPage=sortDriection==null?"asc":sortDriection;
			model.addAttribute("sort",sortPage);
		}
		return"member/orders";
	}
}
