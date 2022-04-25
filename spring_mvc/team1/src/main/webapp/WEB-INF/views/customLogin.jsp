<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="/team1/js/gsap/gsap.min.js"></script>
    <script src="/team1/js/axios.min.js"></script>
    <script src="/team1/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Document</title>
    <style>
      body {
        margin: 5vw;
      }

      .need_size {
        position: relative !important;
        left: calc(50% - 15vw);
        width: 30vw !important;
      }

      #member__join__show__password {
        position: absolute;
        top: 14px;
        right: 12px;
        margin: 0;
      }

      .member__field-wrap {
        *zoom: 1;
        margin: 2.9% 0 0;
      }

      .member__field-wrap:before,
      .member__field-wrap:after {
        overflow: hidden;
        content: "";
        display: table;
        _display: block;
        width: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        clear: both;
      }

      .member__input-field {
        *zoom: 1;
        position: relative;
      }

      .member__input-field:before,
      .member__input-field:after {
        overflow: hidden;
        content: "";
        display: table;
        _display: block;
        width: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        clear: both;
      }

      .member__input-border:focus,
      .member__input-border--focus {
        outline: 0;
        border: 1px solid #346aff;
      }

      .member__input-border:focus.member__input-border--error,
      .member__input-border--error {
        border: 1px solid #e7223d;
      }

      .expose__password__wrapper {
        width: 238px;
        height: 15px;
        font-family: "Apple SD Gothic Neo", serif;
        position: relative;
        top: -30px;
        font-size: 12px;
        font-weight: normal;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        color: #111;
        margin-left: 14px;
      }

      #__join__password__description {
        width: 312px;
        height: 12px;
        font-family: "Apple SD Gothic Neo", serif;
        font-size: 11px;
        font-weight: normal;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        color: #333;
      }

      .member__input-field--util {
        padding-right: 46px;
      }

      .member__expand-field {
        margin: 0;
        padding: 0;
        border: 0;
        display: block;
      }

      .__display__password {
        position: relative;
        display: inline;
        height: 100%;
        margin-right: 2%;
        margin-top: -7%;
        margin-left: 93%;
      }

      .__expose_password_target {
        height: 100px;
      }

      ._joinPasswordInputStatusTarget {
        position: relative;
      }

      .member__input-wrap,
      .member__input-wrap-v2 {
        *zoom: 1;
        display: block;
        position: relative;
        height: 48px;
        padding: 0;
        border: 1px solid #ccc;
        background-color: #fff;
        transition: border-color 0.25s ease;
      }

      .member__input-wrap:before,
      .member__input-wrap-v2:before,
      .member__input-wrap:after,
      .member__input-wrap-v2:after {
        overflow: hidden;
        content: "";
        display: table;
        _display: block;
        width: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        clear: both;
      }

      .member__input-field--util .member__input-wrap,
      .member__input-field--util .member__input-wrap-v2 {
        margin-right: -46px;
        padding-right: 46px;
      }

      .member__input-wrap--error {
        position: relative;
        border-color: #e52528;
      }

      .member__input-wrap--small {
        height: 34px;
      }

      .member__input-wrap-v2:focus-within {
        border-bottom: 2px solid #346aff;
      }

      .member__input-wrap-v2--focus {
        border-bottom: 2px solid #346aff;
      }

      .member__input-wrap-v2.member__input-wrap--error,
      .member__input-wrap-v2--error {
        border-color: #ccc;
        border-bottom: 2px solid #e7223d;
      }

      .member__input-wrap-v2 input:focus {
        outline: 0;
      }

      .member__input-group {
        position: relative;
        overflow: hidden;
        display: block;
        margin: 0;
      }

      .member__input-group--icon-label {
        position: relative;
        float: left;
        display: inline;
        min-width: 44px;
        _width: 44px;
        height: 100%;
        border-right: 1px solid #ccc;
        background-color: #fafafa;
      }

      .member__input-group--validator {
        position: relative;
        float: right;
        width: 44px;
        height: 100%;
      }

      .member__input-group--util {
        position: relative;
        float: right;
        height: 100%;
      }

      .member__input-field--util .member__input-group--util {
        position: absolute;
        top: 1px;
        right: 1px;
        bottom: 1px;
        width: 46px;
        height: auto;
      }

      .member__util-trigger {
        overflow: hidden;
        width: 46px;
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: transparent;
        border: 0;
        font-size: 1px;
        color: transparent;
      }

      .member__util-trigger[disabled],
      .member__util-trigger[readonly] {
        background-color: #eee;
      }

      .member__input-area__overlap-label,
      .member__input {
        width: 100%;
        padding: 16px 0 12px;
        border: 0 none;
        background: none transparent;
        font-family: dotum, sans-serif;
        font-size: 14px;
        line-height: 20px;
        color: #111;
        font-weight: 700;
        text-indent: 12px;
      }

      .member__input {
        margin: 0;
        height: 48px;
        box-sizing: border-box;
      }

      .member__input::-webkit-input-placeholder {
        color: #aaa;
      }

      .member__input::-moz-placeholder {
        color: #aaa;
      }

      .member__input:-ms-input-placeholder {
        color: #aaa;
      }

      .member__input:-moz-placeholder {
        color: #aaa;
      }

      .member__input[readonly] {
        background-color: #eee !important;
        color: #888 !important;
      }

      .member__input[readonly]:-webkit-autofill {
        box-shadow: inset 0 0 100px #eee;
        -webkit-text-fill-color: #888;
      }

      .member__input--small {
        height: 34px;
        padding-top: 9px;
        padding-bottom: 7px;
        font-size: 12px;
        line-height: 18px;
        text-indent: 8px;
      }

      .member__input--small:focus {
        outline: 0;
      }

      .member__input-area__overlap-label {
        overflow: hidden;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        opacity: 0;
        transition: opacity 0.25s ease;
        color: #aaa;
        cursor: text;
        white-space: nowrap;
        text-overflow: ellipsis;
      }

      .member__input[value=""] ~ .member__input-area__overlap-label {
        opacity: 1;
      }

      .member__input:focus ~ .member__input-area__overlap-label,
      .member__input-area__overlap-label--hidden {
        opacity: 0;
      }

      .member__expand-field {
        *zoom: 1;
      }

      .member__expand-field:before,
      .member__expand-field:after {
        overflow: hidden;
        content: "";
        display: table;
        _display: block;
        width: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        clear: both;
      }

      .member__message-area {
        display: block;
        margin: 9px 12px 0;
        padding: 0;
        font-family: dotum, sans-serif;
        font-size: 12px;
        line-height: 18px;
        cursor: default;
      }

      .member__message-area--error {
        color: #e52528;
      }

      .member__message-area--info {
        color: #555;
      }

      .member__message-area--notice {
        position: relative;
        color: #555;
        font-size: 10px;
      }

      .member__message-area--notice:before {
        display: inline-block;
        position: absolute;
        top: 0;
        left: -12px;
        width: 14px;
        height: 14px;
        content: "â“˜";
        color: #a2a2a2;
        font-weight: bold;
      }

      .member__expand-box .member__message-area {
        margin-top: 5px;
      }

      .member__button-area {
        display: block;
        margin: 9px 12px 0;
      }

      .member__expand-box {
        padding: 10px;
        margin: -1px 0 0;
        border: 1px solid #ccc;
        background-color: #fafafa;
        box-shadow: inset 0 1px 0 rgba(0, 0, 0, 0.05);
      }

      .member__input-guide-area {
        display: block;
        padding: 0;
        font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
          nanumgothic, dotum, sans-serif;
        font-size: 12px;
        line-height: 18px;
        cursor: default;
      }

      .member__input-guide-padding {
        width: 0;
        height: 0;
        display: inline-block;
      }

      .member__input-guide-line {
        color: #888;
        display: table;
      }

      .member__input-guide-line span {
        display: table-cell;
      }

      .member__input-guide-line:first-of-type {
        margin-top: 6px;
      }

      .member__input-guide-line--error {
        color: #e52528;
      }

      .member__input-guide-line--success {
        color: #00891a;
      }

      .member__field-wrap .member__input-guide-line,
      .member__input-field-wrap .member__input-guide-line,
      .member__input-field .member__input-guide-line {
        margin: 0 12px;
      }

      .member__field-wrap .member__input-guide-line:first-of-type,
      .member__input-field-wrap .member__input-guide-line:first-of-type,
      .member__input-field .member__input-guide-line:first-of-type {
        margin-top: 9px;
      }

      body.page-login-play .member__field-wrap:first-child {
        margin: 0;
      }

      body.page-login-play .login__content--input {
        padding-top: 6px;
      }

      body.page-login-play .member__input-wrap,
      body.page-login-play .member__input-wrap-v2,
      body.page-login-play .member__input-wrap-v2 {
        height: 44px;
        border: 1px solid #555;
        border-radius: 4px;
        background-color: transparent;
      }

      body.page-login-play .member__input-wrap.member__input-wrap--error,
      body.page-login-play .member__input-wrap--error.member__input-wrap-v2,
      body.page-login-play .member__input-wrap-v2.member__input-wrap--error {
        border: 1px solid #e64a2d;
      }

      body.page-login-play .member__input-wrap-v2:focus-within {
        border: 1px solid #fff;
      }

      body.page-login-play .member__input-group--icon-label {
        width: 75px;
        height: initial;
        line-height: 20px;
        padding: 14px 0 10px 16px;
        font-size: 14px;
        color: #fff;
        font-weight: bold;
        border-right: 0;
        background-color: transparent;
        box-sizing: border-box;
      }

      body.page-login-play .member__input-area__overlap-label,
      body.page-login-play .member__input {
        height: 44px;
        padding: 13px 0 11px 0;
        color: #fff;
        font-weight: normal;
        text-indent: 0;
      }

      body.page-login-play .member__input-area__overlap-label[readonly],
      body.page-login-play .member__input[readonly] {
        background-color: transparent !important;
      }

      body.page-login-play .member__input-area__overlap-label:-webkit-autofill,
      body.page-login-play
        .member__input-area__overlap-label:-webkit-autofill:hover,
      body.page-login-play
        .member__input-area__overlap-label:-webkit-autofill:focus,
      body.page-login-play .member__input:-webkit-autofill,
      body.page-login-play .member__input:-webkit-autofill:hover,
      body.page-login-play .member__input:-webkit-autofill:focus {
        transition: background-color 5000s ease-in-out 0;
        -webkit-transition: background-color 9999s ease-out;
        -webkit-box-shadow: 0 0 0 0 transparent inset !important;
        -webkit-text-fill-color: #fff !important;
      }

      body.page-login-play
        .member__input-area__overlap-label#login-captcha-input,
      body.page-login-play .member__input#login-captcha-input {
        text-indent: 16px;
      }

      body.page-login-play .member__message-area {
        margin: 4px 0 0;
      }

      body.page-login-play
        .member__input-group--util
        .member__util-trigger[disabled],
      body.page-login-play
        .member__input-group--util
        .member__util-trigger[readonly] {
        background-color: transparent;
      }

      body.page-login-play
        .member__input-group--util
        .member__util-trigger--password {
        width: 16px;
      }

      .login__separator {
        display: block;
        width: 100%;
        height: 0;
        margin: 18px 0 0;
        padding: 0;
        border: 0;
        border-top: 1px solid #ddd;
      }

      .login__hidden {
        position: absolute;
        opacity: 0;
        filter: alpha(opacity = 0);
      }

      .login__content {
        *zoom: 1;
      }

      .login__content:before,
      .login__content:after {
        overflow: hidden;
        content: "";
        display: table;
        _display: block;
        width: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        clear: both;
      }

      .login__content--adult {
        margin-top: 15px;
        font-size: 12px;
        color: #555;
        line-height: 16px;
      }

      .login__content--password-changed {
        margin-top: 18px;
        margin-bottom: 18px;
        padding: 20px 16px 20px 16px;
        color: #333;
        font-size: 12px;
        border: solid 1px #d9d5b4;
        background-color: #fffeed;
      }

      .login__content--password-changed-mobile {
        margin-top: 20px;
        margin-bottom: 20px;
        padding: 20px 16px 20px 16px;
        color: #333;
        font-size: 12px;
        border: solid 1px #d9d5b4;
        background-color: #fffeed;
      }

      .login__content--util {
        margin: 12px 0 0;
      }

      .login__content--util .member__checkbox {
        display: inline-block;
      }

      .login__content--trigger {
        margin: 14px 0 0;
      }

      .login__link {
        text-decoration: none;
        color: #0073e9;
        font-size: 14px;
        line-height: 24px;
      }

      .login__link[disabled] {
        cursor: not-allowed;
      }

      .login__link--find-id-password {
        float: right;
        position: relative;
        padding-right: 12px;
      }

      .login__link--find-id-password .member__sprite--right-arrow {
        position: absolute;
        top: 50%;
        right: 0;
        margin-top: -7px;
      }

      .login__button {
        display: inline-block;
        overflow: hidden;
        border: 0;
        border-radius: 2px;
        background-clip: padding-box;
        text-align: center;
        transition: background-color 0.75s ease;
        font-weight: 700;
        text-decoration: none;
      }

      .login__button.login__button--submit {
        background-color: #0074e9;
        color: #fff;
        box-shadow: inset 0 -2px 0 rgba(0, 0, 0, 0.38);
        padding: 16px 17px;
        font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
          nanumgothic, dotum, sans-serif;
        font-size: 17px;
        line-height: 20px;
        display: block;
        padding-left: 0;
        padding-right: 0;
        width: 100%;
      }

      .login__button.login__button--submit[disabled] {
        background-color: #ccc;
        box-shadow: none;
        cursor: wait;
        color: #eee;
      }

      .login__button.login__button--submit:active {
        box-shadow: inset 0 2px 0 rgba(0, 0, 0, 0.38);
      }

      .login__button.login__button--join {
        border: 1px solid #ccc;
        background-color: #fff;
        color: #0073e9;
        box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
        padding: 16px 17px;
        font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
          nanumgothic, dotum, sans-serif;
        font-size: 17px;
        line-height: 20px;
        display: block;
        padding-left: 0;
        padding-right: 0;
        margin: 18px 0 0;
      }

      .login__button.login__button--join[disabled] {
        color: #ccc !important;
        background-color: #fafafa;
        box-shadow: none;
        cursor: wait;
      }

      .login__button.login__button--join:active {
        box-shadow: inset 0 1px 0 rgba(0, 0, 0, 0.15);
      }

      .login__util__keep-login {
        float: left;
      }

      .login__keep-message {
        position: relative;
        float: left;
        clear: both;
        white-space: nowrap;
        margin: 8px 0 0;
        padding: 6px;
        font-size: 12px;
        font-family: dotum, sans-serif;
        letter-spacing: -1px;
        border: 0 none;
        color: #555;
        background-color: #f4f4f4;
        display: inline-block;
      }

      body.page-login-play .login__button.login__button--submit {
        padding: 13px 17px 11px;
        margin-top: 16px;
        font-size: 16px;
        border-radius: 4px;
        background-color: #00a7f6;
        box-shadow: none;
      }

      body.page-login-play .login__content--util {
        margin: 24px 0 0;
        text-align: center;
      }

      body.page-login-play
        .login__content--util
        .login__link--find-id-password {
        height: 24px;
        line-height: 24px;
        padding: 0 0 0 8px;
        color: #fff;
        display: inline-block;
        float: none;
      }

      body.page-login-play
        .login__content--util
        .login__link--find-id-password:first-child {
        padding: 0 8px 0 0;
      }

      body.page-login-play
        .login__content--util
        .login__link--find-id-password._loginFindIdPwLink {
        display: none;
      }

      body.page-login-play
        .login__content--util
        .login__partition--find-id-password {
        border-right: 1px solid #555;
        height: 12px;
        margin-top: 5px;
        display: inline-block;
        vertical-align: top;
      }
    </style>
  </head>

  <body>
    <form method="post" action="/team1/login">
      <div class="member-wrapper member-wrapper--flex">
        <header class="member-header">
          <h1 class="member-logo">
            <a href="/team1/" class="member-logo__link">
              <img
                src="//static.coupangcdn.com/image/static/login/logo-coupang.x2.20201201.png"
                width="100%"
                height="100%"
                class="member-logo__img-fixer need_size"
                alt="coupang"
              />
            </a>
          </h1>
        </header>

        <div class="member-main">
          <div class="member-login _loginRoot">
            <div class="heads-up"></div>

            <div class="login__form _loginForm">
              <div class="login__content login__content--input">
                <div class="member__field-wrap">
                  <div class="member__input-field">
                    <label
                      class="member__input-wrap member__input-wrap-v2"
                      for="login-email-input"
                    >
                      <span
                        class="member__input-group member__input-group--icon-label"
                      >
                        <i class="member__sprite member__sprite--email"></i>
                      </span>
                      <span class="member__input-group">
                        <input
                          type="email"
                          class="member__input _loginIdInput ui-autocomplete-input"
                          maxlength="80"
                          name="username"
                          id="login-email-input"
                          value=""
                          placeholder="아이디(이메일)"
                          autocomplete="off"
                        />
                      </span>
                    </label>
                  </div>
                  <div class="member__expand-field">
                    <div
                      class="member__message-area member__message-area--error _memberInputMessage"
                      style="display: none"
                    ></div>
                  </div>
                </div>

                <div class="member__field-wrap">
                  <div class="member__input-field member__input-field--util">
                    <label
                      class="member__input-wrap member__input-wrap-v2"
                      for="login-password-input"
                    >
                      <span
                        class="member__input-group member__input-group--icon-label"
                      >
                        <i class="member__sprite member__sprite--password"></i>
                      </span>
                      <span class="member__input-group">
                        <input
                          type="password"
                          class="member__input _loginPasswordInput"
                          value=""
                          name="password"
                          id="login-password-input"
                          placeholder="비밀번호"
                        />
                      </span>
                    </label>
                  </div>
                  <div class="member__expand-field">
                    <div
                      class="member__message-area member__message-area--error _loginPasswordError"
                      style="display: none"
                    ></div>
                  </div>
                </div>
              </div>

              <div class="login__content login__content--message">
                <div
                  class="member__message-area member__message-area--error _loginCommonError"
                  style="display: none"
                ></div>
              </div>
              <div class="login__content login__content--util">
                <label
                  for="login-keep-state"
                  class="member__checkbox login__util__keep-login"
                >
                  <input
                    class="member__checkbox__input member__sprite-after member__sprite-after--checkbox _loginRememberInput"
                    type="checkbox"
                    name="remember-me"
                    id="login-keep-state"
                  />
                  <span class="member__checkbox__label">자동로그인</span>
                </label>
                <a
                  class="login__link login__link--find-id-password _loginFindIdPwLink"
                >
                  아이디(이메일)/비밀번호 찾기
                  <i class="member__sprite member__sprite--right-arrow"></i>
                </a>
                <div
                  class="login__keep-message _loginRememberMessage"
                  style="display: none"
                >
                  <i class="member__sprite member__sprite--triangle"></i> 개인
                  정보 보호를 위해 본인 기기에서만 이용해 주세요.
                </div>
              </div>
              <div class="login__content login__content--trigger">
                <button
                  class="login__button login__button--submit _loginSubmitButton btnConfirm"
                  type="submit"
                >
                  로그인
                </button>
                <hr class="login__separator" />

                <a
                  href="./join/Join.do"
                  class="login__button login__button--join _loginJoinLink"
                  >회원가입</a
                >
              </div>
            </div>
          </div>
        </div>
        <footer class="member-footer">
          <div>©Coupang Corp. All rights reserved.</div>
        </footer>
      </div>
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />
    </form>
  </body>

  <script>
    $(".btnConfirm").on("click", function () {
      if ($("input[name='username']").val() === "") {
        alert("아이디를 입력하세요.");
        $("input[name='username']").focus();
        return false;
      } else if ($("input[name='password']").val() === "") {
        alert("비밀번호를 입력하세요.");
        $("input[name='password']").focus();
        return false;
      }
    });
  </script>
</html>
