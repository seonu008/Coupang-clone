<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<main>
	<div id="wrap">
		<div class="ordHeaderBox">
			<div class="ordHeader">
				<div class="logo">
					<a href=""><img src="../image/layout/sampleLogo.png" alt="" /></a>
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
						<button type="button" class="dAUpdate">배송지변경</button>
					</div>
					<table class="dATable">
						<tbody>
							<tr>
								<td class="dA_col dA_col_1">이름</td>
								<td class="dA_col dA_col_2">${memberDto.name}</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">배송주소</td>
								<td class="dA_col dA_col_2">${memberDto.address}</td>
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
				<h2 class="dI_h2">배송 X건 중 X</h2>
				<div class="dIBox">
					<div class="arrivalInformation">
						<p>${memberDto.regdate} 도착 보장</p>
					</div>
					<div class="bundleItemList">
						<p>제품명</p>
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
								<td class="dA_col dA_col_2">원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">배송비</td>
								<td class="dA_col dA_col_2">원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">총결제금액</td>
								<td class="dA_col dA_col_2">원</td>
							</tr>
							<tr>
								<td class="dA_col dA_col_1">결제방법</td>
								<td class="dA_col dA_col_2">
									<input class="payTypeSelector" type="radio" checked>
									<label class="payTypeLabel">
										<span class="payTypeTxt">계좌이체</span>
									</label>
									<input class="payTypeSelector" type="radio">
									<label class="payTypeLabel">
										<span class="payTypeTxt">신용/체크카드</span>
									</label>
									<input class="payTypeSelector" type="radio">
									<label class="payTypeLabel">
										<span class="payTypeTxt">법인카드</span>
									</label>
									<input class="payTypeSelector" type="radio">
									<label class="payTypeLabel">
										<span class="payTypeTxt">휴대폰</span>
									</label>
									<input class="payTypeSelector" type="radio">
									<label class="payTypeLabel">
										<span class="payTypeTxt">무통장입금(가상계좌)</span>
									</label>
									<div class="savePaymentOption">
										<input class="savePaymentOption_checkBox" type="checkbox">
										<label class="savePaymentOption_Txt">선택한 결제수단으로 향후 결제 이용에 동의합니다.</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="agreeBox">
				<button type="button" class="ordResetBtn"><a href="">취소</a></button>
				<button type="button" class="ordAgreeBtn"><a href="">결제하기</a></button>
			</div>
		</section>
	</div>
</main>
</html>
