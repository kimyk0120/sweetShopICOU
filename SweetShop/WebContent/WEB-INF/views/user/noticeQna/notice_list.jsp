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
// 		console.log("$(.board_list).height() : " , $(".board_list").height() );
		if($(".board_list").height()>=720){
			$("body").css("height","auto");			
		}else{
			$("body").css("height",$(window).height()+"px");
		}
	
	var page = 0;
	$(window).scroll(function(){
 		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if($(window).scrollTop() == $(document).height() - $(window).height()){
        	
			var btn_reflash_height = $("#btn_reflash").height();
			var document_height =  $(document).height();
			
			//console.log("btn_reflash_height : " , btn_reflash_height);
			//console.log("document_height : " , document_height);
			
			var position_y = document_height - 80;
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
        	page++;
        	lastPostFunc(page);
		}
	});  
	
	function lastPostFunc(page){
		
		console.log("page : " , page);
		
		$("div #plus_loading").fadeIn("fast");
		$.ajax({
			  method: "GET",
			  url: "/user/noticeScrollLoad.do",
			  data: { "page": page}
		}).done(function(result){
// 			console.log(result)
			//$("div#plus_loading").fadeOut("fast");
			
			$("#btn_reflash").fadeOut("fast");
			$(".board_list").append(result);
		});
		
	};
	
})//.domready	
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
<!-- 	<header class="sub"> -->
<!-- 		<ul> -->
<!-- 			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="/src/user/images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li> -->
<!-- 			<li>공지 및 문의</li> -->
<!-- 			<li></li> -->
<!-- 		</ul> -->
<!-- 	</header> -->

<section class="sub_content_wrap_wide mt10">
	
	<!-- <div class="notice_menu">
		<ul>
			<li class="on"><a href="/user/notice.do">공지사항</a></li>
			<li><a href="/user/qna.do">문의하기</a></li>
		</ul>		
	</div> -->
	
	<div class="board_list">
		<c:choose>
			<c:when test="${empty noticeList}">
				<dl>
					<dt>공지사항이 없습니다.</dt>
				</dl>
			</c:when>
			<c:otherwise>
				<c:forEach items="${noticeList}" var="nl">
					<dl>
						<dt id="${nl.notice_seq}"><a href="noticeDetail.do?seq=${nl.notice_seq}">${nl.notice_title}</a></dt>
						<fmt:formatDate value="${nl.reg_date}" pattern="yyyy.MM.dd" var="dateParse"/>
						<dd><c:out value="${dateParse}"></c:out></dd>
					</dl>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 백그라운드그라디언트 때문에 공백싸이즈 임의로 줌 -->
	<!-- <div id="lastPostsLoader"><div id='plus_loading' class='hc vc' style="display: none;"><img src='/src/user/images/common/img_loading.gif' /></div></div> -->

	<!-- 최하단 스크롤 마지막에 나오는 아이콘 부분 //-->
	<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>	
</section><!-- END sub_content_wrap_wide//-->
</div><!-- END wrap//-->
</body>
</html>
