package com.placement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model){
        model.addAttribute("message", "Spring MVC XML Config Example");
        return "index";
    }

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public ModelAndView login(){
    	return new ModelAndView("login");
    }
    
    @RequestMapping(value="/register", method = RequestMethod.GET)
    public ModelAndView register(){
    	return new ModelAndView("register");
    }
}
