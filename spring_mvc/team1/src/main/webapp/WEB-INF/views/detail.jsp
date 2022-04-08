<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${no}</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/layout.css" />
<script src="js/gsap/gsap.min.js"></script>
<script src="js/axios.min.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="js/renderDetail.js" defer></script>
<style>
  ul {
    display:flex;
    justify-content: center;
    padding: 10px;
}
  li {
    display : flex;
    margin-left : 100px;
    color: #fff;
  }
</style>
</head>
<body>
	<%
	if (request.getAttribute("no") != null) {
	%>
	<div id="on"></div>
	<%	
	} else {
	%>
	<div id="off">
	상품을 불러 올 수 없습니다.
	</div>
	<%	
	}
	%>
</body>

</html>