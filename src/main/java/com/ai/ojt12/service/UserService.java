package com.ai.ojt12.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.ojt12.dto.User;
import com.ai.ojt12.repository.UserRepositroy;

@Service
public class UserService {
		@Autowired
		private UserRepositroy userRepo;
		
		public boolean CheckEmailAndPassword(String email,String password) {
			User user=userRepo.findUserByEmail(email);
			if(user==null) {
				return false;
			}else {
				if(password.equals(user.getPassword())) {
					return true;
				}
			}
			return false;
		}
}
