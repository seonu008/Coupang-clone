<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Team1 쿠팡</title>
<link rel="shortcut icon" href="/team1/images/favicon.png">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<link rel="stylesheet" href="/team1/css/reset.css" />
<link rel="stylesheet" href="/team1/css/layout.css" />
<link rel="stylesheet" href="/team1/css/mainPage.css" />
<link rel="stylesheet" href="/team1/css/detail.css" />
<script src="/team1/js/gsap/gsap.min.js"></script>
<script src="/team1/js/axios.min.js"></script>
<script src="/team1/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<link rel="stylesheet" href="/team1/css/orderPage.css" />
<link rel="stylesheet" href="/team1/css/searchPage.css" />
<script src="/team1/js/header.js" defer></script>
<script src="/team1/js/searchPage.js" defer></script>
<script src="/team1/js/rate.js" defer></script>
<script src="/team1/js/renderDetail.js" defer></script>

</head>
<header>
	<article class="topBar">
		<section>
			<menu id="headerMenu">
				<sec:authorize access="!hasRole('ROLE_MEMBER')">
					<li id="login" class="login"><a href="/team1/CustomLogin.do">로그인</a></li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li id="login" class="login"><a href="/team1/CustomLogout.do">로그아웃</a></li>
				</sec:authorize>
				<li id="join" class="join"><a href="/team1/join/Join.do">회원가입</a></li>
				<li class="csCenter"><a href="">고객센터</a></li>
			</menu>
		</section>
	</article>
	<div class="searchBox">
		<div class="logo">
			<a href="/team1"><img src="/team1/image/layout/sampleLogo.png" /></a>
		</div>
		<div class="searchBar">
			<select name="search_select" id="search_select">
				<option value="title" selected>전체</option>
				<option value="title">식품</option>
				<option value="title">의류</option>
				<option value="title">생필품</option>
			</select> <input type="text" placeholder="검색할 내용을 입력해 주세요." name="search_word"
				class="to_search_word " id="search_word"
				value="${param.search_word }" />
			<button class="btn btnBlack to_search search">
				<span class="material-icons">search</span>
			</button>
		</div>
		<ul class="iconMenu">
			<li><a href="/team1/member/OrderPage.do"> <span
					class="material-icons-outlined">person</span> <span>마이쿠팡</span>
			</a></li>
			<li><a href="/team1/CartEx.do"> <span
					class="material-icons-outlined">shopping_cart</span> <span>장바구니</span>
			</a></li>
		</ul>
	</div>
</header>