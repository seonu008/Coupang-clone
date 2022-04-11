<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <h1>custom login page</h1>
    <form method="post" action="/team1/login">
      <div>
        <input type="text" name="username" value="admin" />
      </div>
      <div>
        <input type="password" name="password" value="admin" />
      </div>
      <div><input type="checkbox" name="remember-me" /> remember me</div>
      <div>
        <input type="submit" class="btnConfirm" />
      </div>
      <div>
        <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
      </div>
    </form>
  </body>
  <script>
    $(".btnConfirm").on("click", function () {
      if ($("#user_id").val() === "") {
        alert("아이디를 입력하세요.");
        $("#user_id").focus();
        return false;
      } else if ($("#user_pw").val() === "") {
        alert("비밀번호를 입력하세요.");
        $("#user_pw").focus();
        return false;
      }
    });
  </script>
</html>
