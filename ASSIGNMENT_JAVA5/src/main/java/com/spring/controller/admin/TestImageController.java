package com.spring.controller.admin;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.spring.utilities.UploadFileUtils;

import org.springframework.ui.Model;

@Controller
public class TestImageController {
	@Autowired
	private ServletContext app;
	
	@Autowired
	private UploadFileUtils uploadUtil;
	
	@RequestMapping("/hello-controller")
	public String hello(Model model) {
		
		System.out.println(this.app.getRealPath(""));
		return "image";
	}
	
	@PostMapping("/upload-hello")
	public String uploadFileHello(
			@RequestParam("upload_file") MultipartFile uploadedFile
			) {
//		this.uploadUtil.handleUploadFile(uploadedFile);
//		System.out.println(this.app.getRealPath(""));
		return "redirect:/hello-controller";
	}
	
	//du lieu truc tiep
	@ResponseBody
	@GetMapping("/demo-api")
	public String demoApi() {
		return "Hello Poly";
	}
}
