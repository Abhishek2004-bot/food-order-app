<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/login.css">
</head>
<body>

<div class="login-container">

    <!-- LEFT SIDE -->
   <div class="left-panel">

    <div class="img-top">
        <img src="/restaurantsImages/logimg.png">
    </div>

  <!--   <div class="img-middle">
        <img src="/restaurantsImages/logimg4.png">
    </div>
 -->
    <div class="img-bottom">
        <img src="/restaurantsImages/logimg4.png">
    </div>

    <div class="left-content">
        <h1>Craving Something Delicious?</h1>
        <p>Order food anytime 🍕</p>
    </div>

</div>

    <!-- RIGHT SIDE -->
    <div class="right-panel">
        <div class="login-card p-4">
            
            <div class="text-center mb-3">
                <div class="logo">FoodSeva</div>
                <div class="subtext">Login to continue</div>
            </div>

            <form action="ulogin" method="post" autocomplete="off">
                <div class="mb-3">
        <input type="email"
               name="email"
               class="form-control"
               placeholder="Email address"
               required
               maxlength="50"
               title="Enter valid email address"
               autocomplete="off">
    </div>

          <div class="mb-3">
        <input type="password"
               name="password"
               class="form-control"
               placeholder="Password"
               required
               minlength="6"
               maxlength="20"
               pattern="[A-Za-z0-9@$!%*?&]{6,}"
               title="Invalid Password"
                autocomplete="new-password">
    </div>
                
   <button type="submit" class="btn btn-login w-100 text-white">
        Login
    </button>

    <div class="text-center mt-3 subtext">
        New user? <a href="${pageContext.request.contextPath}/register">Create account</a>
    </div>

            </form>

        </div>
    </div>

</div>
<script>
window.onload = function () {
    document.querySelector("form").reset();
};
</script>
</body>
</html>