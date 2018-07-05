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
<link rel="shortcut icon" type="image/x-icon" href="">

<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<script  src="/src/user/js/jquery-1.11.3.min.js"></script>
<script  src="/src/user/js/default.js"></script>
<script type="text/javascript">
$(function(){
	
	// 알림 선택시 - 알림 설정 페이지로 이동
	$("#alarm").on("click",function(){
		$(location).attr("href","/user/alarm.do");
	});
	
	// 앱정보 선택시 - 앱 정보 페이지로 이동
	/* $("#appVersion").on("click",function(){
	    alert("페이지 준비중");
		//$(location).attr("href","");
	}); */
	
})//endDomReady
</script>
<style type="text/css">
	#appVersion > dl > dd{
		background : url("");
	}
	#appVersionText{padding-right : 0em;color: #ff8b72;}
</style>
</head>

<body >

<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="./images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>설정</li>
			<li></li>
		</ul>
	</header> -->

<section class="sub_content_wrap_wide">
	<div class="setting_list">
		<ul>
			<li>
				<a id="alarm">
					<dl>
						<dt class="title">알림</dt>
						<dd class="on">
						<c:choose>
							<c:when test="${pushSettingYn eq 'Y'}">
								ON
							</c:when>
							<c:otherwise>OFF</c:otherwise>
						</c:choose>
						</dd>
					</dl>		
				</a>
			</li>
			<li>
				<a id="appVersion">
					<dl>
						<dt class="title">앱 정보</dt>
						<dd id="appVersionText">&nbsp;${appVersion}</dd>
					</dl>		
				</a>
			</li>
		</ul>
	</div>
</section>

</div><!-- END wrap//-->
</body>
</html>