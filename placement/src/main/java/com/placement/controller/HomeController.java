package com.placement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Company;
import com.placement.model.Job;
import com.placement.service.CompanyManager;
import com.placement.service.JobManager;

@Controller
public class HomeController {

	@Autowired
	private CompanyManager companyManager;

	
	@Autowired
	private JobManager jobManager;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
	List<Job> jobs=jobManager.getAllJobs();
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("uiJobs",jobs);
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("register");
	}
	
	
}
