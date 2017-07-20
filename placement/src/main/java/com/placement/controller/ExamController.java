package com.placement.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Company;
import com.placement.model.Exam;
import com.placement.service.CompanyManager;
import com.placement.service.ExamManager;

@Controller
@RequestMapping(value = "/exam")
public class ExamController {

	@Autowired
	private ExamManager examManager;

	@Autowired
	private CompanyManager companyManager;

	@RequestMapping(value = "/examcenter")
	public ModelAndView showExam(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int companyId = (int) session.getAttribute("companyId");
		List<Exam> exam = examManager.getAllExam(companyId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("examCenter");
		mv.addObject("examCenters", exam);
		return mv;

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveExam(HttpServletRequest request, @RequestBody Exam exam) {
		HttpSession session = request.getSession();
		int companyId = (int) session.getAttribute("companyId");
		Company company = companyManager.getById(companyId);
		exam.setCompany(company);
		examManager.save(exam);
		return true;
	}

}
