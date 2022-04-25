var tmpId = '';

// 체크박스 컨트롤
// console.log(document.getElementsByName("chkItem"));

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
		showTable += '<th scope="col" class="all-select-event" colspan="2">';
		showTable += '<label><input title="모든 상품을 결제상품으로 설정" type="checkbox" checked="checked" class="all-deal-select" onClick="selectAll(this);"> 전체선택';
		
		showTable += '</label>';
		showTable += '</th>';
		showTable += '<th scope="colgroup" id="th-product-box">상품정보</th><th scope="col" id="th-unit-total-price">상품금액</th><th scope="col" id="th-delivery-fee">배송비</th></tr>';
		// 갯수 설정
		const endCnt = 100;
		// 상품 총가격
		let orderTotal = 0;
		let shippingTotal = 0;
		let checkout = 0;
		
		showTable += "<tbody>";
		showTable += '<tr>';
//		showTable += '<td colspan="5" class="cart-bundle-title">';
//		showTable += '<span class="title rocket">로켓배송 상품 </span>';
//		showTable += '<span class="rocket-delivery-info">';
//		showTable += '<span class="rocket-free">무료배송</span>';
//		showTable += '(19,800원 이상 구매가능)</span>';
		showTable += '<div id="lateRocketWowOverNightMessage" class="late-dawn-delivery-message" style="display: none">';
		showTable += '</div>';
		showTable += '</td>';
		showTable += '</tr>';
		

		tmpId = res.cartList[0].userId;
		for (let i=0; i<res.cartList.length; i++) {
			const vo = res.cartList[i];
			const index = i+1;
			const total = (vo.itemAmount * vo.price);
			
			orderTotal += total;
			// 사진ID,  수량(select), 합계금액, 닫기 총 금액 , 배송비
			// vo.itemAmount 수량
			// vo.itemNo 아이템 고유키
			// vo.modDt 수정일
			// vo.price  가격
			// vo.regDt 등록일
			const isFreeShip = total > 18999 ? "무료" : "2,500원";
			if (total < 19000) {
				shippingTotal += 2500;
			}
			showTable += '<tr class="cart-deal-item " data-item-status="CHECKED" data-adult="false" data-bundle-id="' + index + '" data-bundle-type="PRODUCT" data-app="" data-group-type="rocket" id="row' + index + '">'; 
			showTable += '<td><input type="checkbox" checked="checked" class="dealSelectChk" name="chkItem" id="cartNo' + index + '" value="' + vo.itemNo + '" onClick="selectedList();"></td>'; // 체크박스 
			showTable += '<td class="cart-deal-item__image "><img src="' + vo.imgUrl + '" width="78" height="78" class="product-img img" alt="' + vo.title + '">' + "</td>"; // 이미지
			showTable += '<td class="product-box"><div class="product-name-part">' + vo.title + "</div>"; // 상품명
			//showTable += '<td id="total' + index + '">' + vo.price + "</td>"; // 상품가격
			showTable += '<td><span class="select-select">' + vo.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원' + renderSelectbox(endCnt, vo.itemAmount, index, vo.price, vo.userId, vo.itemNo) + '</span>';  // 수량
			showTable += '<span class="unit-price-area"><span class="unit-price" id="total' + index + '">' + total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '원</span></span>'; // 상품합계
			showTable += '<span class="delete-option" onClick="valueDelete(' + vo.itemNo + ');alert(\'삭제되었습니다\');location.reload();"></span>' //개별삭제 버튼
			showTable += '</td>'
			showTable += '<td class="delivery-fee" rowspan="1" headers="th-delivery-fee"><span class="delivery-fee__free">' + isFreeShip + "</span></td>"; // 배송비
			
			//file:///C:\Users\생략\이력서.jpg
			showTable += "</tr>"; 
		}
		
		checkout = orderTotal + shippingTotal;
		
		
		showTable += "</tbody></table>";
		
		cartTotalInfo  = '<div class="cart-total-price" data-total-price="40120" data-discount-price="0">';
		cartTotalInfo +=     '<div class="cart-total-price__inner">';
		cartTotalInfo +=         '<div class="price-area">';
		cartTotalInfo +=             '<h2 class="sr-only" id="cart-total-price">';
		cartTotalInfo +=                 '장바구니 총 주문금액 정보';
		cartTotalInfo +=             '</h2>';
		cartTotalInfo +=             '전체 구매시 총 상품가격';
		cartTotalInfo +=             '<em class="final-product-price">' + orderTotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '</em>원';
		cartTotalInfo +=             '<span class="final-sale-area"></span>';
		cartTotalInfo +=             '<span class="symbol-plus1"><span class="sr-only">더하기</span></span>';
		cartTotalInfo +=             '총 배송비';
		cartTotalInfo +=             '<em class="final-delivery-charge">' + shippingTotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '</em>원';
		cartTotalInfo +=             '<span class="symbol-equal1"><span class="sr-only">결과는</span></span>';
		cartTotalInfo +=             '총 주문금액';
		cartTotalInfo +=             '<em class="final-order-price" data-final-order-price="' + checkout + '">' + checkout.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '<span class="price-suffix">원</span></em>';
		cartTotalInfo +=         '</div>';
		cartTotalInfo +=     '</div>';
		cartTotalInfo += '</div>';
		
		
		orderBtns  = '<div class="order-buttons">';
		orderBtns += '    <a id="continueShoopingBtn" class="goShopping logging" href="/team1" data-view-type="shoppingCart" data-event-name="continuouslyShoppingClick" data-log-label="cart-p-continuouslyShoppingClick" data-coulog-type="clickEvent" data-listener-event-type="click">계속 쇼핑하기</a>';
		orderBtns += '    <a href="/team1/member/OrderPage.do" class="goPayment narrow" id="btnPay" data-pay-url="/team1/member/OrderPage.do?isAllChecked=true">구매하기</a>';
		orderBtns += '    <div class="item-disabled" style="display: none;"></div>';
		orderBtns += '</div>';
		
		
		$("table").html(showTable);
		$('#cartTotalInfo').html(cartTotalInfo);
		$('#orderBtns').html(orderBtns);
		
		

	}
});


