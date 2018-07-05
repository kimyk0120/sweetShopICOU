<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">

<head>
<title>이벤트 상세</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-title" content="">
<meta property="og:title" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:site_name" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:image" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:description" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta name="keywords" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Generator" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Author" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Keywords" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Description" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">


<link rel="stylesheet" href="/src/user/css/reset.css" type="text/css" />
<link rel="stylesheet" href="/src/user/css/contents.css" type="text/css" />
<link rel="stylesheet" href="/src/user/css/bbs.css" type="text/css" />


<!--<link rel="stylesheet" href="./src/css/import.css" type="text/css" />-->
<!--<script  src="./src/js/jquery-1.11.3.min.js"></script>-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/src/user/js/jquery.touchSwipe.min.js"></script>
<!-- jquery UI -->
<link rel="stylesheet" href="/src/user/css/jquery-ui.min.css" type="text/css" />
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>



<script  src="/src/user/js/default.js"></script>

<!-- 좌우 스크롤 슬라이드 스와이프 //-->
<link rel="stylesheet" href="/src/user/css/swiper.min.css">

<!-- 디바이스에 따라 슬라이드 미적용 되어 제거 함 
			<link rel='stylesheet' href='./src/css/unlock.css'>
			<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'></script>
			<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js'></script>
			<script src='./src/js/slidetounlock.js'></script>
//-->


<script>

		var IMG_WIDTH = 70;
			var drag_area = 0;
			var currentImg = 0;
			var maxImages = 1;
			var speed = 400;				
			var swipe_w;
			var cutLine;
			var tapCount=0;
		$(function() { 
		
		
		
		var TOUCHSTART;	
		if( typeof(window.ontouchstart) != 'undefined' ){
			TOUCHSTART = 'touchstart';
		}else{
			TOUCHSTART = 'click';
		}
		
		swipe_w = $(".btn_cutting");
		cutLine = $("#btn_trigger");
		

		drag_area = swipe_w.width() - IMG_WIDTH;			
		
		cutLine.swipe({
			triggerOnTouchEnd: true,
			swipeStatus: swipeStatus,			
			threshold: drag_area * 0.5,
			tap:function(event, target){
				console.log(target, tapCount++)
			}
		});
		

		$('#overlay_t, .close').on( TOUCHSTART, function(e){
			
			$("body").off('touchmove');
			$('#popup_layer_insert, #overlay_t').hide(); 
			//location.reload();
			speed = 400;	
			scrollImages(0, speed);				
			e.preventDefault(); 				
		});
		
		$(window).on("orientationchange",function(){
			setTimeout(function(){
				drag_area = swipe_w.width() - IMG_WIDTH;	
				cutLine.swipe({
					threshold: drag_area * 0.5
				});
			}, 500);				
		}); 	
		
		//팝업 포지션
		setTimeout( function(){
			var pop_posY = ( $(window).height() - 270 ) / 2;
			var pop_posX = ( $(window).width() - 284 ) / 2;
			$(".pop_cont").css({"margin-top":pop_posY + "px", "margin-left":pop_posX + "px"});
		}, 300);	
		
		
		
		// 좋아요 버튼 클릭시 
		$("div.favorite").on("click",function(){
			var chgDiv = $(this).find("img");	
			var targetElmt = $(this).find("img");
			var favoriteYN = $(this).find("img").attr("name");
			var shopSeq = $(this).next().val();
			
			if(favoriteYN=="Y"){
				$.ajax({
					  method: "POST",
					  url: "/user/common/delFavorite.do",
					  data: { "shopSeq": shopSeq}
				}).done(function(msg){
					$(chgDiv).toggle("puff",250,function(){
						$(chgDiv).attr("src","/src/user/images/common/icon_favorite_off.png").show();	
					});
					$(targetElmt).prop("name","N");									  
				});			
			};
			
			if(favoriteYN=="N"){
				$.ajax({
					  method: "POST",
					  url: "/user/common/addFavorite.do",
					  data: { "shopSeq": shopSeq}
				}).done(function(msg){
					$(chgDiv).toggle("puff",300,function(){
						$(chgDiv).attr("src","/src/user/images/common/icon_favorite_on.png").show();	
					});
					$(targetElmt).attr("name","Y");				
				});			
			};
		});
		
		
	});
	
	function swipeStatus(event, phase, direction, distance) {            
		
		if (phase == "move" && (direction == "left" || direction == "right")) {			
			
			var duration = 0;
			
			if (direction == "left") {			
				scrollImages(distance, duration);
			} else if (direction == "right") {
				
					scrollImages(-distance, duration);
				
			}

			} else if (phase == "cancel") {
				scrollImages(0, speed);					
			} else if (phase == "end") {				
				var per = distance * 100 / drag_area;
				if( per > 50 ){
					speed = 100;	
				}
				scrollImages(-( drag_area ), speed);
			 
				setTimeout(function(){
					showPopLayer();
				}, speed);
		}
	}		
		
		function scrollImages(distance, duration) {
			cutLine.css("transition-duration", (duration / 1000).toFixed(1) + "s");			
			var value = (distance < 0 ? "" : "-") + Math.abs(distance).toString();
			
				cutLine.css("transform", "translate(" + value + "px,0)");
			
		}
		
		function showPopLayer(){
			$('#popup_layer_insert, #overlay_t').show(); 
			$("body").on('touchmove', function(e){e.preventDefault()});
		}	
	

	/*
	 $('.trigger').click(function(){ 
	   $('#popup_layer_insert, #overlay_t').show(); 
		var $layerPopupObj = $('#popup_layer_insert');
		var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
		var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
		$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
	}); 
    $('#overlay_t, .close').click(function(e){ 
        e.preventDefault(); 
        $('#popup_layer_insert, #overlay_t').	hide(); 
		//location.reload();
    }); 
	*/


