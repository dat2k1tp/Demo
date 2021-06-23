package com.spring.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.repositories.OrderDetailRepository;

@Controller
public class ReportController {
	@Autowired
	private OrderDetailRepository repo;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/admin/reports/chart")
	public String index(Model model) {
		String sortBy=request.getParameter("sort_by");
		String sortDriection=request.getParameter("sort_direction");
		String pageParams=request.getParameter("page");
		String limitParams=request.getParameter("limit");
//		
		//sap xep theo nhung gi co trong entity
		String sortField = sortBy==null?"id":sortBy;
		Sort sort=(sortDriection==null|| sortDriection.equals("asc"))?
				Sort.by(Direction.ASC,sortField):
				Sort.by(Direction.DESC,sortField);
		int page=pageParams==null?0:Integer.parseInt(pageParams);
		int limit=limitParams==null?3:Integer.parseInt(limitParams);
		
		Pageable pageable=PageRequest.of(page,limit,sort);
		Page<Object[]> list=this.repo.findReport(pageable);
		
		model.addAttribute("listReport",list);
		model.addAttribute("limit",limit);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return "admin/reports/chart";
	}
}
