package com.placement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.placement.model.Student;
import com.placement.service.StudentManager;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	@Autowired
	private StudentManager studentManager;
	
	
	@RequestMapping(value="/register")
	public ModelAndView register(){
		return new ModelAndView("studRegister");
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(Student s) {
		studentManager.save(s);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studRegister");
		mv.addObject("msg", "Registration successfull");
		return mv;
	}
	
	@RequestMapping(value="/list", method =RequestMethod.GET)
	public ModelAndView listAllStudents(){
		List<Student> student=studentManager.getAllStudents();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("student");
		mv.addObject("students",student);
		return mv;
	}

}
