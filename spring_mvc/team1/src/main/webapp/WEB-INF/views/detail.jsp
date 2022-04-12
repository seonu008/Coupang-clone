<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="include/header.jsp"%>  
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
<main>
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
</main>

</html>