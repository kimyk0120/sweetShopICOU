<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->         <!--<![endif]-->
<head>
<title>${shop_info.shop_name}</title>

<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/user/jsp/include.jsp" charEncoding="UTF-8" />
<!-- jquery UI -->
<link rel="stylesheet" href="/src/user/css/jquery-ui.min.css" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script>
$( document ).ready(function() { 
    $('#popup_layer_insert, #overlay_t').hide();     
});

$('.trigger').click(function(){ 
    $('#popup_layer_insert, #overlay_t').show(); 
	var $layerPopupObj = $('#popup_layer_insert');
	var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
	var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
	$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
}); 

$('#overlay_t, .close').click(function(e){ 
    e.preventDefault(); 
    $('#popup_layer_insert, #overlay_t').hide(); 
});

	function goReview(){
		
		$('#eventDiv').hide();
		$('#reviewDiv').show();
		
	}
	
	function goEvent(){
		
		$('#eventDiv').show();
		$('#reviewDiv').hide();
		
	}

	function goEventDownload(eSeq,uSeq,eId) {
		
		var changeStr = "<p id=\""+eId+"\" class=\"btn_ticket_insert bg_useing\"><span class=\"\"><a href=\"javascript:goEventUse('"+eSeq+"','"+uSeq+"','"+eId+"');\">사용하기</a></span></p>";
		//var sucessFlag = false;
		
		$.get(
				"/user/eventDownload.json?eventSeq=" + eSeq+ "&userSeq=" + uSeq ,
				function(data) {
					//console.log("Data: " + data);
					var obj = $.parseJSON(data);
					//console.log("Data: " + obj.result);
					if (obj.result == "true") {
						$("#"+eId).replaceWith(changeStr);

						var $layerPopupObj = $('#popup_layer_insert');
						var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
						var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );

						/*스크롤에대한 top height */
						top = $(window).scrollTop() + 30;
						
						$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
					    $('#popup_layer_insert, #overlay_t').show(); 
					}
				});
	}
	
	
	
	// 이벤트 사용하기( 상세 ) 페이지로 이동
	function goEventUse(eSeq,uSeq,eId) {
		
		var userLat = $("#userLat").val();
		var userLong = $("#userLong").val();
		
		//console.log("eventSeq :", eSeq , " , userSeq : " , uSeq , " , userLat : " , userLat , " ,  userLong : " , userLong);
		window.location = "/user/eventDetail.do?eventSeq=" + eSeq+ "&userSeq=" + uSeq+"&userLat="+userLat+"&userLong="+userLong;
	}
	
	// 팝업에서 i.COU로 이동하시겠어요? 네 선택시
	function popupOk() {
	    $('#popup_layer_insert, #overlay_t').hide(); 
		
	    // 해당 링크로 app호출 쿠폰리스트
	    $(location).attr("href","/user/appMain_myCoupon.do");
	    //alert("앱 호출"+ " : /user/app/couponList.do");
	    //window.location = "/user/app/couponList.do";
	}
