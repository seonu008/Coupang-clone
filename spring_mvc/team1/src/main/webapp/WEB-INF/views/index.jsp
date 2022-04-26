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
<%@ include file="include/footer.jsp"%>
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