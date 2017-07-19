package com.placement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Company;
import com.placement.model.Job;
import com.placement.service.CompanyManager;
import com.placement.service.JobManager;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	@Autowired
	private CompanyManager companyManager;

	@Autowired
	private JobManager jobManager;

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		Integer companyId = (Integer) session.getAttribute("companyId");
		Company c = companyManager.getById(companyId);
		List<Job> jobs = jobManager.getJobsByCompanyId(companyId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("companyProfile");
		mv.addObject("company", c);
		mv.addObject("jobs", jobs);
		return mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("register");
	}


	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletRequest request,HttpServletResponse response, Company c) throws IOException {
		companyManager.save(c);
		response.sendRedirect(request.getContextPath()+"/login");
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView listAllCompanies(){
		List<Company> companies=companyManager.getAllCompanies();
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("company");
		mv.addObject("companies",companies);
		return mv;
		
	}

}
