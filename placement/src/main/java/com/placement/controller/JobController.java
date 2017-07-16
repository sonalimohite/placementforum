package com.placement.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.placement.model.Company;
import com.placement.model.Job;
import com.placement.service.CompanyManager;
import com.placement.service.JobManager;

@Controller
@RequestMapping(value = "/job")
public class JobController {

	@Autowired
	JobManager jobManager;

	@Autowired
	CompanyManager companyManager;

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response, Job c) throws IOException {
		HttpSession session = request.getSession();
		int companyId = (int) session.getAttribute("companyId");
		Company company = companyManager.getById(companyId);
		c.setCompany(company);
		jobManager.save(c);
		response.sendRedirect(request.getContextPath() + "/company/profile");
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteJob(HttpServletRequest request, HttpServletResponse response, @RequestParam Integer id)
			throws IOException {
		jobManager.delete(id);
		response.sendRedirect(request.getContextPath() + "/company/profile");

	}
}
