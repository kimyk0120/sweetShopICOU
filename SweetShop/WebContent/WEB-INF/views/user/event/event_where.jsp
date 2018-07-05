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
<title>이벤트 어디야</title>
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
<script  src="/src/user/js/jquery-1.11.3.min.js"></script>
<script  src="/src/user/js/default.js"></script>
<!-- jquery UI -->
<link rel="stylesheet" href="/src/user/css/jquery-ui.min.css" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=ef0c0f96a62e5f62c7f7f80ecf2fa4ec"></script>

<style type="text/css">
div.tick_favorite{
		cursor: pointer;
	}
/* 좋아요 버튼이랑 주소랑 겹쳐서  */
div.event_ticket_wrap > ul > li:nth-child(3) > p{
	margin-bottom:10px;
}	
/* 업종과 시,군 이 아래로 내려가는 현상 */
div.tick_title > a > p {
	font-size: x-small;
}

div.ev_ticket_box{width: 100%;}
</style>

<script>
	$(function(){
		/* var flag = '${flag}';
		console.log("flag : " , flag); */
		
		$("#overlay_t").hide();
		
		var shopLat = '${shopLat}';
		var shopLong = '${shopLong}';
		
		function map_show(){
			var mapContainer = document.getElementById('view_map'), // 지도를 표시할 div 
				mapOption = { 
					center: new daum.maps.LatLng(shopLat,shopLong), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};
			
			var map = new daum.maps.Map(mapContainer, mapOption);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(shopLat,shopLong); 
			
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
		}	
		map_show()
		
		
		// 좋아요 버튼 클릭시 
		$("div .tick_favorite").on("click",function(){
			
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
		$('#overlay_t, .btn_pop_no').click(function(e){ 
			   e.preventDefault(); 
			   pop_layer(false);
		});  
	
		
		
});	//end Dom
	
	//챙기기버튼
	function eventDown(uSeq,eSeq){
		
 	 	  $.ajax({
				type: "POST",
				data:{"userSeq":uSeq,"eventSeq":eSeq},
				url: "/user/eventDownload.json",
				dataType:"text",
			    cache: false,
		 	 }).done(function(result){
		 		 
		 		 // 버튼 사용완료로 변경
		 		 var str = "<p class=\"btn_ticket_insert bg_useing bg_bakery\" ><span class=\"\"><a href=\"eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}\">사용하기</a></span></p>";
				 $("#changeBtnDiv").html(str);
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
		var posY = (winH-popH)/2;
		obj.css({"left":posW, "top":posY});	   
	}	
	
	
	//안드로이드 호출 Text
	function popClickYes(){
		console.log("location href coupon list");
		//alert("app my쿠폰 호출");
		$(location).attr("href","/user/appMain_myCoupon.do");
	}
</script>
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
			<%-- <p class="btn_pop_no"><a href="eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}">아니요</a></p> --%>
			<p class="btn_pop_no"><a>아니요</a></p>
			<p class="btn_pop_yes" onclick="popClickYes()"><a>네</a></p>
		</div>
		
</div><!--END popup_layer_insert//-->

<div id="wrap_wide" class="h100p" >

	<!-- 서브 상단 //-->
<!-- 	<header class="sub pos_fixed">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="./images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>어디야</li>
			<li><a href="#" class="menu-btn"><img src="./images/common/btn_logout.png" style="width:18px; height:auto; margin-right:5px;" /></a></li>
		</ul>
	</header>
 -->	

<section class="sub_content_wrap_wide h100p pos_fixed">

	<div class="map_full h100p">
		<div class="cont" id="view_map"></div>	
        <div class="ev_ticket_box">

            <!-- 티켓 디자인 시작 //-->
            <c:choose>
				<c:when test="${flag == '2' }">
					<c:set var="endYN" value="event_ticket_wrap alpha30per" />
				</c:when>
	            <c:otherwise>
	          		<c:set var="endYN" value="event_ticket_wrap" />
	            </c:otherwise>
            </c:choose>
            <div class="${endYN}">
                <ul>
                    <li>
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
          <div class="tick_ribbon"><img src="${shopKindImg}" /></div>
          <img src="${pl.img_path}"  />	
                    </li>
                    <li>
                    
        <c:choose>
			<c:when test="${pl.favoriteYN == 'Y' }">
				<div class="tick_favorite"><img src="/src/user/images/common/icon_favorite_on.png" name="Y" /></div>
			</c:when>
			<c:otherwise>
				<div class="tick_favorite"><img src="/src/user/images/common/icon_favorite_off.png" name="N" /></div>
			</c:otherwise>
		</c:choose>
				<input type="hidden" value="${pl.shopSeq}" id="shopSeq">
                        <div class="tick_title"><a href="" class="color_bakery"><p class="notcolor">${shopKind}ㆍ${pl.shop_sido} ${pl.shop_gu}</p>${pl.shop_name}</a></div>
                        <div class="tick_addr">
                        <%-- ${pl.shop_sido} ${pl.shop_gu}<br /> --%>
                        ${pl.shop_addr1}</div>
                        <div class="tick_infomation">
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
                    </div>
                    </li>
                    <li class="color_bakery">
                        ${pl.eventDiscountTarget}<strong style="line-height:normal;">${pl.eventDiscount}</strong>
                        
						<div id="changeBtnDiv">
                        <c:choose>
	                        <c:when test="${flag == '0' }">
		                        <p class="btn_ticket_insert bg_bakery" onclick="eventDown(${userSeq},${pl.eventSeq});" ><span class=""><a>챙기기</a></span></p>
	                        </c:when>
	                        <c:when test="${flag == '1' }">
	    	                    <p class="btn_ticket_insert bg_useing bg_bakery" ><span class=""><a href="eventDetail.do?userSeq=${userSeq}&eventSeq=${pl.eventSeq}&userLat=${userLat}&userLong=${userLong}">사용하기</a></span></p>
	                        </c:when>
	                        <c:otherwise>
	                           <!--  <p class="btn_use_end" ><span class=""><a href="#">사용 완료</a></span></p> -->
	                            <p class="btn_ticket_insert bg_bakery" style="background: lightgray;" ><span class=""><a id="testPop">사용 완료</a></span></p>
	                        </c:otherwise>
                        </c:choose>
						</div>
                    
                    </li>
                </ul>
            </div><!-- end event_ticket_wrap //-->
        </div>
	</div>
</section>

</div><!-- END wrap//-->
</body>
</html>