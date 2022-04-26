console.log("hellow");
console.log($("document"));
console.log($(".search"));
const RStitle = document.getElementById("searchRStitle");
let searchWord = document.querySelector("#search_word").value;
if (searchWord != null) {
  SearchEvent();
}

$(".search").on("click", () => {
  SearchEvent();
});

$("#search_word").on("keydown", function (e) {
  if (e.key === "Enter") {
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

      $.each(list, (idx, item) => {
        //console.log(item);

        if (item.shipping == null) item.shipping = "";
        if (item.rating == null) {
          //item.rating="0";
          RStitle.innerHTML = `'${searchWord}'` + "에 대한 검색 결과";
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
          RStitle.innerHTML = `'${searchWord}'` + "에 대한 검색 결과";
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

// var acc = document.getElementsByClassName("accordion");
// var i;

/*$(".search_category_title").click(function (e) {
  var el = $(e.target).closest("li");
  el.siblings("li").removeClass("selected");
  el.addClass("selected");
});*/

function FTon() {
  $(".more").addClass("on").removeClass("off");
  $(".less").addClass("off").removeClass("on");
}
function FToff() {
  $(".more").addClass("off").removeClass("on");
  $(".less").addClass("on").removeClass("off");
}
function FTon2() {
  $(".more2").addClass("on").removeClass("off");
  $(".less2").addClass("off").removeClass("on");
}
function FToff2() {
  $(".more2").addClass("off").removeClass("on");
  $(".less2").addClass("on").removeClass("off");
}
function FTon3() {
  $(".more3").addClass("on").removeClass("off");
  $(".less3").addClass("off").removeClass("on");
}
function FToff3() {
  $(".more3").addClass("off").removeClass("on");
  $(".less3").addClass("on").removeClass("off");
}

// 시간없어서 걍 노가다로 작성함, 프로젝트 끝나고 천천히 수정해볼 예정
$(function () {
  if ($.cookie("open-panel")) {
    $(".panel").show();
    FTon();
  } else {
    FToff();
  }
  $(".accordion").on("click", function () {
    if ($.cookie("open-panel")) {
      FTon();
      $.removeCookie("open-panel", { path: "/" });
    } else {
      FToff();
      $.cookie("open-panel", "open", { expires: 1, path: "/" });
    }
    location.reload();
    return false;
  });
});

$(function () {
  if ($.cookie("open-panel2")) {
    $(".panel2").show();
    FTon2();
  } else {
    FToff2();
  }
  $(".accordion2").on("click", function () {
    if ($.cookie("open-panel2")) {
      FTon2();
      $.removeCookie("open-panel2", { path: "/" });
    } else {
      FToff2();
      $.cookie("open-panel2", "open", { expires: 1, path: "/" });
    }
    location.reload();
    return false;
  });
});

$(function () {
  if ($.cookie("open-panel3")) {
    $(".panel3").show();
    FTon3();
  } else {
    FToff3();
  }
  $(".accordion3").on("click", function () {
    if ($.cookie("open-panel3")) {
      FTon3();
      $.removeCookie("open-panel3", { path: "/" });
    } else {
      FToff3();
      $.cookie("open-panel3", "open", { expires: 1, path: "/" });
    }
    location.reload();
    return false;
  });
});

/*
$(function () {
  if ($.cookie("open-panel2")) {
    $(".panel2").show();
    FTon();
  } else {
    FToff();
  }

  $(".accordion2").on("click", function () {
    if ($.cookie("open-panel2")) {
      $(".panel2").slideDown();
      FTon();
      $.removeCookie("open-panel2", { path: "/" });
      location.reload();
    } else {
      $(".panel2").slideUp();
      FToff();
      $.cookie("open-panel2", "open", { expires: 1, path: "/" });
      location.reload();
    }
    return false;
  });
});

$(function () {
  if ($.cookie("open-panel3")) {
    $(".panel3").show();
    FTon();
  } else {
    FToff();
  }

  $(".accordion3").on("click", function () {
    if ($.cookie("open-panel3")) {
      $(".panel3").slideDown();
      FTon();
      $.removeCookie("open-panel3", { path: "/" });
      location.reload();
    } else {
      $(".panel3").slideUp();
      FToff();
      $.cookie("open-panel3", "open", { expires: 1, path: "/" });
      location.reload();
    }
    return false;
  });
});
*/
$(".logo a").on("click", function () {
  $.removeCookie("open-panel", { path: "/" });
  $.removeCookie("open-panel2", { path: "/" });
  $.removeCookie("open-panel3", { path: "/" });
});

window.onpageshow = function (event) {
  if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    $.removeCookie("open-panel", { path: "/" });
    $.removeCookie("open-panel2", { path: "/" });
    $.removeCookie("open-panel3", { path: "/" });
    location.reload();
  }
};
