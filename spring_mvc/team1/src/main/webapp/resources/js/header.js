console.log("header open");

$(".to_search").on("click", () => {
  let searchWord = document.querySelector(".to_search_word").value;
  console.log(`redirect to : ${searchWord}`);
  window.location.href = `/team1/item/SearchPage.do?query=${searchWord}`;
});

$(".to_search_word").on("keydown", function (e) {
  if (e.key === "Enter") {
	
    let searchWord = document.querySelector(".to_search_word").value;
    console.log(`redirect to : ${searchWord}`);
    window.location.href = `/team1/item/SearchPage.do?query=${searchWord}`;
  }
});