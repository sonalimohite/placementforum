package com.placement.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Question;

@Repository("questionDao")
public class QuestionDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public Question getById(Integer id){
		Query query = getSession().createQuery("select q from Question q where q.id = :id");
		query.setParameter("id",id);
		return (Question) query.uniqueResult();
	}

}
