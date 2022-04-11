var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

let idCheck = false;
const korean = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;

$(".btnConfirm").on("click", async function (e) {
  $.ajaxSetup({
    headers: {
      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
  });

  // id 중복체크
  const id = $("#user_id").val();
  console.log("id :" + id);
  await $.ajax({
    url: "IDCheck.do",
    type: "POST",
    data: {
      id: id,
    },
    success: function (res) {
      console.log(res);
      if (res.count > 0) {
        alert("사용할 수 없는 아이디입니다.");
        $("#user_id").val("");
        $("#user_id").focus();
      } else {
        idCheck = true;
        console.log("idCheck :" + idCheck);
      }
    },
  });

  // 빈칸확인
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
  } else if ($("#user_name").val() == "") {
    alert("이름을 입력해 주세요");
    $("#user_name").focus();
    return false;
  } else if ($("#phone").val() == "") {
    alert("전화번호를 입력해 주세요");
    $("#user_name").focus();
    return false;
  } else if (!idCheck) {
    alert("아이디 체크를 해주세요");
    return false;
  }
});