</script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c73d7d30d6de750c69c79b6255f580ef"></script>
<script>
$(function(){
	
	// 맵 관련
	function map_show(){
		var container = document.getElementById('location_map');
		var lat = ${shop_info.shop_location_lat} ;
		var lon = ${shop_info.shop_location_long} ;
		var options = {
			center: new daum.maps.LatLng(lat, lon),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(lat, lon); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}

	map_show();	
	
	var currentShow = true;
	
	//상세설명
	$(".shoview_detail_text .arrow a").on("click", function(e){		
		e.preventDefault();
		if($(this).hasClass("on")){
			$(this).removeClass("on");
			$(".shoview_detail_text .cont").addClass("over_2line");
		}else{
			$(this).addClass("on");
			$(".shoview_detail_text .cont").removeClass("over_2line");
		}
		
	});
	
	//위치정보
	$(".shoview_detail_map .arrow a").on("click", function(e){	
		e.preventDefault();	
		if($(this).hasClass("on")){
			$("#location_map").hide();	
			$(".address_text").hide();						
			$(this).removeClass("on");
		}else{
			$("#location_map").show();
			$(".address_text").show();	
			if( !currentShow ){
				map_show();
			}
			$(this).addClass("on");
			currentShow = true;	
		}
	});
	
	
	// 좋아요 버튼 선택시
	$(document).on("click","div.favorite",function(){

		var chgDiv = $(this).find("img");	
		var targetElmt = $(this).find("img");
		var favoriteYN = $(this).find("img").attr("name");
		var shopSeq = $("#shopSeq").val();
		
		console.log(favoriteYN);
		if(favoriteYN=="1"){
			
			$(chgDiv).toggle("puff",250,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_off.png").show();	
			});
			$(targetElmt).prop("name","0");									  

			$.ajax({
				  method: "POST",
				  url: "/user/common/delFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});
			
		}else if(favoriteYN=="0"){

			$(chgDiv).toggle("puff",300,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_on.png").show();	
			});
			$(targetElmt).attr("name","1");				
			
			$.ajax({
				  method: "POST",
				  url: "/user/common/addFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});			
		};
	});
	
	
 	//팝업 닫기
 	$(".btn_pop_no,#overlay_t").on("click",function(){
 		$('#popup_layer_insert, #overlay_t').hide();
 	});
	
});// endDomReady
</script>
<style type="text/css">
	.favorite{cursor:pointer;}
	html{height: inherit;} /* 팝업 위치 정하기 위해 사용함 16.12.14 */
	div.shop_detail > ul.cont > li.infomation > ul{padding:15px 7% 0px;}
	div.shop_detail > div.shop_info_basic{padding:0px 7%;}
	div.tick_infomation > ul > li:last-child{float: right;}
	div.review_wrap > ul > li:nth-child(3) { padding:10px 0px; }
	div.review_wrap > ul > li:nth-child(3) > ul.jumsu_star > li{font-size: 11px;}
</style>
</head>
<body >
<input type="hidden" value="${userSeq}" id="userSeq">
<input type="hidden" value="${shopSeq}" id="shopSeq">
<input type="hidden" value="${userLat}" id="userLat">
<input type="hidden" value="${userLong}" id="userLong">
<!-- popup -->
<div id="overlay_t"></div> 
<div id="popup_layer_insert" >
		<div class="bg_insert_circle">
			<div class="insert_circle">
				<img src="/src/user/images/common/icon_icou_noevent.png" style="width:25px; height:auto;" />
				<p>챙기기 완료</p>	
			</div>		
		</div>

		<div class="insert_text">i.COU로 이동하시겠어요?</div>
		<div class="pop_btn_wrap">
			<p class="btn_pop_no"><a>아니요</a></p>
			<p class="btn_pop_yes"><a href="javascript:popupOk();">네</a></p>
		</div>
</div>
<!--END popup_layer_insert//-->

				<c:choose>
					<c:when test="${shop_info.shop_kind eq '000'}"> <!-- 미용 / 스파 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_beauty.png" />
						<c:set var="shopColorClass" value="color_beauty" />
						<c:set var="shopBgClass" value="bg_beauty" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '001'}"> <!-- 헤어 / 메이크업 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_hair.png" />
						<c:set var="shopColorClass" value="color_hair" />
						<c:set var="shopBgClass" value="bg_hair" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '002'}"> <!-- 부동산 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_realty.png" />
						<c:set var="shopColorClass" value="color_realty" />
						<c:set var="shopBgClass" value="bg_realty" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '003'}"> <!-- 빵집 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_bakery.png" />
						<c:set var="shopColorClass" value="color_bakery" />
						<c:set var="shopBgClass" value="bg_bakery" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '004'}"> <!-- 숙박 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_stay.png" />
						<c:set var="shopColorClass" value="color_stay" />
						<c:set var="shopBgClass" value="bg_stay" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '005'}"> <!-- 슈퍼 / 마트 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_super.png" />
						<c:set var="shopColorClass" value="color_super" />
						<c:set var="shopBgClass" value="bg_super" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '006'}"> <!-- 약국 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_pharmacy.png" />
						<c:set var="shopColorClass" value="color_pharmacy" />
						<c:set var="shopBgClass" value="bg_pharmacy" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '007'}"> <!-- 음식점 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_food.png" />
						<c:set var="shopColorClass" value="color_food" />
						<c:set var="shopBgClass" value="bg_food" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '008'}"> <!-- 카페 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_cafe.png" />
						<c:set var="shopColorClass" value="color_cafe" />
						<c:set var="shopBgClass" value="bg_cafe" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '009'}"> <!-- 인테리어 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_interier.png" />
						<c:set var="shopColorClass" value="color_interier" />
						<c:set var="shopBgClass" value="bg_interier" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '010'}"> <!-- 청소 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_clean.png" />
						<c:set var="shopColorClass" value="color_clean" />
						<c:set var="shopBgClass" value="bg_clean" />
					</c:when>
					<c:when test="${shop_info.shop_kind eq '011'}"> <!-- 스포츠 -->
						<c:set var="shopKindImg" value="/src/user/images/common/ribbon_sports.png" />
						<c:set var="shopColorClass" value="color_sports" />
						<c:set var="shopBgClass" value="bg_sports" />
					</c:when>
				</c:choose>

					<c:if test="${shop_info.bookmark eq '0' }">
							<c:set var="favoriteImg" value="/src/user/images/common/icon_favorite_off.png" />
					</c:if>

					<c:if test="${shop_info.bookmark eq '1' }">
							<c:set var="favoriteImg" value="/src/user/images/common/icon_favorite_on.png" />
					</c:if>


