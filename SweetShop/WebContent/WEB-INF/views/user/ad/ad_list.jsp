<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->          <!--<![endif]-->
<head>
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />

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

<script type="text/javascript">

var page = 0;
function lastPostFunc(page)  
{  		
		//$("div#lastPostsLoader").html("<div id='plus_loading' class='hc vc'><img src='/src/user/images/common/img_loading.gif' /></div>");
		console.log("page : " , page);
		$.ajax({
			  method: "GET",
			  url: "/user/adScrollLoad.do",
			  data: { "page": page}
		}).done(function(result){
			
			console.log("result : " , result);
			
			$("#main_list2").append(result);
			$("div#lastPostsLoader").empty();
			$("#btn_reflash").fadeOut("fast");
			
			//삭제활성 중에 페이지로딩할때 일단 활성된거로 통일
			var flag = $("#delDiv").val();
			if(flag==1){
				$("div .btn_pr_deatil").fadeOut("fast",function(){
					$(".btn_pr_del").fadeIn("fast");
					$("#delDiv").val(1);
				});
			}
		});
};  

$(window).scroll(function(){  
 		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
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


//다운한 홍보전단 삭제
function adDelBtn(e){
	var selElement = $(e);
	var parentLiTag  = $(e).parent().parent();
	var downSeq = $(e).next().val();
	$.ajax({
		  method: "POST",
		  url: "/user/adDel.do",
		  data: { "down_seq": downSeq},
		  dataType:"JSON"
	}).done(function(msg){
		$(parentLiTag).toggle("fade",400,function(){
			$(this).remove();
		});
	});			
}


//삭제 활성화
// flag >  0 비활성 1 활성
var activeDelBtn = function(){
	var flag = $("#delDiv").val();
	if(flag==0){
	$("div .btn_pr_deatil").fadeOut("fast",function(){
			$(".btn_pr_del").fadeIn("fast");
			$("#delDiv").val(1);
		});
	}
	if(flag==1){
		$(".btn_pr_del").fadeOut("fast",function(){
			$("div .btn_pr_deatil").fadeIn("fast");
			$("#delDiv").val(0);
		});
	}
};

// 좋아요 버튼 클릭시 
function favoritChange(e){
	 /* var chgDiv = $(this).find("img");	
	var targetElmt = $(this).find("img"); */
	var favoriteYN = $(e).find("img").attr("name"); 
	var shopSeq = $(e).next().val();
	
	//빨간하트일때 
	if(favoriteYN=="Y"){
		
		$(".favorite").each( function( index, obj ){
			var objDiv = $(obj).find("img");	
			var objtargetElmt = $(obj).find("img");
			var objfavoriteYN = $(obj).find("img").attr("name");
			var objshopSeq = $(obj).next().val();					
			if(objshopSeq==shopSeq){
				$(objDiv).toggle("puff",250,function(){
					$(objDiv).attr("src","/src/user/images/common/icon_favorite_off.png").show();	
				});
				$(objtargetElmt).prop("name","N");	
			}
		});
		
		$.ajax({
			  method: "POST",
			  url: "/user/common/delFavorite.do",
			  data: { "shopSeq": shopSeq},
			  dataType:"JSON"
		}).done(function(msg){
		});			
	};
	
	//빈하트일때 
	if(favoriteYN=="N"){
		
		$(".favorite").each( function( index, obj ){
			var objDiv = $(obj).find("img");	
			var objtargetElmt = $(obj).find("img");
			var objfavoriteYN = $(obj).find("img").attr("name");
			var objshopSeq = $(obj).next().val();					
			if(objshopSeq==shopSeq){
				$(objDiv).toggle("puff",300,function(){
					$(objDiv).attr("src","/src/user/images/common/icon_favorite_on.png").show();	
				});
				$(objtargetElmt).prop("name","Y");	
			}
		});
		
		$.ajax({
			  method: "POST",
			  url: "/user/common/addFavorite.do",
			  data: { "shopSeq": shopSeq},
			  dataType:"JSON"
		}).done(function(msg){
		});			
	};
}


	$(document).ready(function(){
		
		//로딩이미지 히든
		$("#btn_reflash").hide();
		
		//삭제버튼 히든
		$(".btn_pr_del").css("display","none");
		
// 		 var promotionList = '${promotionList}';
// 		 var todayDate = '${todayDate}';
// 		promotionList = $.parseJSON(promotionList);
		
		$("#delTestBtn").on("click",function(){
			activeDelBtn();
		});
			
		/* var id,options;
		function success(pos){var crd = pos.coords;console.log("현재위치 : " + crd.latitude + " , " + crd.longitude);}
		function error(err){console.log("error")};
		options = {enableHighAccuracy:false, timeout:5000, maximumAge:0};
		id = navigator.geolocation.watchPosition(success,error,options); */
		
})//endDom

</script>
<style>
	html { height:auto; }
	#trash{cursor: pointer;}
	header li:nth-child(3){
		color:#ff8b72;
		font-weight:500;
		font-size:20px;
		cursor: pointer;
	}
	p.btn_pr_del{
		margin: 0 16%;
	}
	#delDiv{
		width:50px;
		float:right;
		margin-right: 2%;
	}
	div.favorite{
		cursor: pointer;
	}
	p.btn_pr_deatil a:ACTIVE {
		background: inherit;
	}
	#wrap{
	margin-top: 3%;
}	
</style>


