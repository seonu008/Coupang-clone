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
    <link rel="stylesheet" href="css/orderPage.css" />
    <script src="js/gsap/gsap.min.js"></script>
    <script src="js/axios.min.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/orderPage.js" defer></script>
  </head>
  <body>
    <div id="wrap">
      <div class="ordHeaderBox">
        <div class="ordHeader">
          <div class="logo">
            <a href=""><img src="image/layout/sampleLogo.png" alt="" /></a>
          </div>
        </div>
      </div>
      <section id="ord">
        <div class="ordTitleBox">
          <div class="ordTitle">
            <p>주문/결제</p>
          </div>
          <div class="ordStep">
            <div class="ordNum">
              <p>장바구니</p>
              <span class="material-icons ordArrow">arrow_forward_ios</span>
              <p><strong>주문/결제</strong></p>
              <strong><span class="material-icons ordArrow">arrow_forward_ios</span></strong>
              <p>주문완료</p>
            </div>
          </div>
        </div>
        <div class="customer">
          <div class="ctBox">
            <h2 class="ct_h2">구매자정보</h2>
            <table class="ctTable">
              <tbody>
                <tr>
                  <td class="ct_col ct_col_1">이름</td>
                  <td class="ct_col ct_col_2">${memberDto.name}</td>
                </tr>
                <tr>
                  <td class="ct_col ct_col_1">이메일</td>
                  <td class="ct_col ct_col_2">${memberDto.id}</td>
                </tr>
                <tr>
                  <td class="ct_col ct_col_1">휴대폰 번호</td>
                  <td class="ct_col ct_col_2">
                    <div class="ctPhoneBox">
                      <div class="ctPhoneForm">
                        <form>
                          <div>
                            <input type="tel" class="ctPhoneInput" value='${memberDto.phone}' />
                            <button type="submit" class="ctPhoneUpdate">수정</button>
                            <span class="ctPhoneTelDesc">쿠폰/티켓정보는 구매한 분의 번호로 전송됩니다.</span>
                          </div>
                        </form>
                      </div>
                      <div>
                        <p class="ctPhoneNoti">* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.</p>
                      </div>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
