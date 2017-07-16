package com.placement.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Job;

@Repository("jobDao")
public class JobDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(Job entity) {
		getSession().persist(entity);
	}
	
	public List<Job> getAllJobs(){
		Query query=getSession().createQuery("select j from Job j ");
		return query.list();
		
	}
	
	public List<Job> getJobsByCompanyId(int companyId){
		Query query=getSession().createQuery("select i from Job i where i.company.id=:id");
		query.setParameter("id", companyId);
		return query.list();
	}

}