</head>

<body >

<!-- 최하단 스크롤 마지막에 나오는 아이콘 부분 //-->
<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>

<div id="wrap" >

	<div id="container"><!-- 판넬메뉴 오픈시 옆 이동을 위한 박스 공간 - 영역 없음 //-->

	<script src="/src/user/js/pushy.js"></script>
	<section class="list_main_wrap">
	
	<!-- delete Test -->
	 <!-- <button id="delTestBtn">Delete Test</button>	
	<br />
	<br /> --> 
	<!-- delete Test ENd-->
	
	<input type="hidden" value="0" id="delDiv">
	
		<div id="main_list" class="">
			<ul id="main_list2" >
				
				<fmt:parseDate value="${todayDate}" pattern="yyyy-MM-dd" var="curDate"/>
				<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${curDate}" var="curDate2" />
				
				<!-- 섹션 시작 //-->
				<c:forEach items="${promotionList}" var="pl">
					
					<fmt:parseDate value="${pl.promotion_end_day}" pattern="yyyy-MM-dd" var="endDate"/>
					<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${endDate}" var="endDate2" />
					
					<!-- 마감여부 -->
					<c:choose>
						<c:when test="${ curDate2 > endDate2}">
							<c:set var="endYN" value="wrdLatest alpha30per" />
						</c:when>
						<c:when test="${ curDate2 <= endDate2}">
							<c:set var="endYN" value="wrdLatest" />
						</c:when>
					</c:choose>
				<li class="${endYN}">
					<!-- 리본 -->
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
						<div class="title"><a href="#" class="color_cafe"><span class="notcolor">${shopKind}</span>${pl.shop_name}</a></div>
						
						<!-- 이미지  -->
						<div class="photo"><a href="/user/adDetail.do?promotionSeq=${pl.promotion_seq}"><img src="${pl.img_path}"  /></a></div>
						
						<div class="infomation">
							<ul>
<!-- 								<li> -->
<%-- 								<c:if test="${pl.favoriteCnt > 10}">   <!-- 임시 : 즐겨찾기수 --> --%>
<!-- 									<img src="/src/user/images/common/icon_list_hot.png" /> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${pl.dateDiff2 <= 7 }"> <!-- 임시 : 홍보전단 등록이 일주일 이내  --> --%>
<!-- 									<img src="/src/user/images/common/icon_list_new.png" /> -->
<%-- 								</c:if> --%>
<!--  									<img src="/src/user/images/common/icon_list_dc.png" />  -->
<!--  									<img src="/src/user/images/common/icon_list_coupon.png" /> -->
<!-- 								</li> -->
								<li>							
								<c:set var="value" value="${pl.reviewAvgFloor}" />
								<c:choose>
									<c:when test="${value == 0 }">
										<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;">별점 없음</span>
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
						
						<!-- 추가 영역 //-->
						<div class="day_guide">
							<c:choose>
								<c:when test="${pl.dateDiff > 0}">
									<p class="use_day">${pl.dateDiff}일 남음</p>
								</c:when>
								<c:when test="${pl.dateDiff < 0}">
									<p class="use_day_end">아이쿠! 종료 되었습니다.</p>
								</c:when>
								<c:otherwise>
									<p class="use_day">오늘까지!</p>
								</c:otherwise>
							</c:choose>
							<p class="discount color_cafe" style="overflow:hidden; text-overflow:ellipsis; height: 25px; margin-left: 20%; margin-right: 20%;  white-space: nowrap;">
									${pl.promotion_detail_desc}</p>
						</div>
						<div class="evcoupon_btn_wrap mb10" style="margin-left: 5%;">
							<p class="btn_pr_deatil"><a href="/user/adDetail.do?promotionSeq=${pl.promotion_seq}">자세히</a></p>
							<p class="btn_pr_deatil"><a href="/user/adWhere.do?promotionSeq=${pl.promotion_seq}">어디야</a></p>
							<p class="btn_pr_del" style="display: none;" onclick="adDelBtn(this);"><a href="#this"><img src="/src/user/images/common/btn_minus_del.png" style="width:18px; height:auto; margin-bottom:3px;" alt="삭제하기" /></a></p>
							<input type="hidden" value="${pl.down_seq}" id="downSeq">
						</div>
						<!-- 추가 영역 끝 //-->
					</li>
				</c:forEach>
				<!-- 섹션 끝//-->
				
			</ul>
		</div>
		<div id="lastPostsLoader"></div>
	</section>

	</div><!-- END container//-->
		<!-- 스크롤 하단 찾기위한 여유공간 //-->
		<!-- <div style="height:50px; width:100%;"></div> --> 
		
</div><!-- END wrap//-->


</body>
</html>