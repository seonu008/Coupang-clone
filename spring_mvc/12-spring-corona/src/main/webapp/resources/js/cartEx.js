$.ajax({
	url: "cartItems.do",
	success: function(res) {
		let showTable = '<table class="cartTable">';
		showTable += '<caption class="none">장바구니</caption>';
		showTable += '<colgroup>';
		showTable += '<col width="50">';
		showTable += '<col width="80">';
		showTable += '<col width="*">';
		showTable += '<col width="90">';
		showTable += '<col width="90">';
		showTable += '</colgroup>';
		showTable += '<thead>';
		showTable += '<tr class="head">';
		showTable += '<th scope="col" class="all-select-event">';
		showTable += '<label><input title="모든 상품을 결제상품으로 설정" type="checkbox" checked="checked" class="all-deal-select">';
		showTable += '<span>ㅇㅇ</span>';
		showTable += '</label>';
		showTable += '</th>';
		showTable += '<th scope="colgroup" id="th-product-box" colspan="2">상품정보</th><th scope="col" id="th-unit-total-price">상품금액</th><th scope="col" id="th-delivery-fee">배송비</th></tr>';
		// 갯수 설정
		const endCnt = 100;
		
		showTable += "<tbody>";
		showTable += '<tr>';
		showTable += '<td colspan="5" class="cart-bundle-title">';
		showTable += '<span class="title rocket">로켓배송 상품 </span>';
		showTable += '<span class="rocket-delivery-info">';
		showTable += '<span class="rocket-free">무료배송</span>';
		showTable += '(19,800원 이상 구매가능)</span>';
		showTable += '<div id="lateRocketWowOverNightMessage" class="late-dawn-delivery-message" style="display: none">';
		showTable += '</div>';
		showTable += '</td>';
		showTable += '</tr>';
		


		for (let i=0; i<res.cartList.length; i++) {
			const vo = res.cartList[i];
			const index = i+1;
			const total = (vo.itemAmount * vo.price);
			// 사진ID,  수량(select), 합계끔액, 닫기 총 금액 , 배송비
			// vo.itemAmount 수량
			// vo.itemNo 아이템 고유키
			// vo.modDt 수정일
			// vo.price  가격
			// vo.regDt 등록일
			const isFreeShip = total > 18999 ? "무료" : "2,500원";
			showTable += '<tr class="cart-deal-item " data-item-status="CHECKED" data-adult="false" data-bundle-id="' + index + '" data-bundle-type="PRODUCT" data-app="" data-group-type="rocket" id="row' + index + '">'; 
			showTable += '<td><input type="checkbox" checked="checked" class="dealSelectChk" name="cartIndex" id="cartNo' + index + '" value="' + index + '"></td>'; // 체크박스 
			showTable += '<td class="cart-deal-item__image "><img src="' + vo.imgUrl + '" width="78" height="78" class="product-img img" alt="' + vo.title + '">' + "</td>"; // 이미지
			showTable += '<td class="product-box"><div class="product-name-part">' + vo.title + "</div>"; // 상품명
			//showTable += '<td id="total' + index + '">' + vo.price + "</td>"; // 삼품가격
			showTable += '<td><span class="select-select">' + vo.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원' + renderSelectbox(endCnt, vo.itemAmount, index, vo.price) + '</span>';  // 수량
			showTable += '<span class="unit-price-area"><span class="unit-price"><span class="sr-only">구매가격</span>' + total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원</span></span>'; // 상품합계
			showTable += '</td>'
			showTable += '<td class="delivery-fee" rowspan="1" headers="th-delivery-fee"><span class="delivery-fee__free">' + isFreeShip + "</span></td>"; // 배송비
			
			//file:///C:\Users\생략\이력서.jpg
			showTable += "</tr>"; 
		}
		showTable += "</tbody></table>";
		$("table").html(showTable);
	}
});



function valueChange(rowId ,value) {
	console.log(rowId);
	console.log(value);
	const rowItems = document.getElementById(rowId);
	console.log(rowItems);
}

function renderSelectbox(endCnt, amount, index, price) {
	let sBox = '<select class="quantity-select" name="itemAmount" id="amount' + index + '" onchange="valueChange(\'row' + index + '\', this.value)">';
	for(let i=0; i<endCnt-1; i++) {
		sBox += '<option value="' + (i+1) + '"';
		if((i+1) == amount) {
			sBox += 'selected="selected"';
		} 
		sBox += ">" + (i+1) + "</option>";
	}
	sBox += "</select>";
	return sBox;
}