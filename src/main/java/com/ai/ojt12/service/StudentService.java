package com.ai.ojt12.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.ojt12.dto.Student;
import com.ai.ojt12.repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	private StudentRepository stuRepo;
	public boolean checkPhoneAlreadyExist(String phone) {
		Student student=stuRepo.findStudentByPhone(phone);
		if(student==null) {
			return false;
		}else {
			return true;
		}
	}

}
