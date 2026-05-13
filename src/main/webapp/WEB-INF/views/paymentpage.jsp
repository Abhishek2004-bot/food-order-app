<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Success</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e8fff0, #f2fff7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 360px;
            position: relative;
        }

        .checkmark {
            width: 120px;
            height: 120px;
            margin: 0 auto;
            display: block;
        }

        .checkmark-circle {
            stroke: #4CAF50;
            stroke-width: 3;
            fill: none;
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            animation: drawCircle 0.6s forwards ease-in-out;
        }

        .checkmark-check {
            stroke: #4CAF50;
            stroke-width: 4;
            fill: none;
            stroke-linecap: round;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: drawCheck 0.4s 0.6s forwards ease-in-out;
        }

        @keyframes drawCircle {
            to { stroke-dashoffset: 0; }
        }

        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }

        h2 {
            color: #2e7d32;
            margin-top: 15px;
        }

        p {
            color: #555;
            margin: 5px 0;
        }

        .btn {
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            color: white;
            font-size: 13px;
        }

        .back-btn {
            background: #ff6b00;
        }

        .track-btn {
            background: #4CAF50;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-row {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .btn-row a {
            flex: 1;
            text-decoration: none;
        }

        .confetti {
            position: absolute;
            width: 8px;
            height: 8px;
            animation: fall 2s linear infinite;
        }

        @keyframes fall {
            0% { transform: translateY(-100px) rotate(0); opacity: 1; }
            100% { transform: translateY(500px) rotate(360deg); opacity: 0; }
        }
    </style>
</head>

<body>

<div class="box">

    <!-- SVG CHECK -->
    <svg class="checkmark" viewBox="0 0 52 52">
        <circle class="checkmark-circle" cx="26" cy="26" r="25"/>
        <path class="checkmark-check" d="M14 27 L22 35 L38 18"/>
    </svg>

    <h2>Payment Successful 🎉</h2>

    <p>Order ID: <b><%= request.getAttribute("orderId") %></b></p>
    <p>Delivery Time: <b><%= request.getAttribute("deliveryTime") %></b></p>

    <p>Your order is being prepared 🍕</p>

    <div class="btn-row">

        <a href="<%= request.getContextPath() %>/restaurants">
            <button class="btn back-btn">Back to Restaurant</button>
        </a>

        <a href="<%= request.getContextPath() %>/checkout/track-order?orderId=<%= request.getAttribute("orderId") %>">
            <button class="btn track-btn">Track Order</button>
        </a>

    </div>

</div>

<script>
window.onload = function () {
    for (let i = 0; i < 40; i++) {
        let confetti = document.createElement("div");
        confetti.classList.add("confetti");

        confetti.style.left = Math.random() * window.innerWidth + "px";
        confetti.style.background = ["#4CAF50","#ff6b00","#ffc107","#2196F3"][Math.floor(Math.random()*4)];
        confetti.style.animationDuration = (1 + Math.random() * 2) + "s";

        document.body.appendChild(confetti);
    }
};
</script>

</body>
</html>