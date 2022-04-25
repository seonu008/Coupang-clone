<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
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
<script src="/team1/js/gsap/gsap.min.js"></script>
<script src="/team1/js/axios.min.js"></script>
<script src="/team1/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet" href="/team1/css/orderPage.css" />
<script src="/team1/js/orderPage.js" defer></script>
<link rel="stylesheet" href="/team1/css/searchPage.css" />
<script src="/team1/js/header.js" defer></script>
<script src="/team1/js/searchPage.js" defer></script>
<script src="/team1/js/renderDetail.js" defer></script>
</head>
<header>
	<article class="topBar">
		<section>
			<menu id="headerMenu">
				<li id="login" class="login"><a href="/team1/CustomLogin.do">로그인</a></li>
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
			</select> <input type="text" name="search_word" class="search_word" 
				id="search_word" value="${query}" />
			<button class="btn btnBlack search">
				<span class="material-icons">search</span>
			</button>
		</div>
		<ul class="iconMenu">
			<li><a href="/team1/member/OrderPage.do"> <span
					class="material-icons-outlined">person</span> <span>마이쿠팡</span>
			</a></li>
			<li><a href="/CartView.do"> <span
					class="material-icons-outlined">shopping_cart</span> <span>장바구니</span>
			</a></li>
		</ul>
	</div>
</header>	
<main>
	<div id="searchWrap">
		<div class="searchContentsBox">
			<div class="search_filter">
				<div class="search_filter_content">
					<h4>필터</h4>
					<div class="search_filter_category">
						<h5>카테고리</h5>
						<div class="search_category_component">
							<ul class="search_filter_items">
								<li class="search_filter_item">
									<h5><a href="">전체</a></h5>
								</li>
								<li class="search_filter_item">
									<h5><a href="">식품</a></h5>
									<ul class="search_category_box">
										<li class="search_category_title">
											<a href="">장/소스/드레싱/식초</a>
										</li>
										<li class="search_category_title">
											<a href="">건강식품</a>
										</li>
										<li class="search_category_title">
											<a href="">생수/음료</a>
										</li>
										<li class="search_category_title">
											<a href="">반찬/간편식/대용식</a>
										</li>
										<li class="search_category_title">
											<a href="">과자/초콜릿/시리얼</a>
										</li>
										<li class="search_category_title">
											<a href="">냉장/냉동/간편요리</a>
										</li>
										<li class="search_category_title">
											<a href="">커피/원두/차</a>
										</li>
										<li class="search_category_title">
											<a href="">견과/건과</a>
										</li>
										<li class="search_category_title">
											<a href="">과일</a>
										</li>
										<li class="search_category_title">
											<a href="">쌀/잡곡</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="searchProduct">
				<h2 id="searchRStitle"></h2>
				<ul class="searchResult"></ul>
			</div>
		</div>
	</div>
	<footer></footer>
</main>


</html>
