<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!--> <html>         <!--<![endif]-->
<head>
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />


<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script  src="/src/user/js/default.js"></script>
</head>

<body >

<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="/src/user/images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>문의하기 상세</li>
			<li></li>
		</ul>
	</header> -->



<section class="sub_content_wrap_wide">
	<div class="qa_view">
		<div class="icon_q"><img src="/src/user/images/common/icon_q.png" style="width:20px; height:auto;" alt="" /></div>
		<dl>
			<dt>${qnaDetail.qna_title}</dt>
			<fmt:formatDate value="${qnaDetail.qna_reg_date}" pattern="yyyy.MM.dd" var="dateParse"/>
			<dd>${dateParse}</dd>
		</dl>
	</div>

<div class="qa_view_content">
	${qnaDetail.qna_comment}
</div>

<c:choose>
<c:when test="${qnaDetail.qna_status=='1'}">
	<div class="qa_view_content_answer">
		<div class="icon_a"><img src="/src/user/images/common/icon_a.png" style="width:20px; height:auto;" alt="" /></div>
			${qnaAnswer.qna_comment}
	</div>
</c:when>
<c:when test="${qnaDetail.qna_status=='0'||qnaDetail.qna_status==null}">
	<div class="qa_view_content_answer_ready">
		<img src="/src/user/images/common/comment.png" style="width:50px; height:auto;" />
		<p><span>아이쿠!</span><br />준비 중 이에요.</p>
	</div>	
</c:when>
</c:choose>
	
	
</section><!-- END sub_content_wrap_wide//-->






</div><!-- END wrap//-->
</body>
</html>