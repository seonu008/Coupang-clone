

$.ajax({
	url: "OrderPage.do",
	success: function(data) {
		let arr = data.itemList; 
		
		let title = $(document).attr('title') ;
		let key = arr.find((item) => {
				return item.no == title;
		});
		console.log(key);
		let output = "";
			output += `
            	<div class="bundleTitle">제품이름${key.title}</div>
              	<div class="bundleShipping">무료배송${key.shipping}</div>
	        `;

		$(".bundleItemList").html(output);
	}
});