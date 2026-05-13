package com.spring.service;

import java.time.LocalDateTime;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.spring.model.UserModel;
import com.spring.repository.UserRepository;
@Service
public class UserService {

	private UserRepository userRepository;
	
	
	
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}
	
	
	public Boolean saveUser(UserModel user) {
		
		
		// ENCRYPT PASSWORD using jBCrypt
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		
		
		
		// check if email already exists
		UserModel existingUser = userRepository.findByEmail(user.getEmail());
		
		if (existingUser != null) {
			return false;
		}
		
		
		// if not exists, save user
		userRepository.save(user);
		
		return true;
		
		
		
		
	}
	
	//Login
	public UserModel loginUser(String email, String password) {

	    UserModel user = userRepository.findByEmail(email);

	    if (user == null) {
	        return null;
	    }
	    
	    
	    boolean match =  BCrypt.checkpw(password, user.getPassword());
	    
	    if (!match) {
	        return null;
	    }
	    
	    	 // ✔ set login date here
	        user.setLoginDate(LocalDateTime.now());
	        userRepository.save(user);

	        return user;
	    }

	
	
		
}
		
	











