<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.model.CartModel" %>
<%@ page import="com.spring.model.CartItemModel" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/checkout.css">
</head>

<body>

<form action="<%= request.getContextPath() %>/checkout/placeOrder" method="post">

<div class="main-container">

    <!-- LEFT SECTION -->
    <div class="left-section">

        <h2 class="title">Checkout</h2>

        <!-- DELIVERY DETAILS -->
        <div class="card">
            <h3>📍 Delivery Details</h3>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullname" placeholder="Enter your name"
                       required minlength="3" maxlength="50"
                       pattern="[A-Za-z ]+">
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phonenumber" placeholder="Enter phone number"
                       required pattern="[6-9][0-9]{9}" maxlength="10">
            </div>

            <div class="form-group">
                <label>Delivery Address</label>
                <textarea rows="3" name="address" placeholder="Enter full address"
                          required minlength="10" maxlength="200"></textarea>
            </div>
        </div>

        <!-- PAYMENT -->
        <div class="card">
            <h3>💳 Payment Method</h3>

            <label class="payment-option">
                <input type="radio" name="payment_mode" value="CASH" checked>
                💵 Cash on Delivery
            </label>

            <label class="payment-option">
                <input type="radio" name="payment_mode" value="UPI">
                📱 UPI Payment
            </label>

            <label class="payment-option">
                <input type="radio" name="payment_mode" value="CARD">
                💳 Credit / Debit Card
            </label>

        </div>

        <button class="order-btn" type="submit">🚀 Place Order</button>

    </div>

    <!-- RIGHT SECTION -->
    <div class="right-section">

        <div class="summary-card">
            <h3>🧾 Order Summary</h3>

            <div class="cart-table">

                <div class="cart-header">
                    <span>Item</span>
                    <span>Qty</span>
                    <span>Price</span>
                </div>

                <%
                    CartModel cart = (CartModel) session.getAttribute("cart");
                    double subtotal = 0;

                    if (cart != null && cart.getItems() != null) {

                        List<CartItemModel> items = cart.getItems();

                        for (CartItemModel item : items) {

                            double itemTotal =
                                    item.getMenu().getPrice() * item.getQuantity();

                            subtotal += itemTotal;
                %>

                <div class="item-row">
                    <span><%= item.getMenu().getItem_name() %></span>
                    <span><%= item.getQuantity() %></span>
                    <span>₹ <%= itemTotal %></span>
                </div>

                <%
                        }
                    }
                %>

            </div>

            <hr>

            <div class="price-row">
                <span>Subtotal</span>
                <span>₹ <%= subtotal %></span>
            </div>

            <div class="price-row">
                <span>Delivery</span>
                <span>₹ 40</span>
            </div>

            <hr>

            <%
                double grandTotal = subtotal + 40;
            %>

            <div class="total">
                <span>Grand Total</span>
                <span>₹ <%= grandTotal %></span>
            </div>

            <div class="info-text">
                Inclusive of GST & delivery charges
            </div>

        </div>

    </div>

</div>

</form>

</body>
</html>