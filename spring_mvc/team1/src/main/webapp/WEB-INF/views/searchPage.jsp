<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<main>
	<div id="searchWrap">
		<div class="searchContentsBox">
			<div class="search_filter">
				<div class="search_filter_content">
					<h4>필터</h4>
					<div class="search_filter_category">
						<h5>카테고리</h5>
						<div class="search_category_component">
							<ul class="search_filter_items">
								<li class="search_filter_item">
									<h5><a href="">전체</a></h5>
								</li>
								<li class="search_filter_item">
									<h5><a href="">식품</a></h5>
									<ul class="search_category_box">
										<li class="search_category_title">
											<a href="">장/소스/드레싱/식초</a>
										</li>
										<li class="search_category_title">
											<a href="">건강식품</a>
										</li>
										<li class="search_category_title">
											<a href="">생수/음료</a>
										</li>
										<li class="search_category_title">
											<a href="">반찬/간편식/대용식</a>
										</li>
										<li class="search_category_title">
											<a href="">과자/초콜릿/시리얼</a>
										</li>
										<li class="search_category_title">
											<a href="">냉장/냉동/간편요리</a>
										</li>
										<li class="search_category_title">
											<a href="">커피/원두/차</a>
										</li>
										<li class="search_category_title">
											<a href="">견과/건과</a>
										</li>
										<li class="search_category_title">
											<a href="">과일</a>
										</li>
										<li class="search_category_title">
											<a href="">쌀/잡곡</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="searchProduct">
				<h2 id="searchRStitle"></h2>
				<ul class="searchResult"></ul>
			</div>
		</div>
	</div>
	<footer></footer>
</main>
</html>
