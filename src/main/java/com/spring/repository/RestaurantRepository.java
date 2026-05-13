package com.spring.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.model.RestaurantModel;

@Repository
public interface RestaurantRepository extends JpaRepository<RestaurantModel, Integer> { 

	List<RestaurantModel> findByRnameContainingIgnoreCase(String rname);
	
}
