package com.spring.model;



import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;


public class CartModel {

	  private List<CartItemModel> items = new ArrayList<>();
	  private Integer restaurantId;
	  private int user_id;
	  

	    public int getUser_id() {
		return user_id;
	}

	  public void setUser_id(int user_id) {
		  this.user_id = user_id;
	  }

		public List<CartItemModel> getItems() {
	        return items;
	    }

	    public void setItems(List<CartItemModel> items) {
	        this.items = items;
	    }

	    public Integer getRestaurantId() {
	        return restaurantId;
	    }

	    public void setRestaurantId(Integer restaurantId) {
	        this.restaurantId = restaurantId;
	    }
	    
	    public BigDecimal getTotalPrice() {

	        BigDecimal total = BigDecimal.ZERO;

	        for (CartItemModel item : items) {

	            BigDecimal price = BigDecimal.valueOf(item.getMenu().getPrice());

	            BigDecimal qty = BigDecimal.valueOf(item.getQuantity());

	            total = total.add(price.multiply(qty));
	            
	        }

	        return total.setScale(2, RoundingMode.HALF_UP); // ✅ fix
	    }
}