/****/
function popup_open()
{
   $('#popup_layer_insert, #overlay_t').show(); 
	var $layerPopupObj = $('#popup_layer_insert');
	var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
	var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
	$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
}

	
/* function couponUseOk(e){
	var btnOkElmt = $(this);
	var userSeq = $("#userSeq").val();
	var eventSeq = $("#eventSeq").val();
	
	$.ajax({
		  method: "POST",
		  url: "/user/eventUseOk.do",
		  data: { "userSeq":userSeq,"eventSeq":eventSeq }
	}).done(function(e){
		$(location).attr('href', '/user/eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}');
	});
	
}	 */
	
$(function(){
	$(".btn_pop_yes").one("click",function(){
		
		var btnOkElmt = $(this);
		var userSeq = $("#userSeq").val();
		var eventSeq = $("#eventSeq").val();
		
		$.ajax({
			  method: "POST",
			  url: "/user/eventUseOk.do",
			  data: { "userSeq":userSeq,"eventSeq":eventSeq }
		}).done(function(e){
			$(location).attr('href', '/user/eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}');
		});
	})
})	

</script>

<style type="text/css">
	div.favorite{
		cursor: pointer;
	}
</style>
</head>

<body >


<div id="overlay_t" class="popup"></div> 
<div id="popup_layer_insert" class="popup">
		
		<div class="pop_cont" style="position:fixed;">
            <div class="bg_insert_circle">
                <div class="insert_circle2">
                    <img src="/src/user/images/common/btn_cut.png" style="width:30px; height:auto;" />
                    <p class="dot"></p>
                    <p class="guide">이 버튼은 매장 직원이<br />누르는 버튼입니다.</p>
                    <p class="s_text">쿠폰을 사용<br />하시겠어요?</p>	
                </div>		
            </div>
            <div class="pop_btn_wrap mt30">
                <p class="btn_pop_no"><a href="#" class="close">아니요</a></p>
                <p class="btn_pop_yes"><a href="#">사용할래요</a></p>
                <input type="hidden" value="${userSeq}" id="userSeq">
				<input type="hidden" value="${pl.eventSeq}" id="eventSeq">
            </div>
		</div>
</div><!--END popup_layer_insert//-->
<a href="#" class="trigger"></a>

