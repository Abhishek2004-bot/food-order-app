package com.spring.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.model.MenuModel;
import com.spring.repository.MenuRepository;

@Service
public class MenuService {

	private MenuRepository menuRepository;
	
	
	public MenuService(MenuRepository menuRepository) {
		super();
		this.menuRepository = menuRepository;
	}
	
	
	public List<MenuModel> getMenuByRestaurantId(int id) {
		
		
		return menuRepository.findByResid(id);
		
		
		
		
	}
	
	
	  

	
	public MenuModel getMenuById(int menuId) {
		
		return menuRepository.findById(menuId)
				.orElseThrow(() -> new RuntimeException("Menu not found"));
	}



	
}







	
  
	
	
