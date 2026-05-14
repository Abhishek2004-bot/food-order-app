<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>FoodSeva</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light">

    <div class="container">

        <a class="navbar-brand" href="#">
            Food<span class="seva">Seva</span>
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="btn btn-restaurant ms-2"
                       href="restaurant">

                        Restaurant

                    </a>

                </li>

               <li class="nav-item">

    <a class="btn btn-cart ms-2" href="cart">
        <i class="bi bi-cart-fill"></i>
        Cart
    </a>

</li>

                <li class="nav-item">

                    <a class="btn btn-login ms-2"
                       href="login">

                        Sign In

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- HERO SECTION -->
<section class="hero">

    <div class="container">

        <div class="row align-items-center">

            <div class="col-md-6">

                <h1>
                    Craving Something Delicious? 🍕
                </h1>

                <p>
                    Order from your favorite restaurants and get it delivered fast.
                </p>

                <a href="restaurant"
                   class="btn btn-warning text-white">

                    Explore Food

                </a>

                <!-- SEARCH -->
                <form action="searchRestaurants"
                      method="get"
                      class="search-box">

                    <input type="text"
                           name="keyword"
                           placeholder="Search Restaurants..."
                           required>

                    <button type="submit">
                        Search
                    </button>

                </form>

            </div>

            <!-- HERO IMAGE -->
            <div class="col-md-6 text-center">

                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836"
                     class="img-fluid hero-img">

            </div>

        </div>

    </div>

</section>

<!-- FOOD SECTION -->
<div class="container">

    <h2 class="section-title">
        Top Picks For You
    </h2>

    <div class="row g-4">

        <!-- BURGER -->
        <div class="col-md-4">

            <div class="card food-card">

                <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd">

                <div class="card-body">

                    <h5>Burger</h5>

                    <p>Loaded cheesy delight</p>

                </div>

            </div>

        </div>

        <!-- PIZZA -->
        <div class="col-md-4">

            <div class="card food-card">

                <img src="https://images.unsplash.com/photo-1593560708920-61dd98c46a4e">

                <div class="card-body">

                    <h5>Pizza</h5>

                    <p>Hot & crispy cheesy pizza</p>

                </div>

            </div>

        </div>

        <!-- BIRYANI -->
        <div class="col-md-4">

            <div class="card food-card">

               <img src="https://images.unsplash.com/photo-1642821373181-696a54913e93?q=80&w=1200&auto=format&fit=crop">

                <div class="card-body">

                    <h5>Biryani</h5>

                    <p>Authentic spicy biryani</p>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- PARTNERS -->
<section class="partners-section">

    <h4>
        Trusted by Top Brands
    </h4>

    <div class="logo-slider">

       <div class="logo-track">

    <img src="https://cdn.worldvectorlogo.com/logos/swiggy-1.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/zomato-1.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/dominos-pizza-5.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/kfc-2.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/mcdonalds-7.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/burger-king-4.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/subway-7.svg">

    <img src="https://cdn.worldvectorlogo.com/logos/starbucks-2.svg">

</div>

    </div>

</section>

<!-- FOOTER -->
<footer>

    <p>
        © 2026 FoodSeva
    </p>

</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
