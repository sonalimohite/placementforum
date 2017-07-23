package com.placement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.ExamDao;
import com.placement.dao.JobDao;
import com.placement.dao.QuestionDao;
import com.placement.dao.ResultDao;
import com.placement.dao.StudentDao;
import com.placement.dto.AnswerDto;
import com.placement.model.Exam;
import com.placement.model.Job;
import com.placement.model.Option;
import com.placement.model.Question;
import com.placement.model.Result;
import com.placement.model.Student;

@Service("examManager")
@Transactional
public class ExamManager {

	@Autowired
	private ExamDao examDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired 
	private JobDao jobDao;
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private ResultDao resultDao;
	
	@Autowired
	private MailManager mailManager;

	public void save(Exam exam) {

		for (Question question : exam.getQuestions()) {
			question.setExam(exam);
			for (Option option : question.getOptions()) {
				option.setQuestion(question);
			}
		}
		examDao.save(exam);
	}
	
	public Exam getById(int id){
		return examDao.getById(id);
	}
	
	public List<Exam> getAllExam(int companyId) {
		return examDao.getAllExam(companyId);
	}
	
	public void calculateScore(List<AnswerDto> answers, Integer studentId, Integer jobId){
		
		int score = 0;
		int total = 0;
		for(AnswerDto answer : answers){
			Question question = questionDao.getById(answer.getQuestionId());
			for(Option opt : question.getOptions()){
				if(opt.isAnswer() && answer.getAnswerId().equals(opt.getId())){
					score++;
				}
			}
			total++;
		}
		
		Student student = studentDao.getById(studentId);
		Job job=jobDao.getJobById(jobId);
		
		
		Result result=new Result();
		result.setJob(job);
		result.setScore(score);
		result.setStudent(student);
		result.setTotal(total);
		resultDao.save(result);
		
		String message = "Hi "+ student.getFirstName() + " "+ student.getLastName();
		message += "\n\n You have applied for job "+ job.getJobTitle() +", and your score of online exam is : " + score + " out of "+total; 
		message += "\n Our HR manager "+ job.getCompany().getHrName() +" will send you further details if you are selected for this job opening.";
		message += "\n\n\n Thank you for applying at "+ job.getCompany().getName();
		
		mailManager.send(student.getEmail(), job.getCompany().getName() + " Exam Result" , message);
		
	}
   
	public Result getResult(Integer studentId,Integer jobId){
		return resultDao.getResult(studentId, jobId);
	}
	
	public List<Result> getResult(Integer jobId){
		return resultDao.getResult(jobId);
	}
	
}
