package com.spring.model;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "restaurant")
public class RestaurantModel {

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rid;
	
	private String rname;
	private String cuisine_type;
	
	private String delivery_time;
	private String raddress;
	private String admin_userid;
	private double rating;

	private String image_path;
	private int  is_active;
	
	
	public RestaurantModel() {
		super();
	}

	
	public RestaurantModel(int rid, String rname, String cuisine_type, String delivery_time, String raddress,
			String admin_userid, double rating, String image_path, int is_active) {
		super();
		this.rid = rid;
		this.rname = rname;
		this.cuisine_type = cuisine_type;
		this.delivery_time = delivery_time;
		this.raddress = raddress;
		this.admin_userid = admin_userid;
		this.rating = rating;
		this.image_path = image_path;
		this.is_active = is_active;
	}

	public int getRid() {
		return rid;
	}
	
	
	public void setRid(int rid) {
		this.rid = rid;
	}
	
	
	public String getRname() {
		return rname;
	}
	
	
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	
	public String getCuisine_type() {
		return cuisine_type;
	}
	
	
	public void setCuisine_type(String cuisine_type) {
		this.cuisine_type = cuisine_type;
	}
	
	
	public String getDelivery_time() {
		return delivery_time;
	}
	
	
	public void setDelivery_time(String delivery_time) {
		this.delivery_time = delivery_time;
	}
	
	
	public String getRaddress() {
		return raddress;
	}
	
	
	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}
	
	
	public String getAdmin_userid() {
		return admin_userid;
	}
	
	
	public void setAdmin_userid(String admin_userid) {
		this.admin_userid = admin_userid;
	}
	
	
	public double getRating() {
		return rating;
	}
	
	
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	
	public String getImage_path() {
		return image_path;
	}
	
	
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	
	
	public int getIs_active() {
		return is_active;
	}
	
	
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}


	@Override
	public String toString() {
		return "RestaurantModel [rid=" + rid + ", rname=" + rname + ", cuisine_type=" + cuisine_type
				+ ", delivery_time=" + delivery_time + ", raddress=" + raddress + ", admin_userid=" + admin_userid
				+ ", rating=" + rating + ", image_path=" + image_path + ", is_active=" + is_active + "]";
	}
	





	
	
	
	


	    

	  

	}

