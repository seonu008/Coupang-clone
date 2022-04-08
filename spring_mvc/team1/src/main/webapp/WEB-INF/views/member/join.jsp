<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<main>
	<div class="inner">
		<h2 class="subTitle">JOIN</h2>
		<div id="contents">
			<!-- 데이터 받아서 처리하기....forward방식으로 데이터 보여주기....  -->
			<form method="POST" action="../member/JoinProcess.do" id="join"
				class="form">
				
				<table class="left">

					<colgroup>
						<col style="width: 20%">
						<col style="width: 80%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디 <span class="required">*</span></th>
							<td><input type="text" name="id" id="user_id"
								placeholder="아이디(이메일)를 입력하세요." style="width: calc(100% - 120px)" value='admin'>
								<button class="btn btnIdCheck sticker" id="btnIdCheck">ID중복체크</button></td>
						</tr>
						<tr>
							<th>패스워드 <span class="required">*</span></th>
							<td><input type="password" name="password" id="user_pw"
								placeholder="비밀번호를 입력하세요." value='admin'></td>
						</tr>
						<tr>
							<th>패스워드 확인 <span class="required">*</span></th>
							<td><input type="password" name="user_pw_confirm"
								id="user_pw_confirm" placeholder="비밀번호를 입력하세요."></td>
						</tr>
						<tr>
							<th>이름 <span class="required">*</span></th>
							<td><input type="text" name="name" id="user_name"
								placeholder="이름을 입력하세요."></td>
						</tr>
						<tr>
							<th>전화번호 <span class="required">*</span></th>
							<td><input name="phone" class="short"></td>
						</tr>

					</tbody>
				</table>
				<div class="btns">

					<button type="submit" class="btn btnConfirm">회원가입</button>
					<button type="reset" class="btn btnCancel">취소</button>
					<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				</div>
			</form>
		</div>
	</div>

</main>
<meta name="csrf-token" content='${_csrf.token}'>


<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	let idCheck = false;
	const korean = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
	const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;//이메일 정규식

	// form을 통해서 보낼 수 있다. 
	// <a href="join_process.jsp?user_id=hulk">보내기</a>
	// ajax로 데이터 보낼 수 있다.

	$(".btnIdCheck").on("click", function(e) {
		//e.preventDefault();
		const id = $("#user_id").val();
		if (id === "") {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		$.ajaxSetup({
			headers : {
				'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			url : "../member/IDCheck.do",
			type : "POST",
			data : {
				"id" : id
			},
			success : function(res) {
				console.log(res);
				if (res.count > 0) {
					alert("사용할 수 없는 아이디입니다.");
					$("#user_id").val("");
					$("#user_id").focus();
				} else {
					//alert("사용할 수 있는 아이디입니다.");
					const yes = confirm("사용가능한 아이디입니다. 사용하시겠어요");
					if (yes) {
						$("#user_id").attr("readonly", true);
						$("#user_id").addClass("readonly");
						idCheck = true;
					} else {
						$("#user_id").val("");
					}
				}
			}
		});
		return false;
	});

	$(".btnConfirm").on("click", function() {
		if ($("#user_id").val() == "") {
			alert("ID를 입력해 주세요");
			$("#user_id").focus();
			return false;
		} else if (korean.test($("#user_id").val())) {
			alert("id에 한글을 쓸 수 없습니다.");
			$("#user_id").val("");
			$("#user_id").focus();
			return false;
		} else if ($("#user_pw").val() == "") {
			alert("password를 입력해 주세요");
			$("#user_pw").focus();
			return false;
		} else if ($("#user_pw_confirm").val() == "") {
			alert("password 확인을 입력해 주세요");
			$("#user_pw_confirm").focus();
			return false;
		} else if ($("#user_pw").val() !== $("#user_pw_confirm").val()) {
			alert("패스워드가 맞지 않습니다.");
			$("#user_pw_confirm").focus();
			$("#user_pw_confirm").val("");
			return false;
		} else if ($("#user_name").val() == "") {
			alert("name을 입력해 주세요");
			$("#user_name").focus();
			return false;
		} else if (!idCheck) {
			alert("아이디 체크를 해주세요");
			return false;
		}
	});
</script>

<%@ include file="../include/footer.jsp"%>





