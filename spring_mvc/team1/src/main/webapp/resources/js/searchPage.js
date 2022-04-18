console.log("hellow");
console.log($("document"));
console.log($(".search"));

$(".search").on("click", () => {
  SearchEvent();
  let searchWord = document.querySelector("#search_word").value;
  document.getElementById('searchRStitle').innerHTML = `'${searchWord}'`+'에 대한 검색 결과';
});

$("#search_word").on("keydown", function (e) {
  if (e.key === "Enter") {
    let searchWord = document.querySelector("#search_word").value;
    document.getElementById('searchRStitle').innerHTML = `'${searchWord}'` +'에 대한 검색 결과';
    SearchEvent();
  }
});

function SearchEvent() {
  let searchSelect = document.querySelector("#search_select").value;
  let searchWord = document.querySelector("#search_word").value;
  $.ajax({
    url: "SearchProcess.do?search_select=" + searchSelect + "&search_word=" + searchWord + "",
    success: function (res) {
      const list = res.searchList;
      let output = "";
      `<h2>${searchWord}에 대한 검색 결과</h2>`
      $.each(list, (idx, item) => {
        console.log(item);
        
        if (item.shipping == null) item.shipping = "";
        if (item.rating == null) {
          //item.rating="0";
          output += `
		          <a href="../Detail.do?no=${item.no}" data-caption="${item.title}">
			        <li class="item" data-no="${item.no}">
			            <div class="imgBox">
			              <img src="${item.imgUrl}" alt="" />
			            </div>
			            <div class="info">
						  <p class="itemTitle">${item.title}</p>
			              <p class="itemShipping">${item.shipping}</p>
			              <p class="itemPrice">${item.price}원</p>
			              <div class="itemRating">
                        <div class="stars">
                          <div class="stars-back">
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                          </div>
                        </div>
                    </div>
			            </div>
			        </li>
		          </a>
		      `;
        } else {
          output += `
		          <a href="../Detail.do?no=${item.no}" data-caption="${item.title}">
			        <li class="item" data-no="${item.no}">
			            <div class="imgBox">
			              <img src="${item.imgUrl}" alt="" />
			            </div>
			            <div class="info">
										<p class="itemTitle">${item.title}</p>
										<p class="itemShipping">${item.shipping}</p>
										<p class="itemPrice">${item.price}원</p>
										<div class="itemRating">
												<div class="stars">
													<div class="stars-back">
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
                            <label for="rate1">⭐</label>
													</div>
													<div class="stars-real" style="width:calc(${item.rating}/5*100%);">
  													<label for="rate1">⭐</label>
  													<label for="rate1">⭐</label>
  													<label for="rate1">⭐</label>
  													<label for="rate1">⭐</label>
  													<label for="rate1">⭐</label>
													</div>
												</div>
										</div>
			            </div>
			        </li>
		          </a>
		      `;
        }
      });
      $(".searchResult").html(output);
    },
  });
}
