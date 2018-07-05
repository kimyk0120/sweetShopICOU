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
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
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
#wrap{
	margin-top: 3%;
}	
</style>

<script type="text/javascript">

$(function(){
	
	$("#btn_reflash").hide();
	if($(".list_main_wrap").height()>=720){
		$("body").css("height","auto");			
	}else{
		$("body").css("height",$(window).height()+"px");
	}
	
})//end domready


var page = 0;
function lastPostFunc(page)
{
		//$("div#lastPostsLoader").html("<div id='plus_loading' class='hc vc'><img src='./images/common/img_loading.gif' /></div>");
		$.ajax({
			  method: "GET",
			  url: "/user/likeitScrollLoad.do",
			  data: { "page": page}
		}).done(function(result){
			$("#main_list2").append(result);
			$("div#lastPostsLoader").empty();
			$("#btn_reflash").fadeOut("fast");
		});
};

$(window).scroll(function(){
//		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){
        	
        	var btn_reflash_height = $("#btn_reflash").height();
			var document_height =  $(document).height();
			
			// 로딩 이미지 위치
			var position_y = document_height - 90;
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
        	
        	page++;
        	lastPostFunc(page);
		}
});


//좋아요 버튼 클릭시 
function favoritChange(e){
    var chgDiv = $(e).parent();	
	var targetElmt = $(e).find("img");
	var shopSeq = $(e).next().val();
	$(targetElmt).toggle("puff",400,function(){
		$(chgDiv).toggle("fade",400,function(){
			$(this).remove();
		});
	});
	
	$.ajax({
		  method: "POST",
		  url: "/user/common/delFavorite.do",
		  data: { "shopSeq": shopSeq},
		  dataType:"JSON"
	}).done(function(msg){
	});			
};

</script>

<!-- 메인 및 스크롤로 콘텐츠 더 추가 구성시 백그라운드 그라데이션도 같이 조정 되게 하기 위해 아래 스타일이 적용 됨 //-->
<style>
	html { height:auto; }
</style>


</head>
<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>
<body >
<div id="wrap" >
	
	<div id="container"><!-- 판넬메뉴 오픈시 옆 이동을 위한 박스 공간 - 영역 없음 //-->

	<section class="list_main_wrap">
		<div id="main_list" class="">
			<ul id="main_list2" >
				<c:forEach items="${likeList}" var="pl">
				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
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
							<div class="favorite" onclick="favoritChange(this);"><img src="/src/user/images/common/icon_favorite_on.png" name="Y" /></div>
						</c:when>
						<c:otherwise>
							<div class="favorite" onclick="favoritChange(this);"><img src="/src/user/images/common/icon_favorite_off.png" name="N" /></div>
						</c:otherwise>
				</c:choose>
						<input type="hidden" value="${pl.shop_seq}" id="shopSeq">		
						
					<div class="title"><a href="/user/shopInfo.do?userSeq=${pl.user_seq}&shopSeq=${pl.shop_seq}&userLat=${userLat}&userLong=${userLong}" class="color_cafe"><span class="notcolor">${shopKind}</span><span>${pl.shop_name}</span></a></div>
					<div class="photo"><a href="/user/shopInfo.do?userSeq=${pl.user_seq}&shopSeq=${pl.shop_seq}&userLat=${userLat}&userLong=${userLong}"><img src="${pl.shop_img_path}"  /></a></div>
					<div class="infomation">
						<ul>
							<li>
							<c:set var="value" value="${pl.reviewAvgFloor}" />
								<c:choose>
									<c:when test="${value == 0 }">
										<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;vertical-align:top;">별점 없음</span>
									</c:when>
									<c:otherwise>
										<img src="/src/user/images/common/star_gray_min_right_${value}.png" />
									</c:otherwise>								
								</c:choose>
							</li>
							<li>
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
				<!-- 섹션 끝//-->
				</c:forEach>
				
			</ul>
		</div>
		<!-- <div id="lastPostsLoader"></div> -->
	</section>

	</div><!-- END container//-->

		<!-- 스크롤 하단 찾기위한 여유공간 //-->
		<!-- <div style="height:50px; width:100%;"></div> --> 

</div><!-- END wrap//-->
</body>
</html>