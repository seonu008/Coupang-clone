<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>custom logout page</h1>
<form method='post' action="./CustomLogout.do">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<button>logout</button>
</form>
</body>
</html>