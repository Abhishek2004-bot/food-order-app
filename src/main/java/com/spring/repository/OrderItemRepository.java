package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.OrderItemModel;

public interface OrderItemRepository extends JpaRepository<OrderItemModel , Integer> 
{

}