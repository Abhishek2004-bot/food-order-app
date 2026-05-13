<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.model.RestaurantModel" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Restaurants</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/restaurants.css">

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg shadow-sm">

  <div class="container">

    <!-- BRAND -->
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
      <span class="food">Food</span><span class="seva">Seva</span>
    </a>

    <!-- TOGGLER -->
    <button class="navbar-toggler" type="button"
        data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- MENU -->
    <div class="collapse navbar-collapse" id="navbarNav">

      <ul class="navbar-nav ms-auto align-items-center gap-2">

        <li>
          <a class="nav-btn restaurant-btn"
             href="${pageContext.request.contextPath}/restaurants">
            Restaurants
          </a>
        </li>

        <li>
         <a class="nav-btn cart-btn" href="${pageContext.request.contextPath}/cart">
    <i class="bi bi-cart-fill"> Cart</i>
</a>
        </li>

        <li>
          <a class="nav-btn signin-btn"
             href="${pageContext.request.contextPath}/login">
            Sign in
          </a>
        </li>

      </ul>

    </div>

  </div>

</nav>

<!-- RESTAURANTS -->
<div class="container mt-5">

  <div class="row">

  <%
    List<RestaurantModel> hotels =
    (List<RestaurantModel>) request.getAttribute("hotelList");

    if(hotels != null){
        for(RestaurantModel hotel : hotels){
  %>

<div class="col-lg-3 col-md-6 mb-4">

  <div class="restaurant-card">

    <a href="${pageContext.request.contextPath}/menu?restaurantId=<%= hotel.getRid() %>" class="card-link">

      <div class="image-container">
        <img src="restaurantsImages/<%= hotel.getImage_path() %>" />
      </div>

      <div class="card-body">

        <h5><%= hotel.getRname() %></h5>

        <p><%= hotel.getRaddress() %></p>

        <span class="badge">⭐ <%= hotel.getRating() %></span>

      </div>

    </a>

  </div>

</div>

  <%
        }
    }
  %>




  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>