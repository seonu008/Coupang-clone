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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<link rel="stylesheet" href="/team1/css/orderPage.css" />
<script src="/team1/js/orderPage.js" defer></script>
<link rel="stylesheet" href="/team1/css/searchPage.css" />
<script src="/team1/js/header.js" defer></script>
<script src="/team1/js/searchPage.js" defer></script>
<script src="/team1/js/renderDetail.js" defer></script>
<script>

</script>
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
			</select> 
			<input type="text" name="search_word" class="search_word" 
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
									<button class="accordion" id="accordion">
										<h5>식품</h5>
										<span class="material-icons more">expand_more</span>
										<span class="material-icons less">expand_less</span>
								  </button>
									<div class="panel" id="panel">
										<ul class="search_category_box">
											<li class="search_category_title">
												<a href="/team1/item/SearchPage.do?query=식초">
													<p>식초</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>건강식품</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>생수/음료</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>반찬/간편식/대용식</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>과자/초콜릿/시리얼</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>냉장/냉동/간편요리</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>커피/원두/차</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>견과/건과</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>과일</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>쌀/잡곡</p>
												</a>
											</li>
									  </ul>
									</div>
									<button class="accordion2" id="accordion2">
										<h5>패션</h5>
										<span class="material-icons more2">expand_more</span>
										<span class="material-icons less2">expand_less</span>
								  </button>
									<div class="panel2" id="panel2">
										<ul class="search_category_box">
											<li class="search_category_title">
												<a href="/team1/item/SearchPage.do?query=운동화">
													<p>운동화</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>의류</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>속옷/잠옷</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>스포츠신발</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>등산/아웃도어</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>남성스포츠의류</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>여성스포츠의류</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>홈트레이닝</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>수영/수상스포츠</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>기타스포츠</p>
												</a>
											</li>
									  </ul>
									</div>
									<button class="accordion3" id="accordion3">
										<h5>생활용품</h5>
										<span class="material-icons more3">expand_more</span>
										<span class="material-icons less3">expand_less</span>
								  </button>
									<div class="panel3" id="panel3">
										<ul class="search_category_box">
											<li class="search_category_title">
												<a href="/team1/item/SearchPage.do?query=티슈">
													<p>물티슈</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>욕실용품</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="">
													<p>생활잡화</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>안전/호신용품</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>주방수납/잡화</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>기저귀</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>생활전기용품</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>헤어/바디/세안</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>세탁/청소용품</p>
												</a>
											</li>
											<li class="search_category_title">
												<a href="#">
													<p>수납/정리</p>
												</a>
											</li>
									  </ul>
									</div>
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
<script>
	
 
</script>
</html>
