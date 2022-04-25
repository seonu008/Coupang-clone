<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="include/header.jsp"%>  
<style>
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
			<div id="container">
			
      <div class="prodBuy" data-no="${key.no}">
        <div class="info">
          <div class="prodHeader">
            <h2 class="prodTitle">${key.title}</h2>
            <tbody>
              <tr>
                <td>
	                <span class="rating"></span>
	                <span id="rating" class="${key.rating}"><img src="image/rating.svg" /></span>
	                <span id="star"></span>
                </td>
              </tr>
            </tbody>
          </div>
          <div class="favorite">
            <button id="test1" class="favoriteBtn"></button>
          </div>
          <div class="share">
            <button class="shareBtn"></button>
          </div>
          <div class="Table">
            <div>
                <div class="prodPrice">
                  <span class="price"><strong class="${key.price}" id="${key.price}">${key.price}원</strong></span>
                  <img src="image/rocket_logo.png" alt="">
                </div>
              <div>
                <div>
                    <span class="shipping">${key.shipping}</span>
                </div>
                <div>
                  <div class="prodPdd">
                    <em class="pddDay">내일(수) 4/27</em>
                    <em class="pddTxt">도착 보장</em>
                    <em class="pddDelay">(5시간 5분 내 주문 시 / 서울⋅경기 기준)</em>
                  </div>
                </div>
                <div class="prodReward">
                  <div class="prodReCash">
                    <div class="reward">
                      <div class="rewardTitle">
                        <img src="image/cash-icon.png" alt="">
                        <strong>캐시적립 혜택</strong>
                        <span class="reIcon">상세보기</span>
                      </div>
                    </div>
                  </div>
                  <div class="rewardContainer">
                  <div class="rewardPromotion">
                    <p class="promotionItem">쿠페이 머니 결제 시 1% 적립</p>
                    <p class="promotionItem">[로켓와우 + 쿠페이 계좌이체] 결제 시 2% 적립</p>
                    <p class="promotionItem">[로켓와우 + 쿠페이 머니} 결제 시 4% 추가적립
                      <strong>3229일 남음</strong>
                    </p>
                    <button class="rewardBtn">로켓와우 무료체험 신청하기</button>
                  </div>
                </div>
                </div>
              <div class="prodBtns" >
                <div class="length">
                  <input id="cnt" name="cnt" type="text" min=0 value="1" autocomplete="off"/>
               <div style="display: table-cell; vertical-align: top;">
                 <button class="prodPlus" type="button"><span class="material-icons">
                  expand_less
                  </span></button>
                 <button class="prodMinus" type="button"><span class="material-icons">
                  expand_more
                  </span></button>
                </div>
              </div>
              <div id="btns" class="btns">
                <a id="btns1" class="btns1">장바구니 담기</a>
                <a href="./member/OrderPage.do?no=${key.no}" id="btns2" class="btns2">바로구매<span class="material-icons">
                  chevron_right
                  </span></a>
              </div>
              </div>
                <div id="CartTable" class="CartTable">
                <div class="Cart">
                  <a id="CartClose" class="CartClose"></a>
                  <p>상품이 장바구니에 담겼습니다.</p>
                  <div class="CartBtns">
                  <a href="./InsertCart.do?no=${key.no}" class="CartBtn">장바구니 바로가기<span class="material-icons">
                    chevron_right
                    </span></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="imgBox">
            <img src="${key.imgUrl}" alt="" />
            <!-- <ul>
              <li>
                <a href="#a"><img src="../image/tissue02.jpg" alt="" /></a>
              </li>
              <li>
                <a href="#a"><img src="../image/tissue.jpg" alt="" /></a>
              </li>
            </ul> -->
          </div>
        </div>
      </div>
    </div>
    <div class="imgDetail">
      <ul class="btnTab">
        <li name="detail">상품상세</li>
        <li name="review">상품평</li>
        <li name="qna">상품문의</li>
        <li name="etc">배송/교환/반품 안내</li>
      </ul>
      <img src="${key.imgDetailUrl}" alt="" />
    </div>
</main>

</html>