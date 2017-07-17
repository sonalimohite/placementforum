package com.placement.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Company;

@Repository("companyDao")
public class CompanyDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(Company entity) {
		getSession().persist(entity);
	}
	
	public Company getById(Integer id){
		Query query = getSession().createQuery("select c from Company c where c.id = :id");
		query.setParameter("id", id);
		return (Company) query.uniqueResult();
	}
	
	public Company verify(String username,String password){
		Query query=getSession().createQuery("select c from Company c where c.email = :username and c.password= :password ");
		query.setParameter("username", username);
		query.setParameter("password", password);
		return (Company)query.uniqueResult();
	}
	
	public List<Company> getAllCompanies(){
		Query query = getSession().createQuery("select a from Company a");
		
		return  query.list();
	}

}
