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
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />
<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<script  src="/src/user/js/jquery-1.11.3.min.js"></script>
<script  src="/src/user/js/default.js"></script>
<script type="text/javascript">
$(function(){
	
	
	//init
	$(".btn_qa_write,#noticeTitleText").hide();
	
	// default 공지사항
	var fromQnaReg = '${fromQnaReg}';
	
	if(!fromQnaReg){
		$("#tap1").load("/user/notice.do",function(view){
			$(this).html(view);
			$("#notice").addClass("on");
			$("#qna").removeClass("on");
		});
	}else{
		$("#tap1").load("/user/qna.do",function(view){
			$(".btn_qa_write,#noticeTitleText").show();
			$(this).html(view);
			$("#qna").addClass("on");
			$("#notice").removeClass("on");
		});
		
	}
	
	
	// 스크롤 로드
	$(window).scroll(function(){
 		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if($(window).scrollTop() == $(document).height() - $(window).height()){
        	
			var btn_reflash_height = $("#btn_reflash").height();
			var document_height =  $(document).height();
			
			// 로딩 이미지 위치
			// 공지사항일때
			if($("#notice").hasClass("on")){
				
				var position_y = document_height - 130;
			
			}else{ // 문의하기일때
				
				var position_y = document_height - 170;
			}
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
        	page++;
        	lastPostFunc(page);
		}
	}); 
	
	
	// 메뉴 ( 공지사항 문의사항)선택시
	$("div.notice_menu li").on("click",function(e){
		
		var selected_id =  $(this).attr("id"); 
		//console.log("selected_id : ", selected_id);
		
		// 공지사항 선택시
		if(selected_id=="notice"){
			//console.log($(this).hasClass("on"));
			
			if($(this).hasClass("on")){
				$(this).next().removeClass("on");
				
			}else{
				$(this).addClass("on");
				$(this).next().removeClass("on");
				$("#tap1").load("/user/notice.do",function(view){
					$(".btn_qa_write,#noticeTitleText").hide();
					$(this).html(view);
				});
			}
			
			
		// 문의사항 선택시	
		}else if(selected_id=="qna"){

			if($(this).hasClass("on")){
				$(this).prev().removeClass("on");
				
			}else{
				$(this).addClass("on");
				$(this).prev().removeClass("on");
				
				$("#tap1").load("/user/qna.do",function(view){
					$(".btn_qa_write,#noticeTitleText").show();
					$(this).html(view);
				});
				
			}
			
		}
	});
	
	
})// endDomReady
</script>
<style type="text/css">
	#notice, #qna{cursor: pointer;}
</style>
</head>
<body >
<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="./images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>공지 및 문의</li>
			<li></li>
		</ul>
	</header> -->

<section class="sub_content_wrap_wide mt10">
	<div class="notice_menu">
		<ul>
			<li  id="notice"><a >공지사항</a></li>
			<li  id="qna"><a >문의하기</a></li>
		</ul>	
		<p id="noticeTitleText">나의 문의 내역</p>
	</div>
	
	<!-- 페이지 로드 영역 -->
	<div id="tap1"></div>

	<!-- 페이지 로드 영역 -->
	<!-- <div id="tap2"></div> -->

	<div class="btn_qa_write"><a href="/user/qnaRegist.do?userSeq=${userSeq}"><img src="/src/user/images/common/btn_review_write.png" style="width:65px; height:auto;" /></a></div>

</section><!-- END sub_content_wrap_wide//-->

</div><!-- END wrap//-->
</body>
</html>