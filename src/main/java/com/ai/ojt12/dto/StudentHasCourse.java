package com.ai.ojt12.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedStoredProcedureQuery;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureParameter;
import jakarta.persistence.Transient;

@Entity
@Component
@NamedStoredProcedureQuery(name = "deleteStudentCourseById",
procedureName = "deleteStudentCourseById",
parameters = {@StoredProcedureParameter(name="sc_student_id",mode=ParameterMode.IN,type=String.class)},
resultClasses = {StudentHasCourse.class})
public class StudentHasCourse {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@JoinColumn(name="student_id")
	@ManyToOne
	private Student student;
	@Transient
	private String []course_id;
	@Transient
	private String student_id;
	@JoinColumn(name="course_id")
	@ManyToOne
	private Course course;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	

	public String[] getCourse_id() {
		return course_id;
	}

	public void setCourse_id(String[] course_id) {
		this.course_id = course_id;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	
}
