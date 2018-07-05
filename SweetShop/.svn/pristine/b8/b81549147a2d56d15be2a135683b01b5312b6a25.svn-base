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
	
		$("#btn_reflash").hide();
	//		console.log("$(.board_list).height() : " , $(".board_list").height() );
		if($(".board_list").height()>=720){
			$("body").css("height","auto");			
		}else{
			$("body").css("height",$(window).height()+"px");
		}
	
	var page = 0;
	$(window).scroll(function(){
	//		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
	    if  ($(window).scrollTop() == $(document).height() - $(window).height()){
	    	var document_height =  $(document).height();
	    	
	    	// 로딩 이미지 위치
			var position_y = document_height - 90;
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
	    	
	    	page++;
	    	lastPostFunc(page);
	//     	console.log("page : " , page);
		}
	}); 
	
	function lastPostFunc(page){
		
		console.log("page : " , page);
		//$("div #plus_loading").fadeIn("fast");
		$.ajax({
			  method: "GET",
			  url: "/user/qnaScrollLoad.do",
			  data: { "page": page},
		}).done(function(result){
	//			console.log(result)
			//$("div#plus_loading").fadeOut("fast");
			$("#btn_reflash").fadeOut("fast");
			$(".board_list").append(result);
		});
		
	};
	

})//.domReady
</script>
<style>
	html {height:auto;}
	dl:ACTIVE {
	background-color: white;
}
	#wrap_wide{
	padding-bottom: 0%;
}
</style>
</head>
<body >

<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	 <!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="/src/user/images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>공지 및 문의</li>
			<li></li>
		</ul>
	</header>  -->

<section class="sub_content_wrap_wide mt10">
	
	<!-- <div class="notice_menu">
		<ul>
			<li><a href="/user/notice.do">공지사항</a></li>
			<li class="on"><a href="/user/qna.do">문의하기</a></li>
		</ul>	
		<p>나의 문의 내역</p>
	</div> -->

	<div class="board_list">
		<c:if test="${empty qnaList}">
			<dl>
				<dt>문의사항이 없습니다.</dt>
			</dl>
		</c:if>
		<c:forEach items="${qnaList}" var="ql">
		<dl>
			<dt><a href="/user/qnaDetail.do?seq=${ql.qna_seq}">
			<c:if test="${ql.qna_status=='0' or ql.qna_status==null or ql.qna_status=='' }">
				<span class="ing">[처리중]</span>
			</c:if>			
			<c:if test="${ql.qna_status=='1'}">
				<span class="end">[완료]</span>
			</c:if>			
			${ql.qna_title}</a></dt>
			<fmt:formatDate value="${ql.qna_reg_date}" pattern="yyyy.MM.dd" var="dateParse"/>
			<dd><c:out value="${dateParse}"></c:out></dd>
		</dl>
		</c:forEach>
	</div>

	<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>
	<div class="btn_qa_write"><a href="/user/qnaRegist.do"><img src="/src/user/images/common/btn_review_write.png" style="width:65px; height:auto;" /></a></div>
	<!-- <div id="lastPostsLoader"><div id='plus_loading' class='hc vc' style="display: none;"><img src='/src/user/images/common/img_loading.gif' /></div></div> -->
</section><!-- END sub_content_wrap_wide//-->
	
	<!-- 스크롤 하단 찾기위한 여유공간 //-->
	<!-- <div style="height:50px; width:100%;"></div> --> 
		<!-- 최하단 스크롤 마지막에 나오는 아이콘 부분 //-->
</div><!-- END wrap//-->
</body>
</html>