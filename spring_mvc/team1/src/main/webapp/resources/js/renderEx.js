$.ajax({
	url: "Items.do",
	success: function(res) {
		console.log(res);

		const list = res.itemList;
		let output = "";
		$.each(list, function(idx, item) {
			console.log(item);

			output += `
	        <li class="item" data-no="${item.no}">
	          <a href="${item.imgUrl}" data-caption="${item.title}">
	            <div class="imgBox">
	              <img src="${item.imgUrl}" alt="" />
	              <img src="${item.imgDetailUrl}" alt="" />
	            </div>	
	            <div class="info">
	              <h2>${item.rating}</h2>
	              <h2>${item.shipping}</h2>
	              <h2>${item.price}</h2>
	            </div>
	          </a>
	        </li>
	      `;

		});
		$("ul").html(output);
	}
});



