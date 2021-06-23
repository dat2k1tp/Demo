package com.spring.auth;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dto.RegisterDTO;
import com.spring.dto.UserDTO;
import com.spring.entity.User;
import com.spring.mappers.RegisterMapper;
import com.spring.repositories.UserRepository;
import com.spring.utilities.HashUtil;

@Controller
public class RegisterController {
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RegisterMapper mapper;
	
	@GetMapping(value="/register")
	public String create
	(Model model,RegisterDTO registerDTO) 
	{
		model.addAttribute("user",registerDTO);
		return "auth/register";
	}
	
	@PostMapping(value="/register/store")
	public String store(
			Model model,
			@ModelAttribute("user")
			@Valid RegisterDTO user,
			BindingResult result
			
			) 
	{
		List<User> listUser=this.userRepo.findAll();
		for(User userData:listUser) {
			if(userData.getEmail().equals(user.getEmail())) {
				model.addAttribute("errorEmail","Email khong duoc trung !");
				return "auth/register";
			}
			
		}
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors()+"bug");
			return "auth/register";
		}
		
		else if(!user.getPasswordConfirm().equalsIgnoreCase(user.getPassword())) {
			model.addAttribute("errorPass","Password va Password Confirm phai khop nhau !");
			return "auth/register";
		}
		else {
			User entity =this.mapper.convertToEntity(user);
			String hashedPassword=HashUtil.hash(entity.getPassword());
			entity.setPassword(hashedPassword);
			entity.setPhoto("default img");
			entity.setActivated(1);
			entity.setAdmin(0);
			this.userRepo.save(entity);

			return "redirect:/login";
		}
		
	}
	
	
}

//type="success";
//model.addAttribute("type",type);
//model.addAttribute("mess","Dang ky thanh cong !");
