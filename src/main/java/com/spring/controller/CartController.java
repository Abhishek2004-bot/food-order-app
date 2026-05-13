package com.spring.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.CartItemModel;
import com.spring.model.CartModel;
import com.spring.model.MenuModel;
import com.spring.service.MenuService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

    private final MenuService menuService;

    public CartController(MenuService menuService) {
        this.menuService = menuService;
    }

    
    
    
    
    // =========================
    // ➕ ADD TO CART
    // =========================
    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam int menuId,
                            @RequestParam int restaurantId,
                            @RequestParam int quantity,
                            HttpSession session,
                            Model model) {
    	
        // 1. check login user
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }
        
        
        
        CartModel cart = (CartModel) session.getAttribute("cart");

        if (cart == null) {
            cart = new CartModel();
            
            cart.setUser_id(userId);
            cart.setRestaurantId(restaurantId);
            cart.setItems(new ArrayList<>());
        }

        // 🚨 different restaurant check
        if (cart.getRestaurantId() != null &&
            !cart.getRestaurantId().equals(restaurantId)) {

            model.addAttribute("showConfirm", true);
            model.addAttribute("newMenuId", menuId);
            model.addAttribute("newRestaurantId", restaurantId);
            model.addAttribute("menus",
                    menuService.getMenuByRestaurantId(restaurantId));

            return "menu";
        }

        // =========================
        // ➕ ADD / UPDATE ITEM
        // =========================
        boolean found = false;

        for (CartItemModel item : cart.getItems()) {

            if (item.getMenu().getMid() == menuId) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            MenuModel menu = menuService.getMenuById(menuId);

            CartItemModel newItem = new CartItemModel();
            newItem.setMenu(menu);
            newItem.setQuantity(quantity);

            cart.getItems().add(newItem);
        }

        session.setAttribute("cart", cart);

        return "redirect:/cart";
    }

    

    
    
    
    // =========================
    // 🛒 SHOW CART
    // =========================
  

    // =========================
    // 🔄 REPLACE CART
    // =========================
    @PostMapping("/replace-cart")
    public String replaceCart(@RequestParam int menuId,
                              @RequestParam int restaurantId,
                              HttpSession session) {

        CartModel cart = new CartModel();
        cart.setRestaurantId(restaurantId);
        cart.setItems(new ArrayList<>());

        MenuModel menu = menuService.getMenuById(menuId);

        CartItemModel item = new CartItemModel();
        item.setMenu(menu);
        item.setQuantity(1);

        cart.getItems().add(item);

        session.setAttribute("cart", cart);
       
        

        return "redirect:/cart";
    }

    
    
    @GetMapping("/cart")
    public String showCart(HttpSession session, Model model) {

        CartModel cart = (CartModel) session.getAttribute("cart");

        model.addAttribute("cart", cart);

        return "cart";
    }
    
    // =========================
    // ➕ INCREASE
    // =========================
    @PostMapping("/increase")
    public String increase(@RequestParam int menuId, HttpSession session) {

        CartModel cart = (CartModel) session.getAttribute("cart");

        if (cart != null) {
            for (CartItemModel item : cart.getItems()) {

                if (item.getMenu().getMid() == menuId) {
                    item.setQuantity(item.getQuantity() + 1);
                    break;
                }
            }
        }

        session.setAttribute("cart", cart); // ✅ save back
        return "redirect:/cart";
    }

    // =========================
    // ➖ DECREASE
    // =========================
    @PostMapping("/decrease")
    public String decrease(@RequestParam int menuId, HttpSession session) {

        CartModel cart = (CartModel) session.getAttribute("cart");

        if (cart != null) {
            for (CartItemModel item : cart.getItems()) {

                if (item.getMenu().getMid() == menuId &&
                    item.getQuantity() > 1) {

                    item.setQuantity(item.getQuantity() - 1);
                    break;
                }
            }
        }

        session.setAttribute("cart", cart); // ✅ save back
        return "redirect:/cart";
    }

    // =========================
    // ❌ REMOVE ITEM
    // =========================
    @PostMapping("/remove-item")
    public String removeItem(@RequestParam int menuId, HttpSession session) {

        CartModel cart = (CartModel) session.getAttribute("cart");

        if (cart != null) {
            cart.getItems().removeIf(
                item -> item.getMenu().getMid() == menuId
            );
        }

        session.setAttribute("cart", cart); // ✅ save back
        return "redirect:/cart";
    }
    
    
    
   
    
}









