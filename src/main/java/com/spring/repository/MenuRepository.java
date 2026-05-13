package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.model.MenuModel;

@Repository
public interface MenuRepository extends JpaRepository<MenuModel, Integer > {


    List<MenuModel> findByResid(int id);
	
	
	
	
}




