package com.spring.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "menu")
public class MenuModel {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mid;
	private int resid;
	private String item_name;
	private String description;
	private int price;
	private String isAvailable;
	private String menu_imageurl;
	
	
	
	
	public MenuModel() {
		super();
	}

	
	
	
	
	public MenuModel(int mid, int resid, String item_name, String description, int price, String isAvailable,
			String menu_imageurl) {
		super();
		this.mid = mid;
		this.resid = resid;
		this.item_name = item_name;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.menu_imageurl = menu_imageurl;
	}

	



	public int getMid() {
		return mid;
	}





	public void setMid(int mid) {
		this.mid = mid;
	}





	public int getResid() {
		return resid;
	}





	public void setResid(int resid) {
		this.resid = resid;
	}





	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getIsAvailable() {
		return isAvailable;
	}


	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}


	public String getMenu_imageurl() {
		return menu_imageurl;
	}


	public void setMenu_imageurl(String menu_imageurl) {
		this.menu_imageurl = menu_imageurl;
	}





	@Override
	public String toString() {
		return "MenuModel [mid=" + mid + ", resid=" + resid + ", item_name=" + item_name + ", description="
				+ description + ", price=" + price + ", isAvailable=" + isAvailable + ", menu_imageurl=" + menu_imageurl
				+ "]";
	}














	
	
	
}
