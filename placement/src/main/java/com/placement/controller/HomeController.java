package com.placement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Job;
import com.placement.service.JobManager;
import com.placement.service.MailManager;

@Controller
public class HomeController {

	@Autowired
	private JobManager jobManager;

	@Autowired
	private MailManager mailManager;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		List<Job> jobs = jobManager.getAllJobs();
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("uiJobs", jobs);
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	@ResponseBody
	public String test(){
		mailManager.send("digvijaymohite27@gmail.com", "Test", "Testing");
		return "Done";
	}
	

	
}
