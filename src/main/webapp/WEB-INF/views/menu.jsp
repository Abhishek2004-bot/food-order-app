<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.spring.model.MenuModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- YOUR EXISTING CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">

</head>

<body>
 <%@ include file="/WEB-INF/views/navbar.jsp" %>
<div class="container-fluid page-wrapper py-4">

    <!-- HEADER -->
 <div class="text-center mb-4">

    <h3 style="font-size:22px; font-weight:600; color:#ff6b00;">
        🍽 Our Delicious Menu
    </h3>

    <p style="font-size:13px; color:#6c757d; margin-top:5px;">
        Choose your favorite food and add to cart
    </p>

</div>

    <!-- MENU GRID -->
    <div class="row g-4">

        <%
            List<MenuModel> menus =
                (List<MenuModel>) request.getAttribute("menus");

            if (menus != null) {
                for (MenuModel item : menus) {
        %>

      <div class="col-lg-3 col-md-6 col-sm-12">

            <div class="card food-card">

                <!-- IMAGE -->
                <img src="<%= request.getContextPath() %>/menuImages/<%= item.getMenu_imageurl() %>"
                     class="food-img">

                <!-- BODY -->
                <div class="card-body">

                    <h6 class="fw-bold mb-1"><%= item.getItem_name() %></h6>

                       <%
String desc = item.getDescription();
if(desc != null && !desc.trim().isEmpty()){
%>
    <p class="text-muted small mb-2"><%= desc %></p>
<%
}
%>

                    <div class="d-flex justify-content-between align-items-center">

                        <span class="price">₹ <%= item.getPrice() %></span>

                        <form action="<%= request.getContextPath() %>/add-to-cart" method="post">

                            <input type="hidden" name="menuId" value="<%= item.getMid() %>">
                            <input type="hidden" name="restaurantId" value="<%= item.getResid() %>">
                            <input type="hidden" name="quantity" value="1">

                            <button type="submit" class="btn btn-sm add-btn">+ Add</button>

                        </form>

                    </div>

                </div>

            </div>

        </div>

        <%
                }
            }
        %>

    </div>

    <!-- CONFIRM BOX -->
    <%
        Boolean showConfirm = (Boolean) request.getAttribute("showConfirm");

        if (showConfirm != null && showConfirm) {
    %>

    <div class="alert alert-warning text-center mt-4 p-3">

        <h6 class="mb-2">⚠ Cart already has items from another restaurant</h6>
        <p class="mb-3 small">Do you want to clear cart and add this item?</p>

        <div class="d-flex justify-content-center gap-2">

            <form action="<%= request.getContextPath() %>/replace-cart" method="post" class="m-0">

                <input type="hidden" name="menuId" value="<%= request.getAttribute("newMenuId") %>">
                <input type="hidden" name="restaurantId" value="<%= request.getAttribute("newRestaurantId") %>">

                <button class="btn btn-danger btn-sm px-3">
                    Yes, Clear Cart & Add
                </button>

            </form>

            <a href="javascript:history.back()" class="btn btn-secondary btn-sm px-3">
                Cancel
            </a>

        </div>

    </div>

    <%
        }
    %>

</div>

</body>
</html>