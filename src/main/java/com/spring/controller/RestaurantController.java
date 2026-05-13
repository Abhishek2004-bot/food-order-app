package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.RestaurantModel;
import com.spring.service.RestaurantService;

@Controller
public class RestaurantController {

	 private final RestaurantService restaurantService;

	    public RestaurantController(RestaurantService restaurantService) {
	        this.restaurantService = restaurantService;
	    }


	
	    @GetMapping("/restaurant")
	    public String showRestaurants(Model model) {

	    	List<RestaurantModel> list = restaurantService.getAllRestaurants();

	    	
	    	System.out.println("LIST SIZE = " + list.size());
	    	System.out.println(list);

	    	model.addAttribute("hotelList", list);
	        return "restaurants"; // restaurants.jsp
	
	    }
	    
	    
	    
	    @GetMapping("/searchRestaurants")
	    public String searchRestaurants(@RequestParam("keyword") String keyword, Model model) {

	        List<RestaurantModel> list = restaurantService.searchByName(keyword);

	        model.addAttribute("hotelList", list);

	        return "restaurants"; // same page
	    }
	    
	   
	    
}
	
	
	
	
	
	
	
	
	
	
