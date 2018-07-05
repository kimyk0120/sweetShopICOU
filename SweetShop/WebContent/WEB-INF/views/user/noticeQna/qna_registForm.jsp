<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body >
<input type="hidden" value="${userSeq}" id="userSeq">
<div id="overlay_t"></div> 
<div id="popup_layer_1">
	<div class="layer_padding">
		<div class="pop_title">
			<p>문의하기 등록 완료</p>
			문의내용이 정상적으로 등록되었습니다.
		</div>
	
	</div><!--END layer_padding//-->

	<div class="pop_btm_btn_area">
		<a href="#" class="close">OK</a>
	</div>
</div><!--END popup_layer_1//-->

<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="/src/user/images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>문의하기</li>
			<li></li>
		</ul>
	</header>  -->

<section class="sub_content_wrap mt10">
	<div class="qa_write">
		<ul>
			<li>
				<label for="subject" class="hide">제목</label>
				<input type="text"  id="subject" class="qa_write_input qa_on" placeholder="제목을 입력하세요." >
			</li>
			<li>
				<label for="mjby" class="hide">문의 분야</label>
				<select  id="mjby" class="qa_write_select qa_on" ><!-- 선택 완료시 화살표 색상 변경은 클래스 on 삽입 추가 //-->
					 <option value="0">문의 분야를 선택하세요.</option>
					 <option value="q01">서비스 이용</option>
					 <option value="q02">쿠폰</option>
					 <option value="q03">가입/탈퇴</option>
					 <option value="q04">서비스 불량 신고</option>
					 <option value="q05">기타</option>
				</select>
			</li>
			<li>
				<label for="qa_cont" class="hide">내용</label>
					<textarea id="qa_cont" class="qa_write_textarea qa_on" placeholder="내용을 입력하세요." ></textarea>	
				
				<script type="text/javascript">
					$(document).ready(function() {
						$('.qa_write').on( 'keyup', 'textarea', function (e){
							$(this).css('height', 'auto' );
							$(this).height( this.scrollHeight );
						});
						$('.qa_write').find( 'textarea' ).keyup();
						$('#popup_layer_1, #overlay_t').hide(); 
						
						$("#pdiv").hover(function(){
							$(this).addClass("btn_qa_modify")
						},function(){
							$(this).removeClass("btn_qa_modify")
						});		
						
						$("#registBtn").on("click",function(){
							
							//ajax
							var title = $("#subject").val();
							var mjby = $("#mjby").val();
							var qa_cont = $("#qa_cont").val();
							
							if(title==null||title==""){
								alert("제목을 입력하세요.")
								$("#subject").focus();
								return;
							}
					 		if(mjby=="0"){
								alert("문의분야를 선택하세요.")
								$("#mjby").focus();
								return;
							}
							if(qa_cont==null||qa_cont==""){
								alert("내용을 입력하세요.")
								$("#qa_cont").focus();
								return;
							}
							
							$("#registBtn").fadeOut();
							var userSeq = $("#userSeq").val();
							
							 $.ajax({
								type: "POST",
								url: "/user/qnaRegist.do",
								data:{'qna_title':title,
				                      'qna_type': mjby,
				                      'qna_comment': qa_cont
				                      }
					 		 	}).done(function(status) {
					 		 		
						 			$('#popup_layer_1, #overlay_t').show(); 
									var $layerPopupObj = $('#popup_layer_1');
									var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
									var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
									$layerPopupObj.css({'left':left,'top':top, 'position':'absolute'});
									
								    $('#overlay_t, .close').click(function(e){ 
								        e.preventDefault(); 
								        $('#popup_layer_1, #overlay_t').hide();
								        location.href = "/user/qna.do?userSeq="+userSeq;
//								        location.href = "/user/noticeQnaFrame.do?fromQnaReg=Y&userSeq="+userSeq;
								    });					 			
					 		 }).fail(function(status) {
					 				alert("등록실패");
					 				location.href = "/user/qna.do?userSeq="+userSeq;
	//				 				location.href = "/user/noticeQnaFrame.do?fromQnaReg=Y&userSeq="+userSeq;
					 		 }); 
						});
					});	
				</script>
			</li>
		</ul>
	</div>
	
	<div class="btn_btm_box">
		<p class="btn_qa_regis" id="pdiv"><a href="#" id="registBtn">글 등록</a></p>
	</div>


</section><!-- END sub_content_wrap_wide//-->

</div><!-- END wrap//-->
</body>
</html>