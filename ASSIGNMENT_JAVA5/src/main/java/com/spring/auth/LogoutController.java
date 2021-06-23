package com.spring.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {
	
	@Autowired
	HttpServletRequest request;
	
	@GetMapping("/logout")
	public String logout() {
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return "redirect:/login";
	}
}
