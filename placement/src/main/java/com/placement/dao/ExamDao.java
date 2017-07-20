package com.placement.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Exam;

@Repository("examDao")
public class ExamDao {

	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(Exam entity) {
		getSession().persist(entity);
	}

	public Exam getById(int id){
		Query query = getSession().createQuery("select e from Exam e where e.id = :id");
		query.setParameter("id",id);
		return (Exam)query.uniqueResult();		
	}
	
	public List<Exam> getAllExam(int companyId) {
		Query query = getSession().createQuery("select e from Exam e where e.company.id = :companyId");
		query.setParameter("companyId", companyId);
		return query.list();

	}
}
