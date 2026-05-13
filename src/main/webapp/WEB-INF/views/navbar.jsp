<%@ page import="com.spring.model.CartModel" %>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
href="<%= request.getContextPath() %>/css/navbar.css">


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

   <a class="btn btn-cart ms-2 position-relative" href="cart">

    <i class="bi bi-cart-fill"></i>
    Cart

    <%
        CartModel navCart =
            (CartModel) session.getAttribute("cart");

        int count = 0;

        if(navCart != null && navCart.getItems() != null){
            count = navCart.getItems().size();
        }
    %>

    <span class="cart-badge">
        <%= count %>
    </span>

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