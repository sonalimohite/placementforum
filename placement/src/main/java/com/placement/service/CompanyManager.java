package com.placement.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.CompanyDao;
import com.placement.model.Company;

@Service("companyManager")
@Transactional
public class CompanyManager {

	//@Autowired
	private CompanyDao companyDao;

	public void saveCompany(Company company) {
		companyDao.save(company);
	}
}
