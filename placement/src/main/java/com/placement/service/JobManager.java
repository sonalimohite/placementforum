package com.placement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.placement.dao.JobDao;
import com.placement.model.Job;

@Service("jobManager")
@Transactional
public class JobManager {

	@Autowired
	private JobDao jobDao;

	public void save(Job e) {
		jobDao.save(e);
	}

	public List<Job> getAllJobs() {
		return jobDao.getAllJobs();
	}

	public List<Job> getJobsByCompanyId(int companyId) {
		return jobDao.getJobsByCompanyId(companyId);
	}

	public void delete(Integer id) {

		jobDao.delete(id);
	}

	public Job getJobById(Integer id) {
		return jobDao.getJobById(id);
	}

	public List<Job> getJobBySkill(String query) {
		return jobDao.getJobBySkill(query);
	}
}
