function popupwindow(url, title, w, h) {
    var left = (screen.width/2)-(w/2);
    var top = (screen.height/2)-(h/2);
    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}

$(document).ready(function(){
	$(".gnb").mouseover(function(){
		$(".menuDrop").slideDown();
	})

	$(".menuDrop").mouseleave(function(){
		$(".menuDrop").stop().slideUp();
	})
	
})

$(document).ready(function(){
	$(".gnbCompany").mouseover(function(){
		$(".drop").css('display','none');
		$(".companyDrop").css('display','block');
	})

	$(".companyDrop").mouseleave(function(){
		$(".companyDrop").css('display','none');
	})
	
	
	$(".gnbBusiness").mouseover(function(){
		$(".drop").css('display','none');
		$(".businessDrop").css('display','block');
	})

	$(".businessDrop").mouseleave(function(){
		$(".businessDrop").css('display','none');
	})
	
	
	
	$(".gnbBrand").mouseover(function(){
		$(".drop").css('display','none');
		$(".brandDrop").css('display','block');
	})

	$(".brandDrop").mouseleave(function(){
		$(".brandDrop").css('display','none');
	})
	
	
	
	
	$(".gnbPromote").mouseover(function(){
		$(".drop").css('display','none');
		$(".promoteDrop").css('display','block');
	})

	$(".promoteDrop").mouseleave(function(){
		$(".promoteDrop").css('display','none');
	})
	
	
	
	$(".gnbCommunity").mouseover(function(){
		$(".drop").css('display','none');
		$(".communityDrop").css('display','block');
	})

	$(".communityDrop").mouseleave(function(){
		$(".communityDrop").css('display','none');
	})
	
})