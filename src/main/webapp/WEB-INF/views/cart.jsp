<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.spring.model.CartModel" %>
<%@ page import="com.spring.model.CartItemModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- YOUR EXISTING CSS ONLY -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/cart.css">

</head>

<body>
<%@ include file="/WEB-INF/views/navbar.jsp" %>
<div class="container py-4">

<h3 class="text-center mb-4">🛒 Your Cart</h3>

<%
    CartModel cart = (CartModel) session.getAttribute("cart");
    double total = 0;

    if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
%>

    <h5 class="text-center">Cart is empty</h5>

<%
    } else {

        List<CartItemModel> items = cart.getItems();

        for (CartItemModel item : items) {

            double subTotal = item.getMenu().getPrice() * item.getQuantity();
            total += subTotal;
%>

<div class="cart-card d-flex align-items-center justify-content-between flex-wrap gap-3">

    <!-- IMAGE + NAME -->
    <div class="d-flex align-items-center gap-3" style="min-width:200px;">

        <img src="<%= request.getContextPath() %>/menuImages/<%= item.getMenu().getMenu_imageurl() %>"
             class="cart-img">

        <div>
            <h6 class="mb-1"><%= item.getMenu().getItem_name() %></h6>
            <small>₹ <%= item.getMenu().getPrice() %></small>
        </div>

    </div>

    <!-- QUANTITY -->
    <div class="qty-box d-flex align-items-center justify-content-center">

        <form action="decrease" method="post" class="m-0">
            <input type="hidden" name="menuId" value="<%= item.getMenu().getMid() %>">
           <button type="submit" class="qty-btn minus">-</button>
        </form>

        <span class="qty-value"><%= item.getQuantity() %></span>

        <form action="increase" method="post" class="m-0">
            <input type="hidden" name="menuId" value="<%= item.getMenu().getMid() %>">
            <button type="submit" class="qty-btn plus">+</button>
        </form>

    </div>

    <!-- SUBTOTAL -->
    <div class="fw-bold">
        ₹ <%= subTotal %>
    </div>

    <!-- REMOVE -->
    <form action="remove-item" method="post" class="m-0">
        <input type="hidden" name="menuId" value="<%= item.getMenu().getMid() %>">
        <button class="btn btn-danger btn-sm">Remove</button>
    </form>

</div>

<%
        }
    }
%>

<h4 class="text-end mt-4">Total: ₹ <%= total %></h4>

<div class="text-center mt-4">

<%
    if (cart != null) {
%>

    <a href="<%= request.getContextPath() %>/menu?restaurantId=<%= cart.getRestaurantId() %>"
       class="btn btn-warning me-2">
        ➕ Add More Items
    </a>

<%
    }
%>

    <a href="checkout" class="btn btn-success">
        💳 Checkout
    </a>

</div>

</div>

</body>
</html>