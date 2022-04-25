$(function() {
	let rating = $('#rating').attr('class');
	
	let star = $('#rating').html();
	//별 반은 0.4 ~ 0.6 
	if(rating > 0 && rating <= 1){
		$('.rating').html(star);
	} else if(rating > 1 && rating <= 2){
		$('.rating').html(star + '' + star);
	} else if(rating > 2 && rating <= 3){
		$('.rating').html(star + '' + star + '' + star);
	} else if(rating > 3 && rating <= 4){
		$('.rating').html(star + '' + star + '' + star + '' + star);
	} else if(rating > 4 && rating <= 5){
		$('.rating').html(star + '' + star + '' + star + '' + star + '' + star);
	}
	$('.prodPlus > .material-icons').click(function() {
		
		let cnt = Number.parseInt($('#cnt').val());
		$('#cnt').val(cnt+1);
		
		let price = $('.price > strong').attr('class').split(',');
		let priceEA = '';
		for (let split of price) {
  			priceEA += split;
		}
		//ea는 한개당 가격 // id는 총 구매 가격
		 
		$('.price > strong').attr('id', priceEA);
		
		let total = Number.parseInt($('.price > strong').attr('id'));
		
		console.log(total);
		$('.price > strong').attr('id', total+priceEA);
		/*
		$('.price > strong').attr('id', total+ea);

		$('.price > strong').html(total+'원');
		*/
	})
	
	$('.prodMinus > .material-icons').click(function() {
		let cnt =  Number.parseInt($('#cnt').val());
		if (cnt > 1) {
			$('#cnt').val(cnt-1);	
		}
	})
	
	
/*	$('#btns1').click(function(){
		$.fn.showFlex = function() {
      this.css('display','flex')
			}
			$('#CartTable').showFlex();
	  })*/
	  
	$('#CartClose').click(function() {
    $('#CartTable').css('display', 'none').fadeOut(1000);
  })

  $('#btns1').click(function() {
    $('#CartTable').css('display', 'flex').show().delay(1000).fadeOut(100);
  })

})