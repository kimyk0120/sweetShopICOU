<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->         <!--<![endif]-->
<head>
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />

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
	p.btn_where a:ACTIVE {
		background: inherit;
	}
	p.btn_dam a:ACTIVE {
		background: inherit;
		color: #484852;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 좋아요 버튼 클릭시 
		$("div.favorite").on("click",function(){
			var chgDiv = $(this).find("img");	
			var targetElmt = $(this).find("img");
			var favoriteYN = $(this).find("img").attr("name");
			var shopSeq = $(this).next().val();
			
// 			console.log(favoriteYN);
			
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

</script>

</head>

<body >



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
	<fmt:parseDate value="${todayDate}" pattern="yyyy-MM-dd" var="curDate"/>
	<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${curDate}" var="curDate2" />
	<fmt:parseDate value="${pl.promotion_end_day}" pattern="yyyy-MM-dd" var="endDate"/>
	<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${endDate}" var="endDate2" />	
	
	<c:choose>
		<c:when test="${ curDate2 > endDate2}">
			<c:set var="endYN" value="shop_detail alpha30per" />
		</c:when>
		<c:when test="${ curDate2 <= endDate2}">
			<c:set var="endYN" value="shop_detail" />
		</c:when>
	</c:choose>	
	<div class="${endYN}">
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
		<input type="hidden" value="${pl.shop_seq}" id="shopSeq">
		<ul class="cont">
			<li class="title"><a href="#" class="color_cafe"><p class="notcolor">${shopKind}ㆍ${pl.shop_sido} ${pl.shop_gu}</p>${pl.shop_name}</a></li>
			
			<li class="photo"><a href="#"><img src="${pl.img_path}" /></a></li>
<!-- 			<li class="memo">바쁘고 지친 여러분께 여유를 드립니다. <br />고즈넉한 아름다움을 지닌 전통카페, 예다손</li> -->
			<li class="memo"><br /></li>
			<li class="infomation">
				<ul>
					<li>
						<c:if test="${pl.favoriteCnt > 10}">   <!-- 임시 : 즐겨찾기수 -->
									<img src="/src/user/images/common/icon_list_hot.png" />
						</c:if>
						<c:if test="${pl.dateDiff2 <= 7 }"> <!-- 임시 : 홍보전단 등록이 일주일 이내  -->
									<img src="/src/user/images/common/icon_list_new.png" />
						</c:if>
					</li>
					<li style="float: right;">
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


		<div class="evcoupon_text">
			<ul>
				<li>&nbsp;</li>
				<li style="padding: 0 10% 0 10%; overflow: hidden; text-overflow:ellipsis;">${pl.promotion_detail_desc}</li>
				<li  class="color_cafe">
					<c:choose>
								<c:when test="${pl.dateDiff >= 0}">
									${pl.promotion_start_day} ~ ${pl.promotion_end_day}
								</c:when>
								<c:when test="${pl.dateDiff < 0}">
									아이쿠! 종료 되었습니다.
								</c:when>
					</c:choose>
					
					<p style="font-size: 16px;"><a href="http://${pl.shop_homepage_url}" style="color:#683221;">${pl.shop_homepage_url}</a></p>
<%-- 					<span><a href="${pl.shop_homepage_url}">${pl.shop_homepage_url}</a></span> --%>
				</li>
				<li>
					<div class="evcoupon_btn_wrap">
						<p class="btn_where"><a href="/user/adWhere.do?promotionSeq=${pl.promotion_seq}">어디야</a></p>
						<p class="btn_dam"><a href="/user/shopInfo.do?userSeq=${userSeq}&shopSeq=${pl.shop_seq}&userLat=${userLat}&userLong=${userLong}" class="bg_cafe">Store</a></p>
					</div>
				</li>
			</ul>
		</div>
	</div><!-- 섹션 끝 //-->


</section>

</div><!-- END wrap//-->
</body>
</html>