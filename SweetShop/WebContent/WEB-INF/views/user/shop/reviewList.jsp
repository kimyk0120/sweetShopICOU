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
<!--[if gt IE 8]><!--> <html>         <!--<![endif]-->
<head>
<title>전체리뷰보기</title>

<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/user/jsp/include.jsp" charEncoding="UTF-8" />

<script>
var totalCount = ${shopReviewListCount} ;
var page = 0 ; 
$(document).ready(function(){
	
	//init
	$("#btn_reflash").hide();
	
	if($(".sub_content_wrap").height()>=720){
		$("html").css("height","inherit");
	}else{
		$("html").css("height","");			
	}
	
	
	// 처음 로딩
	getRevieList();

	// 스크롤 로딩
	$(window).scroll(function() {
		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){
        	var btn_reflash_height = $("#btn_reflash").height();
			var document_height =  $(document).height();

			var position_y = document_height - 80;
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
        	page++;
        	lastPostFunc(page);
		}
	});
	
	function lastPostFunc(page){

		var ordVal =  $("#ord").val();
		var shopSeq =  $("#shopSeq").val();
		
		console.log("page : " , page);
		console.log("ordVal : " , ordVal);
		
		$.ajax({
			  method: "GET",
			  url: "/user/reviewListUnit.do", 
			  data: { "page": page,"ord":ordVal,"shopSeq":shopSeq}
		}).done(function(result){
			//console.log(result)
			$("#btn_reflash").fadeOut("fast");
			$("#reviewList").append(result);
			//$("#reviewList").append("<h1>test</h1>");
		});
	};
	
	
});//endDomReady



// 리뷰리스트 temp 로딩
function getRevieList() {
	var shopSeq = ${shopSeq} ;
	$.ajax({
		type: "POST",
		url: "/user/reviewListUnit.do?",	
		data: "shopSeq="+shopSeq+"&ord=" +document.getElementById("ord").value+"&page="+page ,
		success: function(data) {
			//alert(data);
			document.getElementById("reviewList").innerHTML = data;
		}
	});
}

function reRoadReview() {
		
	window.location = "/user/reviewList.do?shopSeq="+${shopSeq}+"&ord="+document.getElementById("ord").value ;
}

function listOnOff(ts) {
	if( $(ts).hasClass("on") ){
		list_fold( $(ts) );
	}else{
		list_fold( $(".accorion_row") );
		list_unfold( $(ts) );
	}
}

function list_fold( obj ){
	obj.removeClass("on");
	obj.find(".review_r p").addClass("over_1line");	
	obj.find(".review_r span").addClass("over_2line");
	obj.css({"height":"70px"})	
}

function list_unfold( obj ){			
	obj.find(".review_r p").removeClass("over_1line");	
	obj.find(".review_r span").removeClass("over_2line");
	setTimeout(function(){
		var hl = obj.find(".review_l").innerHeight();	
		var hr = obj.find(".review_r").innerHeight();	
		var maxH = Math.max( hl, hr );
		//console.log(hl, hr, maxH )
		obj.find(".review_l").css({"height":maxH})	;
		obj.find(".review_r").css({"height":maxH})	;
		obj.css({"height":maxH});
	}, 100);
	
	obj.addClass("on");	
}


</script>
<style type="text/css">
	div.deatil_review_wrap > ul > li:nth-child(3){padding:10px 0px;}
	div.deatil_review_wrap > ul > li:nth-child(3) > ul.jumsu_star > li{font-size: 11px;}
</style>
</head>

<body >
<input type="hidden" value="${shopSeq}" id="shopSeq">
<!-- 로딩 이미지 -->
<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>
<p class="btn_review2"><a href="/user/reviewWrite.do?shopSeq=${shopSeq}&userSeq=${userSeq}"><img src="/src/user/images/common/btn_review_write.png" style="width:65px; height:auto;" /></a></p>


<div id="wrap_wide" >

<section class="sub_content_wrap_wide">
	<!-- 리뷰 디자인 시작 //-->
	<div class="deatil_review_wrap">
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
			</li>
		</ul>
	</div><!-- end review_wrap //-->
</section>


<section class="sub_content_wrap">
	
	<div class="choice_filet">
		<select class="review_filter" id="ord" name="ord" onchange="javascript:reRoadReview();">
		<c:if test="${ord eq 'rgDt' }">
			<option value="rgDt" selected>최신등록순</option>
		</c:if>
		<c:if test="${ord ne 'rgDt' }">
			<option value="rgDt" >최신등록순</option>
		</c:if>

		<c:if test="${ord eq 'mxGd' }">
			<option value="mxGd" selected>높은 평점순</option>
		</c:if>
		<c:if test="${ord ne 'mxGd' }">
			<option value="mxGd" >높은 평점순</option>
		</c:if>

		<c:if test="${ord eq 'mnGd' }">
			<option value="mnGd" selected>낮은 평점순</option>
		</c:if>
		<c:if test="${ord ne 'mnGd' }">
			<option value="mnGd" >낮은 평점순</option>
		</c:if>
		
		</select>
	</div>
	
	
	<!-- 리뷰리스트 로딩영역 -->	
	<div id="reviewList"></div>

</section>

</div><!-- END wrap//-->
</body>
</html>
