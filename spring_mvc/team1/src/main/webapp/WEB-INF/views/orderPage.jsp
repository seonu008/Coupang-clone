<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<link rel="stylesheet" href="/team1/css/reset.css" />
<link rel="stylesheet" href="/team1/css/layout.css" />
<link rel="stylesheet" href="/team1/css/mainPage.css" />
<script src="/team1/js/gsap/gsap.min.js"></script>
<script src="/team1/js/axios.min.js"></script>
<script src="/team1/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet" href="/team1/css/orderPage.css" />
<script src="/team1/js/orderPage.js" defer></script>
<link rel="stylesheet" href="/team1/css/searchPage.css" />
<script src="/team1/js/searchPage.js" defer></script>
<script src="/team1/js/renderDetail.js" defer></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function postCode() {
		new daum.Postcode({
			oncomplete : function(data) {

				let roadAddr = data.roadAddress; // 도로명 주소 변수
				let extraRoadAddr = ''; // 참고 항목 변수

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("dAupdate").value = data.zonecode;
				document.getElementById("zipcode").value = data.address;
				//document.getElementById("zipcode").value = data.zonecode;
				document.querySelector("input[name=address_detail]").focus();

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

			}
		}).open();
	}
</script>
</head>
<main>
	<div id="wrap">
		<div class="ordHeaderBox">
			<div class="ordHeader">
				<div class="logo">
					<a href="/team1"><img src="../image/layout/sampleLogo.png"
						alt="" /></a>
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
						<p>
							<strong>주문/결제</strong>
						</p>
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
													<input type="tel" class="ctPhoneInput"
														value='${memberDto.phone}' />
													<button type="submit" class="ctPhoneUpdate">수정</button>
													<span class="ctPhoneTelDesc">쿠폰/티켓정보는 구매한 분의 번호로
														전송됩니다.</span>
												</div>
											</form>
										</div>
										<div>
											<p class="ctPhoneNoti">* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및
												스팸 설정을 확인해 주세요.</p>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="deliveryAddress">
				<div class="dABox">
					<div class="dAHeader">
						<h2 class="dA_h2">받는사람정보</h2>
						<button type="button" class="dAUpdate" id="dAupdate"
							onclick="postCode()">배송지변경</button>
					</div>
					<table class="dATable">
						<tbody>
							<tr>
								<td class="dA_col dA_col_1">이름</td>
								<td class="dA_col dA_col_2">${memberDto.name}</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">배송주소</td>
								<td class="dA_col dA_col_2"><input type="text" id="zipcode"
									name="address" readonly></td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">상세주소</td>
								<td class="dA_col dA_col_2"><input type="text"
									name="address_detail" class="address_detail"></td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">휴대폰 번호</td>
								<td class="dA_col dA_col_2">${memberDto.phone}</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">배송 요청사항</td>
								<td class="dA_col dA_col_2">직접 받고 부재시 문 앞</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>




			<div class="deliveryInfo">
				<h2 class="dI_h2">배송정보</h2>
				<div class="dIBox">
					<div class="bundleItemList">
						<c:forEach var="cartDto" items="${cartDtos}">
							<div class="wrapper">
								<div class="bundleTitle">${cartDto.title}</div>
								<div class="bundleDeliveryPrice">${cartDto.itemAmount}개
									/ 무료배송</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="deliveryAddress">
				<div class="dABox">
					<div class="dAHeader">
						<h2 class="dA_h2">결제정보</h2>
					</div>
					<table class="dATable">
						<tbody>
							<tr>
								<td class="dA_col dA_col_1">총상품가격</td>


								<td class="dA_col dA_col_2"><fmt:formatNumber
										value="${ totalPrice }" pattern="#,###" />원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">배송비</td>
								<td class="dA_col dA_col_2">0원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">총결제금액</td>
								<td class="dA_col dA_col_2"><fmt:formatNumber
										value="${ totalPrice }" pattern="#,###" />원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">결제방법</td>
								<td class="dA_col dA_col_2"><input class="payTypeSelector"
									type="radio" name="payType" checked> <label
									class="payTypeLabel"> <span class="payTypeTxt">계좌이체</span>
								</label> <input class="payTypeSelector" type="radio" name="payType">
									<label class="payTypeLabel"> <span class="payTypeTxt">신용/체크카드</span>
								</label> <input class="payTypeSelector" type="radio" name="payType">
									<label class="payTypeLabel"> <span class="payTypeTxt">법인카드</span>
								</label> <input class="payTypeSelector" type="radio" name="payType">
									<label class="payTypeLabel"> <span class="payTypeTxt">휴대폰</span>
								</label> <input class="payTypeSelector" type="radio" name="payType">
									<label class="payTypeLabel"> <span class="payTypeTxt">무통장입금(가상계좌)</span>
								</label>
									<div class="savePaymentOption">
										<input class="savePaymentOption_checkBox" type="checkbox">
										<label class="savePaymentOption_Txt">선택한 결제수단으로 향후 결제
											이용에 동의합니다.</label>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="agreeBox">
				<button type="button" class="ordResetBtn">
					<a href="">취소</a>
				</button>
				<button type="button" class="ordAgreeBtn">
					<a href="">결제하기</a>
				</button>
			</div>
		</section>
	</div>
</main>
</html>

