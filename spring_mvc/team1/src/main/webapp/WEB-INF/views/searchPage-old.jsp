<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/layout.css" />
    <link rel="stylesheet" href="css/searchPage.css" />
    <script src="js/gsap/gsap.min.js"></script>
    <script src="js/axios.min.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/searchPage.js" defer></script>
  </head>
  <body>
    <article class="topBar">
      <section>
        <menu id="headerMenu">
          <li id="login" class="login"><a href="">로그인</a></li>
          <li id="join" class="join"><a href="">회원가입</a></li>
          <li class="csCenter"><a href="">고객센터</a></li>
        </menu>
      </section>
    </article>
    <div class="searchBox">
      <div class="logo">
        <a href=""><img src="image/layout/sampleLogo.png"/></a>
      </div>
      <div class="searchBar">
        <select name="search_select" id="search_select">
          <option value="title" selected>전체</option>
          <option value="title">식품</option>
          <option value="title">의류</option>
          <option value="title">생필품</option>
        </select>
        <input type="text" placeholder="검색할 내용을 입력해 주세요." name="search_word" id="search_word" value="${param.search_word }" />
        <button class="btn btnBlack search"><span class="material-icons">search</span></button>
      </div>
      <ul class="iconMenu">
        <li>
        	<a href="OrderPage.do">
        		<span class="material-icons-outlined">person</span>
        		<span>마이쿠팡</span>
        	</a>
       	</li>
        <li>
	        <a href="CartView.do">
	        	<span class="material-icons-outlined">shopping_cart</span>
	        	<span>장바구니</span>
        	</a>
        </li>
      </ul>
    </div>
    <div class="searchProduct">
      <ul class="searchResult"></ul>
    </div>
  </body>
</html>
