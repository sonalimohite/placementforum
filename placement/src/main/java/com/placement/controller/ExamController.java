package com.placement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Exam;
import com.placement.service.ExamManager;

@Controller
@RequestMapping(value = "/exam")
public class ExamController {
	
	@Autowired
	private ExamManager examManager;

	@RequestMapping(value = "/examcenter")
	public ModelAndView showExam() {
		return new ModelAndView("examCenter");
	}
	
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveExam(@RequestBody Exam exam){
		
		System.out.println(exam);
		examManager.save(exam);
		return true;
	}
	
}
