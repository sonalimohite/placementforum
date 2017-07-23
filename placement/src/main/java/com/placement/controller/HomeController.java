package com.placement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Job;
import com.placement.service.JobManager;
import com.placement.service.MailManager;

@Controller
public class HomeController {

	@Autowired
	private JobManager jobManager;

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

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String query) {
		List<Job> jobs = jobManager.getJobBySkill(query);
		ModelAndView mv = new ModelAndView("search");
		mv.addObject("jobs", jobs);
		return mv;
	}

}
