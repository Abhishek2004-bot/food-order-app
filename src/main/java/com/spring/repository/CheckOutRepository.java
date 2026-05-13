package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.CartModel;
import com.spring.model.CheckOutModel;

public interface CheckOutRepository extends JpaRepository<CheckOutModel , Integer > {

	

}
