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

import com.spring.dto.CategoryDTO;
import com.spring.entity.Category;
import com.spring.entity.User;
import com.spring.mappers.CategoryMapper;
import com.spring.repositories.CategoryRepository;
import com.spring.utilities.HashUtil;

@Controller
@RequestMapping(value="/admin/categories")
public class CategoryController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Autowired
	private CategoryMapper mapper;
	
	
	
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
		Page<Category> pageData=this.categoryRepo.findCategoryUnSoftDelete(pageable);		
				
				
		model.addAttribute("pageData",pageData);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return "admin/categories/index";
	}
	
	

	
	
	@GetMapping(value="/create")
	public String create
	(Model model,CategoryDTO categoryDTO) 
	{
		model.addAttribute("category",categoryDTO);
		return "admin/categories/create";
	}
	
	@PostMapping(value="/store")
	public String store(
			Model model,
			@ModelAttribute("category")
			@Valid CategoryDTO category,
			BindingResult result
			) 
	{
		if(result.hasErrors()) {
			return "admin/categories/create";
		}else {
			Category entity =this.mapper.convertToEntity(category);
			entity.setDelete_at(0);
			this.categoryRepo.save(entity);
			return "redirect:/admin/categories";
		}
		
	}
	
	@GetMapping(value="/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Category entity) {
		CategoryDTO category=this.mapper.convertToDTO(entity);
		model.addAttribute("category",category);
		return "admin/categories/edit";
	}
	
	@PostMapping(value="/update/{id}")
	public String update(
			Model model,
			@ModelAttribute("category")
			@Valid CategoryDTO category,
			BindingResult result
	){
		if(result.hasErrors()) {
			model.addAttribute("errors",result.getAllErrors());
			return "admin/categories/edit";
		}else {
			Category entity =this.mapper.convertToEntity(category);
			entity.setDelete_at(0);
			this.categoryRepo.save(entity);
			return "redirect:/admin/categories";
		}
		
		
	}
	
	
	@PostMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.categoryRepo.deleteById(id);
		return "redirect:/admin/categories/recycle-bin";
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
		Page<Category> pageData=this.categoryRepo.findCategorySotfDelete(pageable);		
				
				
		model.addAttribute("pageData",pageData);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		return "admin/soft_delete/category";
	}
	
	@PostMapping(value="/restore/{id}")
	public String restore(@PathVariable("id") Integer id) {
		Category entity=this.categoryRepo.getOne(id);
		entity.setDelete_at(0);
		this.categoryRepo.save(entity);
		System.out.println("restore ok");
		return "redirect:/admin/categories/recycle-bin";
	}
	
	@PostMapping(value="/soft-delete/{id}")
	public String soft_delete(@PathVariable("id") Integer id) {
		Category entity=this.categoryRepo.getOne(id);
		entity.setDelete_at(1);;
		this.categoryRepo.save(entity);
		System.out.println("soft ok");
		return "redirect:/admin/categories";
	}
}
