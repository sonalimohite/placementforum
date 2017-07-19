package com.placement.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.ExamDao;
import com.placement.model.Exam;
import com.placement.model.Option;
import com.placement.model.Question;

@Service("examManager")
@Transactional
public class ExamManager {

	@Autowired
	private ExamDao examDao;

	public void save(Exam exam) {

		for (Question question : exam.getQuestions()) {
			question.setExam(exam);
			for (Option option : question.getOptions()) {
				option.setQuestion(question);
			}
		}
		examDao.save(exam);
	}

}
