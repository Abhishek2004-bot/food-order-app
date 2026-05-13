<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/register.css">
</head>

<body>

<div class="main">

    <!-- LEFT SIDE (FOOD IMAGES) -->
    <div class="left">

<img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836" class="food img1">
<img src="https://images.unsplash.com/photo-1551782450-a2132b4ba21d" class="food img2">
<img src="https://images.unsplash.com/photo-1540189549336-e6e99c3679fe" class="food img3">       <div class="left-text">
            <h1>Join FoodSeva 🍕</h1>
            <p>Discover the best food near you</p>
        </div>

    </div>

    <!-- RIGHT SIDE (FORM) -->
    <div class="right">

        <div class="form-box">

            <h2>Create Account</h2>
            <p class="subtitle">Start ordering your favorite food 🍔</p>

            <form action="register" method="post">

                <input type="text" name="name"
           placeholder="Full Name"
           required
           minlength="3"
           maxlength="50"
           pattern="[A-Za-z ]+"
           title="Name should contain only letters">


                   <input type="email" name="email"
           placeholder="Email Address"
           required>

<input type="password" name="password"
       placeholder="Password"
       required
       minlength="8"
       maxlength="20"
       pattern="[A-Za-z0-9@$!%*?&]{8,}"
       title="Password must be 8+ characters with letters, numbers and special characters">
            <input type="text" name="phone"
       placeholder="Phone Number"
       required
       pattern="[6-9][0-9]{9}"
       maxlength="10"
       oninput="this.value=this.value.replace(/[^0-9]/g,'')"
       title="Phone number must start with 6, 7, 8, or 9 and be 10 digits">
       
                   <textarea name="address"
              placeholder="Delivery Address"
              required
              minlength="10"
              maxlength="200"></textarea>

                <button type="submit">Register</button>

            </form>

            <div class="login-link">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </div>

        </div>

    </div>

</div>

</body>
</html>