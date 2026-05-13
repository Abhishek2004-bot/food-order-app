package com.spring.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MenuModel;
import com.spring.service.MenuService;

@Controller
public class MenuController {

	private MenuService menuService;

	public MenuController(MenuService menuService) {
		super();
		this.menuService = menuService;
	}
	
//	@GetMapping("/menu/{id}")
//	public String showMenu(@PathVariable int id, Model model) {
//
//	    List<MenuModel> menuList = menuService.getMenuByRestaurantId(id);
//
//	    model.addAttribute("menus", menuList);
//
//	    return "menu"; // menu.jsp
//	}
//	
//	
//	
//	@GetMapping("/menu")
//	public String getMenu(@RequestParam int restaurantId, Model model) {
//	    model.addAttribute("menus",
//	        menuService.getMenuByRestaurantId(restaurantId));
//	    return "menu";
//	}
	
	@GetMapping("/menu")
	public String getMenu(@RequestParam int restaurantId, Model model) {

  model.addAttribute("menus", menuService.getMenuByRestaurantId(restaurantId));

	    model.addAttribute("restaurantId", restaurantId);

	    return "menu";
	}
	

	
	
}
