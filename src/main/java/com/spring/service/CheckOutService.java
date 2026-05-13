package com.spring.service;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.CartItemModel;
import com.spring.model.CartModel;
import com.spring.model.CheckOutModel;
import com.spring.model.OrderItemModel;
import com.spring.repository.CheckOutRepository;
import com.spring.repository.OrderItemRepository;

@Service
public class CheckOutService {

    private final OrderItemRepository orderItemRepository;
    private final CheckOutRepository checkOutRepository;

    public CheckOutService(OrderItemRepository orderItemRepository,
                           CheckOutRepository checkOutRepository) {
        this.orderItemRepository = orderItemRepository;
        this.checkOutRepository = checkOutRepository;
    }

    @Transactional
    public int orderPlace(CheckOutModel order, CartModel cart) {

        // 1. SAVE ORDER
        checkOutRepository.save(order);

        // 2. GET ORDER ID
        int orderId = order.getOrder_id();

        // 3. SAVE ORDER ITEMS
        for (CartItemModel item : cart.getItems()) {

            OrderItemModel oi = new OrderItemModel();

            oi.setOrder_id(orderId);
            oi.setMenu_id(item.getMenu().getMid());
            oi.setMenu_name(item.getMenu().getItem_name());
            oi.setQuantity(item.getQuantity());

            BigDecimal price = BigDecimal.valueOf(item.getMenu().getPrice());
            BigDecimal qty = BigDecimal.valueOf(item.getQuantity());

            oi.setTotal_price(price.multiply(qty));

            orderItemRepository.save(oi);
        }

        // 4. RETURN ORDER ID TO CONTROLLER
        return orderId;
    }
}