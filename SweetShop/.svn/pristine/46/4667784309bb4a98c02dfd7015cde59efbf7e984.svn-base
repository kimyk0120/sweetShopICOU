<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->       <!--<![endif]-->
<head>
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />

<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script  src="/src/user/js/jquery-1.11.3.min.js"></script>
<script  src="/src/user/js/default.js"></script>
<script  src="/src/user/js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var noticeDetail =  '${noticeDetail}';
	//console.log(noticeDetail);
	
	var notice = $.parseJSON(noticeDetail);
	//console.log(notice);
	
	var d=  new Date(notice.REG_DATE);
	var result2 =  $.datepicker.formatDate('yy.mm.dd', d);
	
	$("#title").text(notice.NOTICE_TITLE);
	$("#regDate").text(result2);
	$("#content").text(notice.NOTICE_COMMENT);
	
});
</script>
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


<section class="sub_content_wrap_wide">
	<div class="board_view">
		<dl>
			<dt id="title"></dt>
			<dd id="regDate"></dd>
		</dl>
	</div>
	<div class="board_view_content" id="content">
	</div>
</section><!-- END sub_content_wrap_wide//-->

</div><!-- END wrap//-->
</body>
</html>