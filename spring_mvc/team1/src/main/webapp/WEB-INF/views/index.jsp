<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>  

    <!-- (main>(.main-today>.img)+(.discovery>((.row1>.img1+.img2)+(.row2>.img1+.img2+.img3+.img4)+(.row3>.img1+.img2+.img3)))+(.trend>.title+.img+(.items>(.row1>.img1+.img2+.img3)+(.row2>.img1+.img2+.img3))))+footer -->
    <main>
      <div class="main-today">
        <div class="img"></div>
      </div>
      <div class="discovery">
        <h3>오늘의 발견</h3>
        <div class="discoveryWrap" >
	        <div class="discoveryBox">
	          <div class="dcBoxTop">
	            <div class="dcBoxTopImg img1"></div>
	            <div class="dcBoxTopImg img2"></div>
	          </div>
	          <div class="dcBoxMid">
	            <div class="dcBoxMidImg img1"></div>
	            <div class="dcBoxMidImg img2"></div>
	            <div class="dcBoxMidImg img3"></div>
	            <div class="dcBoxMidImg img4"></div>
	          </div>
	          <div class="dcBoxBtm">
	            <div class="dcBoxBtmImg img1"></div>
	            <div class="dcBoxBtmImg img2"></div>
	            <div class="dcBoxBtmImg img3"></div>
	          </div>
	        </div>
	      </div>
	    </div>
      <div class="trend">
        <div class="trendMainTitle"></div>
        <div class="trendWrap">
          <div class="trendTitleBox">
            <div class="trendTitle"></div>
          </div>
          <div class="trendImg"></div>
          <div class="trendItems">
            <div class="trendItemsTop">
              <div class="trendItemsBox">
                <div class="trendItemImg img1">
                </div>
                <p>[푸드팜]국산 흙당근 햇당근 사이즈별, 5kg(상)</p>
                <p>14,900원</P>
              </div>
              <div class="trendItemsBox">
                <div class="trendItemImg img2"></div>
                <p>프렌즈파머 제주 야생화 벌꿀, 500g, 1개</p>
                <p>14,900원</P>
              </div>
              <div class="trendItemsBox">
                <div class="trendItemImg img3"></div>
                <p>KitKat 오리지널 밀크초콜릿 24p, 408g, 1개</p>
                <p>17,950원</p>
              </div>
            </div>
            <div class="trendItemsBtm">
              <div class="trendItemsBox">
                <div class="trendItemImg img1"></div>
                <p>연세우유 16곡 꿀선식 두유, 190ml, 24개</p>
                <p>12,900원</P>
              </div>
              <div class="trendItemsBox">
                <div class="trendItemImg img2"></div>
                <p>에브리데이 산수, 1L, 24개</p>
                <p>9,450원</P>
              </div>
              <div class="trendItemsBox">
                <div class="trendItemImg img3"></div>
                <p>부산 대저 토마토/짭짤이 2.5kg, 랜덤혼합(2S-2L)</p>
                <p>17,900원</P>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
<footer id="footer" class="footer">
          <div class="footerMenu">
              <a href="https://www.aboutcoupang.com/ko/" target="_blank">회사소개</a>
              <a href="https://rocketyourcareer.kr.coupang.com" target="_blank">인재채용</a>
              <a href="https://csmessenger.coupang.com/cs-center/notice/main">공지사항</a>
              <a href="https://csmessenger.coupang.com/cs-center/voc/main">고객의 소리</a>
              <a href="/np/policies/terms">이용약관</a>
              <a href="/np/policies/privacy"><b>개인정보 처리방침</b></a>
              <a href="/np/safety">신뢰관리센터</a>
              <a href="https://partners.coupang.com/" target="_blank">제휴마케팅</a>
              <a href="https://ads.coupang.com" target="_blank">광고안내</a>
          </div>
          <%-- <div class="footer-layer2">
              <h1><a href="/" title="COUPANG">COUPANG</a></h1>
              <div class="footer-content">
                  <address>
                      상호명 및 호스팅 서비스 제공 : 쿠팡(주)<br />
                      대표이사 : 강한승,박대준<br />
                      서울시 송파구 송파대로 570 <br />
                      사업자 등록번호 : 120-88-00767 <br />
                      통신판매업신고 : 2017-서울송파-0680<br />
                      <a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767" target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
                  </address>
                  <div class="contact-info">
                      <a href="https://csmessenger.coupang.com/cs-center/chat/main" class="call-center" title="365 고객센터">
                          <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br />
                          <em>1577-7011 (유료)</em>
                          서울시 송파구 송파대로 570<br />
                          <span class="contact-fax">email : help@coupang.com</span>
                      </a>
                  </div>
                  <p class="safe-service">
                      <strong>우리은행 채무지급보증 안내</strong><br />
              <span>
                  당사는 고객님이 현금 결제한 금액에 대해<br />우리은행과 채무지급보증 계약을 체결하여<br />안전거래를 보장하고 있습니다.<br />
              </span>
                      <a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
                  </p>
              </div>
          </div> --%>
          <div class="footer-layer3 slide-unit">
              <div class="certification-list" style="width: 800px;height: 80px; margin: 0 auto; background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v10.png) no-repeat; background-position: -44px -92px; position: relative;">
              </div>
          </div>
          <%-- <div class="footer-layer4">
              <div class="coupang-copyright">
              <p class="info" style="padding-top:9px">사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.   <br> 마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다. <br>쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에   대하여 책임을 지지 않습니다. <br> 쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁  처리절차에 의거 분쟁이 처리됩니다.<br> Copyright © Coupang Corp. 2010-2021 All Rights Reserved.
              </p>
              <ul class="sns-link">
                  <li><a href="https://www.facebook.com/Coupang.korea" target="_blank" class="facebook" title="쿠팡 페이스북">쿠팡 페이스북</a></li>
                  <li><a href="https://news.coupang.com/" target="_blank" class="blog" title="쿠팡 뉴스룸">쿠팡 뉴스룸</a></li>
                  <li><a href="https://www.instagram.com/coupang" target="_blank" class="instagram" title="쿠팡 인스타그램">쿠팡 인스타그램</a></li>
              </ul>
          </div>
      </div> --%>
</footer>

</html>
<script>
$(".search").on("click", () => {
	$.removeCookie("open-panel", { path: "/" });
	$.removeCookie("open-panel2", { path: "/" });
	$.removeCookie("open-panel3", { path: "/" });
	});
$("#search_word").on("keydown", function (e) {
  if (e.key === "Enter") {
	  $.removeCookie("open-panel", { path: "/" });
	  $.removeCookie("open-panel2", { path: "/" });
	  $.removeCookie("open-panel3", { path: "/" });
  }
});

</script>