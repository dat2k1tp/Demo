package com.spring.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.User;
import com.spring.repositories.UserRepository;
import com.spring.utilities.HashUtil;

@Controller
public class LoginController {
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("/login")
	public String getLoginForm() {
		return "auth/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam("email") String email,
			@RequestParam("password") String password
		) 
	{
		User entity=this.userRepo.findByEmail(email);
		HttpSession session=request.getSession();
		
		if(entity==null) {
			session.setAttribute("error", "Sai email hoac mat khau");
			return "redirect:/login";
		}
		
		boolean checkPwd=HashUtil.verify(password, entity.getPassword());
		if(!checkPwd) {
			session.setAttribute("error", "Sai email hoac mat khau");
			return "redirect:/login";
		}
		
	
		session.setAttribute("user",entity);
		if(entity!=null&&entity.getAdmin()==1) {
			//vao tam user
			return "redirect:/admin/users";
		}else if(entity!=null&&entity.getAdmin()==0) {
			//dieu huong trang san pham
			return "redirect:/home";
		}
		
		return "redirect:/login";
		
		
		
	}
}
