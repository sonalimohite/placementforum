package com.placement.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.CompanyDao;
import com.placement.dto.CompanyDto;
import com.placement.model.Company;

@Service("companyManager")
@Transactional
public class CompanyManager {

	@Autowired
	private CompanyDao companyDao;

	public Company getById(Integer id){
		return companyDao.getById(id);
	}
    public void save(Company c){
    	companyDao.save(c);
    }
	
	
}
