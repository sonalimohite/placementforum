package com.placement.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.placement.model.Student;

@Repository("studentDao")
public class StudentDao {
 
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(Student entity){
		getSession().persist(entity);
	}
	
	public List<Student> getAllStudent(){
     Query query = getSession().createQuery("select l from Student l");
		
		return  query.list();
	}
}
