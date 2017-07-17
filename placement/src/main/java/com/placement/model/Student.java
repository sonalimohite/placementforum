package com.placement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="student")
public class Student {
     
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	
	@Column(name="first_name" , nullable=false)
	 private String firstName;
	 
	 @Column(name="last_name" , nullable=false)
	 private String lastName;
	 
	 @Column(name="college_name" , nullable=false)
	 private String collegeName;
	 
	 @Column(name="email" , nullable=false)
	 private String email;
	 
	 @Column(name="password" , nullable=false)
	 private String password;
	 
	 @Column(name="qualification" , nullable=false)
	 private String qualification;
	 
	 @Column(name="year_of_passing" , nullable=false)
	 private int yearOfPassing;
	 
	 @Column(name="branch" , nullable=false)
	 private String branch;
	 
	 
	 public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getYearOfPassing() {
		return yearOfPassing;
	}

	public void setYearOfPassing(int yearOfPassing) {
		this.yearOfPassing = yearOfPassing;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	
}
