<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!--> <html>         <!--<![endif]-->
<head>
<title>Shop Owner ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />

<!-- 모바일 좌측 메뉴 오픈 구성 //-->
<script type="text/javascript">


    $(document).ready(function(){
		var m = "<c:out value="${msg}"/>";

		if(m != "") {
			alert(m);
		}

	});

	function login() {

		if (mainform.ID.value == "") {
			alert("이메일을 입력해주세요");
			return;
		}

		if (mainform.PWD.value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		}


		document.mainform.action = "login_check.do";
		document.mainform.submit();

	}

	function checkEnterKey(){
		if(event.keyCode==13){login();}
	}

 </script>


</head>

<body>
<div id="wrap">

<div id="header">
	<h1>UNTITLED</h1>


</div><!-- END header//-->
<form id="mainform" name="mainform" action="" method="post">
<div id="login_area" >
	<div class="log_title">
		<img src="/src/admin/images/login/icon_log.png" /><p>Super Admin</p>
	</div>
	<div class="log_box">
		<div class="arrow_top">▲</div>
		<ul>
			<li>안녕하세요.<br /><span class="en_letter">UNTITLED</span> 서비스 이용을 위하여<br /><p><strong>로그인</strong> 해주세요.</p></li>
			<li class="last">
				<input type="text" id="ID" name="ID" class="logbox_blur" placeholder="아이디"  onClick="this.value=''" value="아이디"  >
				<input type="password" id="PWD" name="PWD" class="logbox_blur" placeholder="비밀번호" onkeydown="javascript:checkEnterKey()" onClick="this.value=''" value=""  >
			</li>
		</ul>
		<div class="btn_log_img"><a href="javascript:login()"><img src="/src/admin/images/login/btn_login.png" /></a><!-- CSS로 만들경우 사용 <a href="/src/admin/owner_list.html">로그인</a>//--></div>
	</div>

	<script type="text/javascript">
		$("#log_input_id").focus(function() {
			$(this).attr('class','logbox_focus');
			});
			$("#log_input_id").blur(function() {
				$(this).attr('class','logbox_blur');
		});
		$("#log_input_pw").focus(function() {
			$(this).attr('class','logbox_focus');
			});
			$("#log_input_pw").blur(function() {
				$(this).attr('class','logbox_blur');
		});
	</script>
</div><!-- END container//-->
</form>
</div><!-- END wrap//-->
</body>
</html>