var checkedArr = [];
var unCheckedArr = [];

function selectedList() {
	checkedArr = [];
	unCheckedArr = [];
	const chkboxList = document.getElementsByName('chkItem');
	for (let i=0; i<chkboxList.length; i++) {
		console.log(chkboxList[i]);
		if(chkboxList[i].checked == true) {
			checkedArr.push(chkboxList[i].value);
		} else {
			unCheckedArr.push(chkboxList[i].value);
			if(confirm('삭제하시겠습니까?')) {
				valueDelete(chkboxList[i].value)
			} else {
				chkboxList[i].checked == true
			}
		}
		
	}
	location.reload();
	
}
function selectAll(val) {
	const isChecked = val.checked;
	const chkboxList = document.getElementsByName('chkItem');
	for (let i=0; i<chkboxList.length; i++) {
		const id = chkboxList[i].id;
		document.getElementById(id).checked = isChecked;
	}
	selectedList();
}

function valueChange(index, value, price, userId, itemNo) {
	let param = {userId: userId, itemNo: itemNo, itemAmount: value};
	$.ajax({
		url: "updateCartItem.do",
		data: param,
		contentType: 'application/json; charset=utf-8',

		success : function(resp) {
			if (resp) {
				location.reload();
			} else {
				location.reload();
			}
        },
        error : function(resp) {
				console.log(resp);
				location.reload();
        }
	});
}


// 1건 삭제
function valueDelete(itemNo) {
		let param = {userId: tmpId, itemNo: itemNo};
		$.ajax({
			url: "deleteCartItem.do",
			data: param,
			contentType: 'application/json; charset=utf-8',
			
			success : function(resp) {
				console.log(itemNo + '삭제결과', resp);
				return true;
	        },
	        error : function(resp) {
				console.log(delItem + ' item Error', resp);
				return false;
	        }
		});
}


// 전체삭제
 function valueDeleteAll() {
	for (let i=0; i<unCheckedArr.length; i++) {
		const delItem = unCheckedArr[i];
		valueDelete(delItem);
	}
	location.reload();
}


function renderSelectbox(endCnt, amount, index, price, userId, itemNo) {
	let sBox = '<select class="quantity-select" name="itemAmount" id="amount' + index + '" onChange="valueChange(\'' + index + '\', this.value, ' +  price + ', \'' + userId + '\', ' + itemNo + ')">';
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

