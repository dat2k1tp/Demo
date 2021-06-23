package com.spring.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.entity.User;

@Component
public class AuthenticateInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
	)throws IOException{  
	
			HttpSession session=request.getSession();
			String uri=request.getRequestURI();
			User authUser=(User) session.getAttribute("user");
			if(authUser==null) {
				session.setAttribute("error","Vui long dang nhap");
				response.sendRedirect(request.getContextPath()+"/login");
				return false;
			}else {
				if(authUser.getAdmin()==0
						&&uri.startsWith(request.getContextPath()+"/admin")) {
						System.out.println("admin hihi");
						session.setAttribute("error","Vui long dang nhap dung phan quyen");
						response.sendRedirect(request.getContextPath()+"/login");
						return false;
						
					}else if(authUser.getAdmin()==1
						&&uri.startsWith(request.getContextPath()+"/member")) {
						System.out.println("member hihi");
						session.setAttribute("error","Vui long dang nhap dung phan quyen");
						response.sendRedirect(request.getContextPath()+"/login");
						return false;
					}
				
			}
			
			
		return true;
		
	}
}
