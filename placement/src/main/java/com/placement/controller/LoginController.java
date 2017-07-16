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
import com.placement.service.LoginManager;

@Controller
@RequestMapping(value = "/auth")
public class LoginController {

	@Autowired
	private LoginManager loginManager;

	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	public ModelAndView verify(HttpServletRequest request, HttpServletResponse response, @RequestParam String username,
			@RequestParam String password) throws IOException {
		Company company = loginManager.verify(username, password);
		if (company != null) {

			HttpSession session = request.getSession(true);
			session.setAttribute("companyId", company.getId());
			response.sendRedirect(request.getContextPath() + "/company/profile");
		}

		return null;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath());
	}
}
