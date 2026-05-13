package com.spring.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer_orders")
public class CheckOutModel {
	
	  @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int order_id;
	private int user_id;
	private int restaurant_id;
	private LocalDateTime order_date;
	@Column(name = "total_amount", precision = 10, scale = 2)
	private BigDecimal  total_amount;
	private String status;
	private String   payment_mode;
	private String   fullname;
	private String   address;
	private String phonenumber;
	
	
	public CheckOutModel() {
		super();
	}
	
	







	public CheckOutModel(int order_id, int user_id, int restaurant_id, LocalDateTime order_date,
			BigDecimal total_amount, String status, String payment_mode, String fullname, String address,
			String phonenumber) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.restaurant_id = restaurant_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.status = status;
		this.payment_mode = payment_mode;
		this.fullname = fullname;
		this.address = address;
		this.phonenumber = phonenumber;
	}









	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getRestaurant_id() {
		return restaurant_id;
	}


	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}


	public LocalDateTime getOrder_date() {
		return order_date;
	}


	public void setOrder_date(LocalDateTime order_date) {
		this.order_date = order_date;
	}


	

	public BigDecimal getTotal_amount() {
		return total_amount;
	}




	public void setTotal_amount(BigDecimal total_amount) {
		this.total_amount = total_amount;
	}




	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getPayment_mode() {
		return payment_mode;
	}


	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}





	public String getPhonenumber() {
		return phonenumber;
	}
	
	
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}



	@Override
	public String toString() {
		return "CheckOutModel [order_id=" + order_id + ", user_id=" + user_id + ", restaurant_id=" + restaurant_id
				+ ", order_date=" + order_date + ", total_amount=" + total_amount + ", status=" + status
				+ ", payment_mode=" + payment_mode + ", fullname=" + fullname + ", address=" + address
				+ ", phonenumber=" + phonenumber + "]";
	}
	

	

	
	

	
}
