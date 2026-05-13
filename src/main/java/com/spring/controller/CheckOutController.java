package com.spring.controller;

import java.math.BigDecimal; // ✅ IMPORTANT
import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.CartModel;
import com.spring.model.CheckOutModel;
import com.spring.service.CheckOutService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/checkout")
public class CheckOutController {

    private CheckOutService checkOutService;

    public CheckOutController(CheckOutService checkOutService) {
        this.checkOutService = checkOutService;
    }

    // =========================
    // SHOW CHECKOUT PAGE
    // =========================
    @GetMapping
    public String checkoutPage(HttpSession session, Model model) {

        // check login
        if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }

        // check cart
        CartModel cart = (CartModel) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            return "redirect:/cart";
        }

        
        // ✅ calculate totals
        BigDecimal total = cart.getTotalPrice();
        BigDecimal delivery = new BigDecimal("40");
        BigDecimal grandTotal = total.add(delivery);

        // send to JSP
        model.addAttribute("grandTotal", grandTotal);

        return "checkout";
    }

    
    // =========================
    // PLACE ORDER
    // =========================
    @PostMapping("/placeOrder")
    public String placeOrder(CheckOutModel order, HttpSession session, Model model) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        CartModel cart = (CartModel) session.getAttribute("cart");
        if (cart == null) {
            return "redirect:/cart";
        }

        BigDecimal total = cart.getTotalPrice();
        BigDecimal delivery = new BigDecimal("40");
        BigDecimal grandTotal = total.add(delivery);

        // set order details
        order.setUser_id(userId);
        order.setRestaurant_id(cart.getRestaurantId());
        order.setOrder_date(LocalDateTime.now());
        order.setTotal_amount(grandTotal);
        order.setStatus("Pending");

        // save order
        checkOutService.orderPlace(order, cart);

        // clear cart
        session.removeAttribute("cart");

        // 🔥 ADD THIS (VERY IMPORTANT FOR SUCCESS PAGE)
        model.addAttribute("orderId", order.getOrder_id());
        model.addAttribute("deliveryTime", "30-40 mins");

        return "paymentpage";
    }
    
    @GetMapping("/track-order")
    public String trackOrder(@RequestParam("orderId") Long orderId, Model model) {

        model.addAttribute("orderId", orderId);

        return "trackorder"; // JSP name: track-order.jsp
    }
    
    
}