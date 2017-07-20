package com.placement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.StudentDao;
import com.placement.model.Student;

@Service("studentManager")
@Transactional

public class StudentManager {

	@Autowired
	private StudentDao studentDao;

	public void save(Student j) {
		studentDao.save(j);
	}
	
	public List<Student> getAllStudents(){
		return studentDao.getAllStudent();
	}
	public Student getById(Integer id){
		return studentDao.getById(id);
	}

}
