package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.model.RestaurantModel;
import com.spring.repository.RestaurantRepository;

@Service
public class RestaurantService {
  
	
	  private  RestaurantRepository repo;

	    public RestaurantService(RestaurantRepository repo) {
	        this.repo = repo;
	    }
	
	
	    public List<RestaurantModel> getAllRestaurants() {
	        return repo.findAll(); 
	    }


	    public List<RestaurantModel> searchByName(String keyword) {
	        return repo.findByRnameContainingIgnoreCase(keyword);
	    }
	    
	

}
