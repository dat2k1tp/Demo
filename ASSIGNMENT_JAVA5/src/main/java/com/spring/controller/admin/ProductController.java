package com.spring.controller.admin;



import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
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

import com.spring.dto.ProductDTO;
import com.spring.entity.Category;
import com.spring.entity.Product;
import com.spring.mappers.ProductMapper;
import com.spring.repositories.CategoryRepository;
import com.spring.repositories.ProductRepository;
import com.spring.utilities.UploadFileUtils;


@Controller
@RequestMapping(value="/admin/products")
public class ProductController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private UploadFileUtils uploadFiles;

	
	@RequestMapping()
	public String index(Model model,
			@RequestParam("keyword") Optional<String> keyword) {
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
		
		return "admin/products/index";
	}
	
	
	
	@GetMapping(value="{id}")
	public String show
	(
		Model model,
		@PathVariable("id") Product entity
	) 
	{
		ProductDTO productDTO =this.mapper.convertToDTO(entity);
		model.addAttribute("product",productDTO);
		return "admin/products/show";
	}
	
	
	@GetMapping(value="/create")
	public String create
	(Model model,ProductDTO productDTO) 
	{
		
		List<Category> listCate=this.categoryRepo.findAll();
		productDTO.setCreateDate(LocalDateTime.now()+"");
		model.addAttribute("categories",listCate);
		model.addAttribute("product",productDTO);
		
		return "admin/products/create";
	}
	
	@PostMapping(value="/store")
	public String store(
			Model model,
			@ModelAttribute("product")
			@Valid ProductDTO product,
			BindingResult result
			) 
	{
		List<Category> listCate=this.categoryRepo.findAll();
		model.addAttribute("categories",listCate);
		
		
		if(result.hasErrors()) {
			System.out.println("co loi"+result.getAllErrors());
			return "admin/products/create";
		}else {
			Product entity =this.mapper.convertToEntity(product);
			System.out.println("Id"+entity.getCategory());
			entity.setDelete_at(0);
			
			//set up anh de luu vao db
			String uuid=UUID.randomUUID().toString();
			String fileName=uuid.substring(0, 13)+"_"
			+product.getImage().getOriginalFilename();
			this.uploadFiles.handleUploadFile(product.getImage(), fileName);
			entity.setImage(fileName);
			
			this.productRepo.save(entity);
			return "redirect:/admin/products";
		}
		
	}
	
	@GetMapping(value="/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Product entity) {
		List<Category> listCate=this.categoryRepo.findAll();
		model.addAttribute("categories",listCate);
		ProductDTO product=this.mapper.convertToDTO(entity);
		model.addAttribute("product",product);
		return "admin/products/edit";
	}
	
	@PostMapping(value="/update/{id}")
	public String update(
			Model model,
			@ModelAttribute("product")
			@Valid ProductDTO product,
			BindingResult result
	){
		List<Category> listCate=this.categoryRepo.findAll();
		model.addAttribute("categories",listCate);
		if(result.hasErrors()) {
			model.addAttribute("errors",result.getAllErrors());
			return "admin/products/edit";
		}else {
			Product entity =this.mapper.convertToEntity(product);
			entity.setDelete_at(0);
			
			//set up anh de luu vao db
			String uuid=UUID.randomUUID().toString();
			String fileName=uuid.substring(0, 13)+"_"
			+product.getImage().getOriginalFilename();
			this.uploadFiles.handleUploadFile(product.getImage(), fileName);
			entity.setImage(fileName);
			
			this.productRepo.save(entity);
			System.out.println("không có lỗi");
			return "redirect:/admin/products";
		}
		
		
	}
	@PostMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.productRepo.deleteById(id);
		return "redirect:/admin/products/recycle-bin";
	}
	
	//SOFT DELETE
	@PostMapping(value="/soft-delete/{id}")
	public String soft_delete(@PathVariable("id") Integer id) {
		Product entity=this.productRepo.getOne(id);
		entity.setDelete_at(1);
		this.productRepo.save(entity);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/recycle-bin")
	public String restore_index(Model model,
			@RequestParam("keyword") Optional<String> keyword) {
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
				 this.productRepo.findByProductSotfDelete
				 (Integer.parseInt(id),"%"+key+"%",pageable);				
				
		model.addAttribute("pageData",pageData);
		model.addAttribute("cateId",id);
		String sortPage=sortDriection==null?"asc":sortDriection;
		model.addAttribute("sort",sortPage);
		model.addAttribute("sort_by",sortField);
		
		
		return "admin/soft_delete/product";
	}
	
	@PostMapping(value="/restore/{id}")
	public String restore(@PathVariable("id") Integer id) {
		Product entity=this.productRepo.getOne(id);
		entity.setDelete_at(0);
		this.productRepo.save(entity);
		System.out.println("soft ok");
		return "redirect:/admin/products/recycle-bin";
	}
}
