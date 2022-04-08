<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>custom login page</h1>
<form method='post' action="/team1/login">
<div>
<input type='text' name='username' value='admin'>
</div>
<div>
<input type='password' name='password' value='admin'>
</div>
<div>
<input type='checkbox' name='remember-me'> remember me
</div>
<div>
<input type='submit'>
</div>
<div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</div>
</form>
</body>
</html>