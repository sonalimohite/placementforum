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
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Company;
import com.placement.model.Exam;
import com.placement.model.Job;
import com.placement.model.Student;
import com.placement.service.CompanyManager;
import com.placement.service.ExamManager;
import com.placement.service.JobManager;
import com.placement.service.StudentManager;

@Controller
@RequestMapping(value = "/job")
public class JobController {

	@Autowired
	JobManager jobManager;

	@Autowired
	CompanyManager companyManager;
	
	@Autowired
	StudentManager studentManager;

	@Autowired
	ExamManager examManager;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response, Job job) throws IOException {
		HttpSession session = request.getSession();
		int companyId = (int) session.getAttribute("companyId");
		Company company = companyManager.getById(companyId);
		job.setCompany(company);
		
		Exam exam = examManager.getById(job.getExam().getId());
		job.setExam(exam);
		jobManager.save(job);
		response.sendRedirect(request.getContextPath() + "/company/profile");
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteJob(HttpServletRequest request, HttpServletResponse response, @RequestParam Integer id)
			throws IOException {
		jobManager.delete(id);
		response.sendRedirect(request.getContextPath() + "/company/profile");

	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewJob(@RequestParam Integer id) {

		Job job = jobManager.getJobById(id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewJob");
		mv.addObject("job", job);
		return mv;

	}
	
	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response, @RequestParam Integer id) throws IOException{
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("studentId") != null){
			Integer sId=(Integer) session.getAttribute("studentId");
			Student student=studentManager.getById(sId);
			Job job = jobManager.getJobById(id);
			ModelAndView mv = new ModelAndView("exam");
			mv.addObject("job", job);
			mv.addObject("student",student);
			return mv;
		}
		response.sendRedirect(request.getContextPath()+"/login");
		return null;
	}	

}
