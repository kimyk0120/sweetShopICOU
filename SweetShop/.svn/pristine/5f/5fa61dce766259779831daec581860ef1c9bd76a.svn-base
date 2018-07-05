<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="ko">
<!--<![endif]-->
<head>
<title>이벤트 상세</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
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
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico">

<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script  src="/src/user/js/default.js"></script>

<!-- 상단 기본 메뉴 좌우 스와이프 //-->
<link rel="stylesheet" href="/src/user/css/swiper.min.css">

<!-- 상단 좌측 슬라이드 판넬 메뉴 //-->
<link rel="stylesheet" href="/src/user/css/pushy.css">

<!-- jquery UI -->
<link rel="stylesheet" href="/src/user/css/jquery-ui.min.css" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<style type="text/css">
div.favorite{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$("#overlay_t").hide();
	
	// 좋아요 버튼 클릭시 
	$("div.favorite").on("click",function(){
		var chgDiv = $(this).find("img");	
		var targetElmt = $(this).find("img");
		var favoriteYN = $(this).find("img").attr("name");
		var shopSeq = $(this).next().val();
		
		if(favoriteYN=="Y"){
			
			$(chgDiv).toggle("puff",250,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_off.png").show();	
			});
			$(targetElmt).prop("name","N");
			
			$.ajax({
				  method: "POST",
				  url: "/user/common/delFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});			
		};
		
		if(favoriteYN=="N"){
			
			$(chgDiv).toggle("puff",300,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_on.png").show();	
			});
			$(targetElmt).attr("name","Y");
			
			$.ajax({
				  method: "POST",
				  url: "/user/common/addFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});			
		};
	});
		
	//팝업레이어 아니오 버튼
	/* $('#overlay_t, .close').click(function(e){ 
		   e.preventDefault(); 
		   pop_layer(false);
	});  */
	
	/* $(window).scroll(function(){
		var scTop = $(window).scrollTop();
		console.log("scTop : " , scTop);
	}) */
	//pop_layer(true);

});//endDom

//챙기기버튼
function eventDown(uSeq,eSeq){
 		 $.ajax({
			type: "POST",
			data:{"userSeq":uSeq,"eventSeq":eSeq},
			url: "/user/eventDownload.json",
			dataType:"text",
		    cache: false,
	 	 }).done(function(result){
	 		 pop_layer(true);
	 	 });  
};

function pop_layer( show ){
	if( show ){
		$("#overlay_t").show();
		setTimeout(function(){
			show_pop($("#popup_layer_insert"));		
		}, 100 );
		$("body").on("touchmove", function(e){e.preventDefault()});
	}else{
		$('#popup_layer_insert, #overlay_t').hide(); 	
		$("body").off("touchmove");
	}
}   	

function show_pop( obj ){
	obj.show();				
	var popH = obj.innerHeight();
	var popW = obj.innerWidth();
	var winW = $(window).width();
	var winH = $(window).height();
	var posW = (winW-popW)/2;
	var scTop = $(window).scrollTop();
	console.log("scTop : " , scTop)
	var posY = (winH-popH)/2-scTop ;
	obj.css({"left":posW, "top":posY});	   
}

//안드로이드 호출 Text
function popClickYes(){
	$(location).attr("href","/user/appMain_myCoupon.do");
	//alert("앱 호출"+ " : /user/app/couponList.do");
    //window.location = "/user/app/couponList.do";
}

</script>
<style type="text/css">
	p.btn_dam{
		float: none;
	}
	html{height: auto;}
</style>
</head>
<body >

<div id="overlay_t"></div> 
<div id="popup_layer_insert">
	
		<div class="bg_insert_circle">
			<div class="insert_circle">
				<img src="/src/user/images/common/icon_icou_noevent.png" style="width:25px; height:auto;" />
				<p>챙기기 완료</p>	
			</div>		
		</div>

		<div class="insert_text">쿠폰함으로 이동하시겠어요?</div>
		<div class="pop_btn_wrap">
			<p class="btn_pop_no"><a href="eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}" class="close">아니요</a></p>
			<p class="btn_pop_yes" onclick="popClickYes()"><a href="#">네</a></p>
		</div>
		
</div><!--END popup_layer_insert//-->

<div id="wrap_wide" >
	<!--
	<header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();"  class="menu-btn"><img src="./images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
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
			<li class="title"><a href="/user/shopInfo.do?userSeq=${userSeq}&shopSeq=${pl.shopSeq}" class="color_cafe"><p class="notcolor">${shopKind}ㆍ${pl.shop_sido} ${pl.shop_gu}</p>${pl.shop_name}</a></li>
			
			<li class="photo"><a href="/user/shopInfo.do?userSeq=${userSeq}&shopSeq=${pl.shopSeq}"><img src="${pl.img_path}"  /></a></li>
			
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

		<div class="dot_garo"></div>

		<div class="evcoupon_text">
			<ul>
				<li>${pl.eventStartDay} ~ ${pl.eventEndDay}</li>
				<li>${pl.eventTitle }</li>
				<li  class="color_cafe">${pl.eventDiscountTarget}<p>${pl.eventDiscount}</p></li>
				<li>
					<div class="evcoupon_btn_wrap">
						<p class="btn_dam" onclick="eventDown(${userSeq},${pl.eventSeq});"><a href="#" class="bg_cafe">챙기기</a></p>
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