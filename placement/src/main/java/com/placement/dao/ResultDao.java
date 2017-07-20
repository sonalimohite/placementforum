package com.placement.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Result;

@Repository("resultDao")
public class ResultDao {

	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(Result entity) {
		getSession().persist(entity);
	}

	public Result getResult(Integer studentId, Integer jobId) {
		Query query = getSession()
				.createQuery("select r from Result r where r.job.id=:jobId and r.student.id=:studentId");
		query.setParameter("jobId", jobId);
		query.setParameter("studentId", studentId);
		return (Result) query.uniqueResult();
	}
	
	public List<Result> getResult(Integer jobId){
		Query query=getSession().createQuery("select r from Result r where r.job.id=:id");
		query.setParameter("id", jobId);
		return query.list();
	}

}
