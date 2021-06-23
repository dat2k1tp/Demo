package com.spring.controller.admin;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.SpringVersion;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.UserDTO;
import com.spring.entity.Product;
import com.spring.entity.User;
import com.spring.mappers.UserMapper;
import com.spring.repositories.UserRepository;
import com.spring.utilities.HashUtil;
import com.spring.utilities.UploadFileUtils;



@Controller
@RequestMapping(value="/admin/users")

public class UserController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UploadFileUtils uploadFiles;
	
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
		Page<User> pageData=this.userRepo.findProductActivated(pageable);		
				
				
		model.addAttribute("pageData",pageData);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return "admin/users/index";
	}
	
	
	@GetMapping(value="{id}")
	public String show
	(
		Model model,
		@PathVariable("id") User entity
	) 
	{
		UserDTO userDTO =this.mapper.convertToDTO(entity);
		System.out.println(entity.getEmail());
		model.addAttribute("user",userDTO);
		return "admin/users/show";
	}
	
	
	@GetMapping(value="/create")
	public String create
	(Model model,UserDTO userDTO) 
	{
		model.addAttribute("user",userDTO);
		return "admin/users/create";
	}
	
	@PostMapping(value="/store")
	public String store(
			Model model,
			@ModelAttribute("user")
			@Valid UserDTO user,
			BindingResult result
			) 
	{
		if(result.hasErrors()) {
			return "admin/users/create";
		}else {
			User entity =this.mapper.convertToEntity(user);
			String hashedPassword=HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPassword);
			
			//set up anh de luu vao db
			String uuid=UUID.randomUUID().toString();
			String fileName=uuid.substring(0, 13)+"_"
			+user.getPhoto().getOriginalFilename();
			this.uploadFiles.handleUploadFile(user.getPhoto(), fileName);
			entity.setPhoto(fileName);
			
			this.userRepo.save(entity);
			return "redirect:/admin/users";
		}
		
	}
	
	@GetMapping(value="/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") User entity) {
		UserDTO user=this.mapper.convertToDTO(entity);
		model.addAttribute("user",user);
		return "admin/users/edit";
	}
	
	@PostMapping(value="/update/{id}")
	public String update(
			Model model,
			@ModelAttribute("user")
			@Valid UserDTO user,
			BindingResult result
	){
		if(result.hasErrors()) {
			System.out.println("có lỗi nhé"+result.getAllErrors());
			model.addAttribute("errors",result.getAllErrors());
			return "admin/users/edit";
		}else {
			User entity =this.mapper.convertToEntity(user);
			
			//set up anh de luu vao db
			String uuid=UUID.randomUUID().toString();
			String fileName=uuid.substring(0, 13)+"_"
			+user.getPhoto().getOriginalFilename();
			this.uploadFiles.handleUploadFile(user.getPhoto(), fileName);
			entity.setPhoto(fileName);
			
			this.userRepo.save(entity);
			System.out.println("không có lỗi");
			return "redirect:/admin/users";
		}
		
		
	}
	
	@PostMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.userRepo.deleteById(id);
		return "redirect:/admin/users/recycle-bin";
	}
	
	//SOFT DELETE
	@GetMapping(value="/recycle-bin")
	public String restore_index(Model model) {
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
		Page<User> pageData=this.userRepo.findProductUnActivated(pageable);		
				
				
		model.addAttribute("pageData",pageData);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return"admin/soft_delete/user";
	}
	
	@PostMapping(value="/restore/{id}")
	public String restore(@PathVariable("id") Integer id) {
		User entity=this.userRepo.getOne(id);
		//0 close
		entity.setActivated(1);;
		this.userRepo.save(entity);
		System.out.println("restore ok");
		return "redirect:/admin/users/recycle-bin";
	}
	
	@PostMapping(value="/soft-delete/{id}")
	public String soft_delete(@PathVariable("id") Integer id) {
		User entity=this.userRepo.getOne(id);
		entity.setActivated(0);
		this.userRepo.save(entity);
		System.out.println("soft ok");
		return "redirect:/admin/users";
	}
	
}
