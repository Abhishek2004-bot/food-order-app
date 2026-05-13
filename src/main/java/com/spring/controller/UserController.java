package com.spring.controller;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.UserModel;
import com.spring.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	 private UserService userService;
	        
	public UserController(UserService userService) {
		
		this.userService = userService;
	}
	
	
	   @GetMapping("/")
	    public String home() {
	        return "homepage";
	    }
	


		
	@GetMapping("/register")
	public String showRegister() {
	    return "register";
	}
	
	@PostMapping("/register")
	public String registerUser(UserModel user) {
		
		// just printing for now
		
		System.out.println(user.getName());
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		System.out.println(user.getPhone());
		System.out.println(user.getAddress());
		// set created date
		user.setCreatedDate(LocalDateTime.now());
		
		// login date initially null or same
		user.setLoginDate(null);
		
		boolean status = userService.saveUser(user);
		
		if(status) {
			return "login"; 
		}
		else {
			return "error";
		}
	}	
		//Login
		
		
		
		@GetMapping("/login")
		public String loginPage() {
		    return "login";
		}
		
		@PostMapping("/ulogin")
		public String loginUser(@RequestParam("email") String email,
		                        @RequestParam String password,
		                        HttpSession session) {
			
		    // fetch full user 
			UserModel user = userService.loginUser(email,password);
			
			 if (user != null) {

			        // store user in session
			        session.setAttribute("userId", user.getId());
			        session.setAttribute("userName", user.getName());

			        return "redirect:/restaurant";
			    }

			    return "login";
			
		
		}

			
		}



		
		
		

	
	

             
		      
		


	        
	        
	        
	      
	        

