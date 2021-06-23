package com.spring.controller.user;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Category;
import com.spring.entity.Product;
import com.spring.repositories.CategoryRepository;
import com.spring.repositories.ProductRepository;

@Controller
public class HomeController {
	//hien thi thong tin san pham
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	

	
	
	@RequestMapping("/home")
	public String index(Model model
			,@RequestParam("keyword") Optional<String> keyword
	) {
		
		List<Category> listCate=this.categoryRepo.findAll();
		model.addAttribute("categories",listCate);
		
		String catetgoryId=request.getParameter("categoryId");
		String sortDriection=request.getParameter("sort_direction");
		String pageParams=request.getParameter("page");
		String limitParams=request.getParameter("limit");
		String sortBy=request.getParameter("sort_by");
		
		String id=catetgoryId==null?"1":catetgoryId;
		String sortField=sortBy==null?"id":sortBy;
		Sort sort=(sortDriection==null|| sortDriection.equals("asc"))?
				Sort.by(Direction.ASC,sortField):
				Sort.by(Direction.DESC,sortField);
				
		int page=pageParams==null?0:Integer.parseInt(pageParams);
		int limit=limitParams==null?3:Integer.parseInt(limitParams);
		
		HttpSession session=request.getSession();
		String key=keyword.orElse("");
		System.out.println(key+"ok");
		session.setAttribute("keyword",key);
		

		Pageable pageable=PageRequest.of(page,limit,sort); 
		Page<Product> pageData=
				 this.productRepo.findByKeyWord(Integer.parseInt(id),"%"+key+"%",pageable);				
				
		model.addAttribute("pageData",pageData);
		model.addAttribute("cateId",id);
//		model.addAttribute("page",page);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		return "member/home";
	}

}