<!-- 상세영역  -->
<div id="wrap_wide" >

	<section class="sub_content_wrap">
	
	<!-- 섹션 시작 //-->
	<div class="shop_detail">
		<div class="ribbon"><img src="${shopKindImg}" /></div>
		<div class="favorite"><img src="${favoriteImg}" name="${shop_info.bookmark}" /></div>
		
		<ul class="cont">
			<li class="title"><a class="color_bakery"><p class="notcolor">${shop_info.shop_category}</p>${shop_info.shop_name}</a></li>
			<li class="photo"><a ><img src="${shop_info.shop_img_path}"  /></a></li>
			<li class="memo">${shop_info.shop_intro}</li> 
			<li class="infomation">
				<ul>
					<li>
						<!-- <img src="/src/user/images/common/icon_list_new.png" />
						<img src="/src/user/images/common/icon_list_dc.png" /> -->
					</li>
					
					<li style="float: right;">
						<p>
							<c:set var="value" value="${shop_info.reviewAvgFloor}" />
							<c:choose>
								<c:when test="${value == 0 }">
									<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;vertical-align:top;">별점 없음</span>
								</c:when>
								<c:otherwise>
									<img src="/src/user/images/common/star_gray_min_${value}.png" />
								</c:otherwise>								
							</c:choose>
							
						</p>
						<c:choose>
								<c:when test="${shop_info.distanceMeter<1000}">
									${shop_info.distanceMeter}m
								</c:when>
								<c:otherwise>
									${shop_info.distanceKmeter}km 
								</c:otherwise>								
						</c:choose>
					</li>
				</ul>			 
			</li>
		</ul>

		<div class="shop_info_basic">
			<dl>
				<dt><img src="/src/user/images/common/icon_coremenu.png" style="width:14px; height:auto; margin-right:7px;" alt="" />주요메뉴</dt>

				<dd>${shop_info.shop_menu}</dd>
			</dl>
			<!-- 
			<dl>
				<dt><img src="/src/user/images/common/icon_opentime.png" style="width:14px; height:auto; margin-right:7px;" alt="" />영업시간</dt>
				<dd>09:00 ~ 20:00</dd>
			</dl>
			 -->
			<dl>
				<dt><img src="/src/user/images/common/icon_homepage.png" style="width:14px; height:auto; margin-right:7px;" alt="" />홈페이지</dt>
				<dd class="underline"><a href="${shop_info.shop_homepage_url}" target="_New">${shop_info.shop_homepage_url}</a></dd>
			</dl>
			<dl>
				<dt><img src="/src/user/images/common/icon_tel.png" style="width:14px; height:auto; margin-right:7px;" alt="" />휴대전화</dt>
				<dd class="underline"><a href="tel:${shop_info.shop_tel}"><span class="tel_color">${shop_info.shop_tel}</span></a></dd>
			</dl>
		</div>


		<!-- 상세설명 + 위치정보 아코디언 스타일 //-->
		<div class="shoview_detail_text">
			<p class="arrow"><a ></a></p>
			<p class="title">상세설명</p>
			<p class="cont over_2line">${shop_info.shop_etc}</p>
		</div>
		<div class="shoview_detail_map">
			<p class="arrow"><a class="on"></a></p>
			<p class="title">위치정보</p>
			<p class="cont" id="location_map" style="display:block;"></p>
			<p class="address_text" style="display:block;">${shop_info.shop_addr1}</p>
		</div>
	</div><!-- 섹션 끝 //-->

</section>