<div id="wrap_wide" >
	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();"  class="menu-btn"><img src="/src/user/images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>예다손</li>
			<li><a href="#" class="menu-btn"><img src="/src/user/images/common/btn_logout.png" style="width:18px; height:auto; margin-right:5px;" /></a></li>
		</ul>
	</header> -->



	<section class="sub_content_wrap">
	
	<!-- 섹션 시작 //-->
	<div class="shop_detail">
		<c:choose>
			<c:when test="${pl.shop_kind eq '000'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_beauty.png" />
				<c:set var="shopKind" value="미용/스파" />
			</c:when>
			<c:when test="${pl.shop_kind eq '001'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_hair.png" />
				<c:set var="shopKind" value="헤어/메이크업" />
			</c:when>
			<c:when test="${pl.shop_kind eq '002'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_realty.png" />
				<c:set var="shopKind" value="부동산" />
			</c:when>
			<c:when test="${pl.shop_kind eq '003'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_bakery.png" />
				<c:set var="shopKind" value="빵집" />
			</c:when>
			<c:when test="${pl.shop_kind eq '004'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_stay.png" />
				<c:set var="shopKind" value="숙박" />
			</c:when>
			<c:when test="${pl.shop_kind eq '005'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_super.png" />
				<c:set var="shopKind" value="슈퍼/마트" />
			</c:when>
			<c:when test="${pl.shop_kind eq '006'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_pharmacy.png" />
				<c:set var="shopKind" value="약국" />
			</c:when>
			<c:when test="${pl.shop_kind eq '007'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_food.png" />
				<c:set var="shopKind" value="음식점" />
			</c:when>
			<c:when test="${pl.shop_kind eq '008'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_cafe.png" />
				<c:set var="shopKind" value="카페" />
			</c:when>
			<c:when test="${pl.shop_kind eq '009'}">
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_interier.png" />
				<c:set var="shopKind" value="인테리어" />
			</c:when>
			<c:when test="${pl.shop_kind eq '010'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_clean.png" />
				<c:set var="shopKind" value="청소" />
			</c:when>
			<c:when test="${pl.shop_kind eq '011'}"> 
				<c:set var="shopKindImg" value="/src/user/images/common/ribbon_sports.png" />
				<c:set var="shopKind" value="스포츠" />
			</c:when>
		 </c:choose>
		
		<div class="ribbon"><img src="${shopKindImg}" /></div>
		<c:choose>
			<c:when test="${pl.favoriteYN == 'Y' }">
				<div class="favorite"><img src="/src/user/images/common/icon_favorite_on.png" name="Y" /></div>
			</c:when>
			<c:otherwise>
				<div class="favorite"><img src="/src/user/images/common/icon_favorite_off.png" name="N" /></div>
			</c:otherwise>
		</c:choose>
		<input type="hidden" value="${pl.shopSeq}" id="shopSeq">
		
		<ul class="cont">
			<li class="title"><a href="#" class="color_cafe"><p class="notcolor">${shopKind}ㆍ${pl.shop_sido} ${pl.shop_gu}</p>${pl.shop_name}</a></li>
			<li class="photo"><a href="#"><img src="${pl.img_path}" /></a></li>
			<li class="memo">${pl.shop_intro}</li>
			<li class="infomation">
				<ul>
					<li>
					<c:if test="${pl.favoriteCnt >= 10}">
						<img src="/src/user/images/common/icon_list_hot.png" />
					</c:if>
					<c:if test="${pl.dateDiff <= 7}">
						<img src="/src/user/images/common/icon_list_new.png" />
					</c:if>
					<c:choose>
						<c:when test="${pl.eventDiscountWay == 'P' }">
							<img src="/src/user/images/common/icon_list_dc.png" />
						</c:when>
						<c:otherwise>
							<img src="/src/user/images/common/icon_list_coupon.png" />
						</c:otherwise>						
					</c:choose>
					</li>
					<li>
					<p>
					<c:set var="value" value="${pl.reviewAvgFloor}" />
					<c:choose>
						<c:when test="${value == 0 }">
							<span>별점 없음</span>
						</c:when>
						<c:otherwise>
							<img src="/src/user/images/common/star_gray_min_${value}.png" />
						</c:otherwise>								
					</c:choose>
					</p>
					<c:choose>
						<c:when test="${pl.distanceMeter<1000}">
							${pl.distanceMeter}m
						</c:when>
						<c:otherwise>
							${pl.distanceKmeter}km 
						</c:otherwise>								
					</c:choose>
					</li>
				</ul>			
			</li>
		</ul>

		<div class="dot_garo">
			<!-- 컷팅 서클 버튼 //-->

			<div class="btn_cutting">
				<!-- 미사용
				<div id="well">
					<h2 ><strong id="slider"></strong></h2>					
				</div>
				//-->
                
				<div id="btn_trigger"><a href="#"  class="trigger"><img src="/src/user/images/common/btn_cutting.png" alt="" style="width:70px; height:auto; " /></a></div>
			</div>
				
		</div>
		
        
        
		<div class="evcoupon_text">
			<ul>
				<li>${pl.eventStartDay} ~ ${pl.eventEndDay}</li>
				<li>${pl.eventTitle }</li>
				<li  class="color_cafe">${pl.eventDiscountTarget}<p>${pl.eventDiscount}</p></li>
				<li>
					<div class="evcoupon_btn_wrap">
						<p class="btn_where"><a href="eventWhere.do?userSeq=${userSeq}&userLat=${userLat}&userLong=${userLong}&eventSeq=${pl.eventSeq}">어디야</a></p>
						<p class="btn_where_not"><a href="#"><img src="/src/user/images/common/icon_list_coupon.png" alt="" style="width:25px; height:auto; margin-bottom:3px;" /></a></p>
					</div>
				</li>
			</ul>
		</div>
	</div><!-- 섹션 끝 //-->

	<dl class="evcoupon_guide">
		<dt>본 쿠폰은 ${pl.shop_name}에서만 사용이 가능한 쿠폰입니다.</dt>
		<dd>
			${pl.eventDetailDesc}
		</dd>
	</dl>

</section>

</div><!-- END wrap//-->
</body>
</html>