package com.placement.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.CompanyDao;
import com.placement.model.Company;

@Service("loginManager")
@Transactional
public class LoginManager {

	@Autowired
	private CompanyDao companyDao;

	public Company verify(String username, String password) {
		Company c = companyDao.verify(username, password);
		return c;
	}
}
