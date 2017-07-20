package com.placement.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.CompanyDao;
import com.placement.dao.StudentDao;
import com.placement.model.Company;
import com.placement.model.Student;

@Service("loginManager")
@Transactional
public class LoginManager {

	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private StudentDao studentDao;

	public Company verifyCompany(String username, String password) {
		Company c = companyDao.verify(username, password);
		return c;
	}
	
	public Student verifyStudent(String username, String password) {
		Student c = studentDao.verify(username, password);
		return c;
	}
}
