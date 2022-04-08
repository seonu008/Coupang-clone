$.ajax({
	url: "Items.do",
	dataType: "json",
	success: function(data) {
		// data = object
		//let json = $.parseJSON(data)

		
		let arr = data.itemList; //array in object
		
		let title = $(document).attr('title') ;
		let key = arr.find((item) => {
				return item.no == title;
		});
		
		
		console.log(key);
		let output = "";
			output += `
			<ul id="gnb">
				<li class="prodBuy" data-no="${key.no}">
		          
		            <div class="imgBox">
		              <img src="${key.imgUrl}" alt="" />
		            </div>
		            <div class="info">
		            	<h2>${key.title}</h2>
		              <div><span class="rating">평점:${key.rating}</span></div>
		              <div><span class="shipping">배송여부:${key.shipping}</span></div>
		              <div><span class="price">${key.price}원</span></div>
		            </div>
		          
		        </li>
	        </ul>
	        <div><img src="${key.imgDetailUrl}" alt="" /></div>
	        `;

		$("body").html(output);
	}
});