<!-- 하단메뉴섹션 --> 
<section class="sub_content_wrap_wide pl5 pr5">

	<div id="eventDiv" style="display:block">
		<div class="evre_menu">
			<ul>
				<li class="on"><a href="javascript:;">Event</a></li>
				<li><a href="javascript:goReview();">Review</a></li>
			</ul>
		</div>
		
		<c:choose>
			<c:when test="${fn:length(shopEvnetList) < 1 }">
				<div class="evre_nothing">
					<img src="/src/user/images/common/icon_icou_noevent.png" style="width:30px; height:auto;" />
					<p><span>아이쿠!</span><br />진행중인 이벤트가 없습니다.</p>
				</div>			
			</c:when>
			<c:otherwise>
				<c:forEach items="${shopEvnetList}" var="shopEvnetList" varStatus="s">
					<!-- 티켓 디자인 시작 //-->
					<div class="event_ticket_wrap">
						<ul>
							<li>
								<div class="tick_ribbon"><img src="${shopKindImg}" /></div>
								<img src="${shopEvnetList.eventImageUrl}"  />	
							</li>
							<li>
								<div class="tick_favorite"></div>
								<div class="tick_title"><a href="/user/eventDetail.do?eventSeq=${shopEvnetList.eventSeq}&userSeq=${userSeq}" class="${shopColorClass}"><p class="notcolor">${shop_info.shop_category}</p>${shop_info.shop_name}</a></div>
								<div class="tick_addr">${shop_info.shop_addr1}</div>
								 
								<div class="tick_infomation">
									<ul>
										<li>
											
												<fmt:parseDate pattern="yyyy-MM-dd" value="${todayDate}" var="todayParseDate" type="date"></fmt:parseDate>
												<fmt:parseDate pattern="yyyy-MM-dd" value="${shopEvnetList.eventStartDay}" var="parseDate" type="date"></fmt:parseDate>
												
												<fmt:formatDate value="${todayParseDate}" var="now" pattern="yyyyMMdd" />
												<fmt:formatDate value="${parseDate}" var="date" pattern="yyyyMMdd" />
													
												<fmt:parseNumber value="${todayParseDate.time/(1000*60*60*24)}" integerOnly="true" var="todayDateNum" />					
												<fmt:parseNumber value="${parseDate.time/(1000*60*60*24)}" integerOnly="true" var="parseDateNum" />	
											
											<c:if test="${ (todayDateNum - parseDateNum) <= 7 } ">
												<img src="/src/user/images/common/icon_list_new.png" />
											</c:if>
											<c:if test="${shopEvnetList.eventDiscountWay eq P}">
												<img src="/src/user/images/common/icon_list_dc.png" />
											</c:if>
										</li>
										<li>
											<p>
											<c:set var="value" value="${shop_info.reviewAvgFloor}" />
											<c:choose>
												<c:when test="${value == 0 }">
													<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;vertical-align:top;">별점 없음</span>
												</c:when>
												<c:otherwise>
													<img src="/src/user/images/common/star_gray_min_${value}.png" />
												</c:otherwise>								
											</c:choose>
											</p>
											<c:choose>
													<c:when test="${shop_info.distanceMeter<1000}">
														${shop_info.distanceMeter}m
													</c:when>
													<c:otherwise>
														${shop_info.distanceKmeter}km 
													</c:otherwise>								
											</c:choose>
										</li>
									</ul>			
								</div>
								
							</li>
							<li class="${shopColorClass}">
								${shopEvnetList.eventTitle}<strong>${shopEvnetList.eventDiscount}</strong>
								<c:if test="${shopEvnetList.eventDownloadYn eq '0' }">
									<p id="eventDwonUse${s.index}" class="btn_ticket_insert ${shopBgClass}">
										<span class="">
											<a href="javascript:goEventDownload('${shopEvnetList.eventSeq}','${userSeq}','eventDwonUse${s.index}');">챙기기</a>
										</span>
									</p>
								</c:if>
			
								<c:if test="${shopEvnetList.eventDownloadYn eq '1' and shopEvnetList.eventUseYn eq '0' }">
									<p id="eventDwonUse${s.index}" class="btn_ticket_insert bg_useing">
										<span class="">
											<a href="javascript:goEventUse('${shopEvnetList.eventSeq}','${userSeq}','eventDwonUse${s.index}');">사용하기</a>
										</span>
									</p>
								</c:if>
			
								<c:if test="${shopEvnetList.eventDownloadYn eq '1' and shopEvnetList.eventUseYn eq '1' }">
									<p id="eventDwonUse${s.index}" class="btn_ticket_insert bg_useing">
										<span class="">사용완료</span>
									</p>
								</c:if>
							</li>
						</ul>
					</div><!-- end event_ticket_wrap //-->
					</c:forEach>					
			</c:otherwise>
		</c:choose>
	</div>


	<div id="reviewDiv" style="display:none;">
		<div class="evre_menu">
			<ul>
				<li ><a href="javascript:goEvent();">Event</a></li>
				<li class="on"><a href="javascript:;">Review</a></li>
			</ul>
		</div>

		<c:if test="${shop_review_info.reviewCount eq '0' }">
			<div class="evre_nothing">
				<img src="/src/user/images/common/icon_icou_noevent.png" style="width:30px; height:auto;" />
				<p><span>아이쿠!</span><br />첫 번째 리뷰를 주세요!</p>
				<p class="btn_review"><a href="/user/reviewWrite.do?shopSeq=${shop_info.shop_seq}&userSeq=${userSeq}"><img src="/src/user/images/common/btn_review_write.png" style="width:65px; height:auto;" /></a></p>
			</div>
		</c:if>
		<c:if test="${shop_review_info.reviewCount ne '0' }">
		
		<div class="btn_review_more"><a href="/user/reviewList.do?shopSeq=${shop_info.shop_seq}&ord=rgDt">전체 리뷰 보기</a></div>

		<div class="review_wrap">
			<ul>
				<li>
					<p class="reviews"><img src="/src/user/images/common/icon_people.png" style="width:16px; height:auto;" /><span>${shop_review_info.reviewCount}</span> Reviews</p>
					<div class="review_jumsu">
						<ul>
							<li>${shop_review_info.gradeFirst}</li>
							<li>.</li>
							<li>
							<c:if test="${shop_review_info.gradeLast eq '' }">
							0
							</c:if>
							<c:if test="${shop_review_info.gradeLast ne '' }">
							${shop_review_info.gradeLast}
							</c:if>
							</li>
						</ul>
					</div>
					<p class="review_star">
						<c:if test="${shop_review_info.gradeFirst eq '0' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '0' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_half.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						
						<c:if test="${shop_review_info.gradeFirst eq '1' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '1' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_half.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>

						<c:if test="${shop_review_info.gradeFirst eq '2' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '2' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_half.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>

						<c:if test="${shop_review_info.gradeFirst eq '3' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_no.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '3' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_half.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>

						<c:if test="${shop_review_info.gradeFirst eq '4' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_no.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '4' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_half.png" />
						</c:if>

						<c:if test="${shop_review_info.gradeFirst eq '5' and (shop_review_info.gradeLast eq '' or shop_review_info.gradeLast eq '1' or shop_review_info.gradeLast eq '2' or shop_review_info.gradeLast eq '3' or shop_review_info.gradeLast eq '4' )}">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" />
						</c:if>
						<c:if test="${shop_review_info.gradeFirst eq '5' and (shop_review_info.gradeLast eq '5' or shop_review_info.gradeLast eq '6' or shop_review_info.gradeLast eq '7' or shop_review_info.gradeLast eq '8' or shop_review_info.gradeLast eq '9' ) }">
						<img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" /><img src="/src/user/images/common/star_big_full.png" />
						</c:if>
					</p>
	
				</li>
	
				<li>
					<ul class="jumsu">
					<c:forEach items="${shopReviewDetailList}" var="shopReviewDetailList" varStatus="rg">
					<li>${shopReviewDetailList.code_name}<p>${shopReviewDetailList.reviewDetailGrade}<span> / 5</span></p></li>
					</c:forEach>	
					</ul>			
				</li>
	
				<li>
					<ul class="jumsu_star">
					<c:forEach items="${shopReviewGradeList}" var="shopReviewGradeList" varStatus="rg">
						<li>
							${shopReviewGradeList.code_name}<span>
							<c:if test="${shopReviewGradeList.code_name eq '5.0' }">
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							</c:if>
							<c:if test="${shopReviewGradeList.code_name eq '4.0' }">
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							</c:if>
							<c:if test="${shopReviewGradeList.code_name eq '3.0' }">
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							</c:if>
							<c:if test="${shopReviewGradeList.code_name eq '2.0' }">
							<img src="/src/user/images/common/star_gray_single.png" />
							<img src="/src/user/images/common/star_gray_single.png" />
							</c:if>
							<c:if test="${shopReviewGradeList.code_name eq '1.0' }">
							<img src="/src/user/images/common/star_gray_single.png" />
							</c:if>
							</span>
							<strong>
								<fmt:parseNumber var="reviewAvg" integerOnly="true" value="${shopReviewGradeList.gradeCount/shop_review_info.reviewCount*100}"></fmt:parseNumber>
							 	${reviewAvg}%
							</strong>
						</li>
					</c:forEach>	
					</ul>	
					<p class="btn_review"><a href="/user/reviewWrite.do?shopSeq=${shop_info.shop_seq}&userSeq=${userSeq}"><img src="/src/user/images/common/btn_review_write.png" style="width:65px; height:auto;" /></a></p>
				</li>
			</ul>
		</div><!-- end review_wrap //-->

		</c:if>
	</div>
</section>

</div><!-- END wrap//-->
</body>
</html>