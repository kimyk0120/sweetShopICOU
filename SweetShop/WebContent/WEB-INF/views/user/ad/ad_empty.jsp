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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script  src="/src/user/js/default.js"></script>

<!-- 상단 기본 메뉴 좌우 스와이프 //-->
<link rel="stylesheet" href="/src/user/css/swiper.min.css">

<!-- 상단 좌측 슬라이드 판넬 메뉴 //-->
<link rel="stylesheet" href="/src/user/css/pushy.css">

</head>

<body >
<div id="wrap" >

	<div id="container"><!-- 판넬메뉴 오픈시 옆 이동을 위한 박스 공간 - 영역 없음 //-->
	

	<section class="list_main_wrap">
		
	<div class="evre_nothing pt50">
		<img src="/src/user/images/common/icon_icou_noevent.png" style="width:30px; height:auto;" />
		<p><span>아이쿠!<br />받은 홍보전단이 없습니다.</span><br /><br />알람을 켜고 다양한<br />홍보전단을 받아 보세요!</p>
	</div>

		
	</section>

	</div><!-- END container//-->

</div><!-- END wrap//-->
</body>
</html>