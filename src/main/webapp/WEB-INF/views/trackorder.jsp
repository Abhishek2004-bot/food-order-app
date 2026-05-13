<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Track Order</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f7f7f7;
    display: flex;
    justify-content: center;
    padding: 40px;
}

.card {
    width: 750px;
    background: white;
    border-radius: 16px;
    padding: 30px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #ff6b00;
}

.order-id {
    text-align: center;
    margin-bottom: 20px;
    color: #555;
}

/* TRACK */
.track {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    margin: 60px 0;
}

/* BASE LINE */
.track::before {
    content: "";
    position: absolute;
    top: 16px;
    left: 8%;
    right: 8%;
    height: 4px;
    background: #e0e0e0;
    border-radius: 10px;
}

/* PROGRESS LINE */
.progress-line {
    position: absolute;
    top: 16px;
    left: 8%;
    height: 4px;
    width: 0%;
    background: linear-gradient(90deg, #00c853, #00e676);
    border-radius: 10px;
    transition: width 1s ease;
}

/* STEP */
.step {
    text-align: center;
    width: 20%;
}

/* DOT */
.circle {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: #ccc;
    border: 3px solid #ccc;
    margin: 0 auto 8px;
}

/* ACTIVE DOT */
.step.active .circle {
    background: #00c853;
    border-color: #00c853;
    box-shadow: 0 0 10px rgba(0,200,83,0.5);
}

.step-text {
    font-size: 12px;
    color: #777;
}

.step.active .step-text {
    color: #00c853;
    font-weight: bold;
}

.btn-center {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 25px;
}

.action-btn {
    background: #fff3e6;
    color: #e46d00;
    padding: 7px 12px;
    border-radius: 18px;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none;
    border: 1px solid #ffd6a6;
}

.btn-center {
    display: flex;
    justify-content: center;
    gap: 14px;
    margin-top: 25px;
    flex-wrap: wrap;
}

.action-btn {
    text-decoration: none;
    background: #ff6b35;
    color: white;
    border: none;
    padding: 10px 18px;
    min-width: 180px;
    text-align: center;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s ease;
    box-shadow: 0 3px 10px rgba(0,0,0,0.15);
}

.action-btn:hover {
    background: #e85a24;
    transform: translateY(-2px);
}







</style>

</head>

<body>

<div class="card">

<h2>Track Your Order 🛍️</h2>

    <div class="order-id">
        Order ID: <b><%= request.getAttribute("orderId") %></b>
    </div>

    <!-- TRACK -->
    <div class="track">

        <div class="step" id="placed">
            <div class="circle"></div>
            <div class="step-text">Placed</div>
        </div>

        <div class="step" id="preparing">
            <div class="circle"></div>
            <div class="step-text">Preparing</div>
        </div>

        <div class="step">
            <div class="circle"></div>
            <div class="step-text">Packed</div>
        </div>

        <div class="step">
            <div class="circle"></div>
            <div class="step-text">On the Way</div>
        </div>

        <div class="step">
            <div class="circle"></div>
            <div class="step-text">Delivered</div>
        </div>

        <div class="progress-line"></div>

    </div>

   <!-- BUTTONS -->
    <div class="btn-center">

        <button class="action-btn" onclick="callPartner()">Call Delivery Partner 📞</button>

        <a href="${pageContext.request.contextPath}/restaurant" class="action-btn">
            Back to Restaurant 🏠
        </a>

    </div>
</div>

<script>
window.onload = function () {

    // STEP 1: Immediately show PLACED as green
    document.getElementById("placed").classList.add("active");

    // STEP 2: after 2 seconds → move to PREPARING only
    setTimeout(() => {

        document.getElementById("preparing").classList.add("active");

        // fill line only till preparing (50%)
        document.querySelector(".progress-line").style.width = "30%";

    }, 2000);
};
</script>

</body>
</html>