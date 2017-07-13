package com.placement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Company;
import com.placement.service.CompanyManager;

@Controller
@RequestMapping(value="/company")
public class CompanyController {

	@Autowired
	CompanyManager companyManager;
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public ModelAndView save(Company c){
		companyManager.save(c);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("register");
		
		mv.addObject("msg","Registration Successfull");
		return mv;
	}
}
