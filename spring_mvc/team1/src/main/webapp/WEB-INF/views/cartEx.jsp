<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Team1 쿠팡</title>
<link rel="shortcut icon" href="/team1/images/favicon.png">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/cartView.css" />
<script src="js/gsap/gsap.min.js"></script>
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="js/cartEx.js" defer></script>

</head>
<body>
	<div id="wrap">
		<header id="cartlogo"></header>
		<section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">        
        <section class="cart-title">
            <h1 class="sr-only">장바구니</h1>
        </section>
		<table></table>
		<div id="cartTotalInfo"></div>
		<div id="orderBtns"></div>
		
	</div>
</body>
</html>