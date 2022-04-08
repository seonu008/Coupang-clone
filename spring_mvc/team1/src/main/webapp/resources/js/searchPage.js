console.log('hellow');
console.log($('document'));
console.log($('.search'));

$('.search').on('click',()=>{
	console.log('clicked');
	SearchEvent();
});

$('#search_word').on('keydown', function (e) {
    if (e.key === 'Enter') {
      console.log('entered');
	SearchEvent();
    }
});
function SearchEvent() {
	let searchSelect = document.querySelector('#search_select').value;
	let searchWord = document.querySelector('#search_word').value;
	$.ajax({
		url: "SearchProcess.do?search_select="+searchSelect+"&search_word="+searchWord+"",
		success: function(res) {
			const list = res.searchList;
			let output = "";
			$.each(list, (idx, item)=> {
				console.log(item);
			if (item.shipping == null)item.shipping="";
			if (item.rating == null){
				//item.rating="0";
				output += `
		          <a href="" data-caption="${item.title}">
			        <li class="item" data-no="${item.no}">
			            <div class="imgBox">
			              <img src="${item.imgUrl}" alt="" />
			            </div>
			            <div class="info">
						  <p class="itemTitle">${item.title}</h2>
			              <p class="itemShipping">${item.shipping}</h2>
			              <p class="itemPrice">${item.price}원</h2>
			            </div>
			        </li>
		          </a>
		      `;
			} else {
				output += `
		          <a href="" data-caption="${item.title}">
			        <li class="item" data-no="${item.no}">
			            <div class="imgBox">
			              <img src="${item.imgUrl}" alt="" />
			            </div>
			            <div class="info">
						  <p class="itemTitle">${item.title}</h2>
			              <p class="itemRating">${item.rating}%</h2>
			              <p class="itemShipping">${item.shipping}</h2>
			              <p class="itemPrice">${item.price}원</h2>
			            </div>
			        </li>
		          </a>
		      `;
			}
			});
			$(".searchResult").html(output);
		}
	});
}