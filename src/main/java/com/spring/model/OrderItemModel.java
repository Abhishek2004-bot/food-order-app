package com.spring.model;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="order_item")
public class OrderItemModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int order_item_id;
	private int order_id;
	private int menu_id;
	private String menu_name;
	private int quantity;
	private BigDecimal total_price;
	
	public OrderItemModel() {
		super();
	}

	public OrderItemModel(int order_item_id, int order_id, int menu_id, String menu_name, int quantity,
			BigDecimal total_price) {
		super();
		this.order_item_id = order_item_id;
		this.order_id = order_id;
		this.menu_id = menu_id;
		this.menu_name = menu_name;
		this.quantity = quantity;
		this.total_price = total_price;
	}







	public int getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}



	public String getMenu_name() {
		return menu_name;
	}



	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}



	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public BigDecimal getTotal_price() {
		return total_price;
	}

	public void setTotal_price(BigDecimal total_price) {
		this.total_price = total_price;
	}

	@Override
	public String toString() {
		return "OrderItemModel [order_item_id=" + order_item_id + ", order_id=" + order_id + ", menu_id=" + menu_id
				+ ", menu_name=" + menu_name + ", quantity=" + quantity + ", total_price=" + total_price + "]";
	}


	
	
	
	
	
}
