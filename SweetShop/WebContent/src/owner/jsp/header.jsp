<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모바일 좌측 메뉴 오픈 구성 //-->
<script type="text/javascript" src="/src/owner/js/jquery.mmenu.all.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function( $ ) {
       $("#menu").mmenu({
           "slidingSubmenus": false,
           "extensions": [
            "pagedim-black"
            ]
         });


       $( "#search_input" ).on( "keydown", function(event) {
       	console.log("down");
           if(event.which == 13) {
           	console.log("enter");
           	search(1);
           }
       });
     });


 </script>

 <script>
 	//공통스크립트
 	function brChange(str){
		var regex = /<br\s*[\/]?>/gi;
		return str.replace(regex, "\n");
	}

	function newLineChange(str){
		return str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	}

	function spaceChange(str){
		var regex = /<br\s*[\/]?>/gi;
		return str.replace(/(?:\r\n|\r|\n)/g, ' ');
	}
 </script>


<!-- 스킵 버튼 //-->
<div id="skipnavigation">
    <p>메뉴 건너뛰기</p>
    <a href="#content_area">본문으로 바로가기</a>
    <a href="#gnb_web">주메뉴로 바로가기</a>
</div><!-- END : id : skipnavigation -->
<hr/>

<c:set var="selected_tab" value="${param.index}" />

<div id="header">

	<!-- 모바일일때 우측 메뉴 아이콘 노출 //-->
	<div class="gnb_mobile" >
		<!-- 모바일일때 상단 뒤로가기 버튼  //-->
		<!--
		<a  href="javascript:top.history.go(-1);"><img src="/src/owner/images/common/btn_back.png" alt="뒤로가기" /></a>
-->

		<!-- 모바일일때 상단 메뉴 버튼  //-->

		<a  href="#menu"><img src="/src/owner/images/common/btn_gnb_mobile.png" alt="메뉴보기" /></a>

		<nav id="menu">
			<ul>
				<li class="gnb_bg01"><a href="/dashboard.do">Dashboard</a></li>
				<li class="gnb_bg02"><a href="#">통계분석</a>
					<ul>
						<li><a href="/analy_customer.do">고객분석</a></li>
						<li><a href="/analy_review.do">리뷰분석</a></li>
						<li><a href="/analy_visiter.do">홈페이지 방문자 분석</a></li>
					</ul>
				</li>
				<li class="gnb_bg03"><a href="#">홍보ㆍ마케팅 상품</a>
					<ul>
						<li><a href="/pr_event_list.do">이벤트</a></li>
						<li><a href="/pr_handbill_list.do">홍보전단</a></li>
						<li><a href="/pr_shopcard.do">가게명함</a></li>
					</ul>
				</li>
				<li class="gnb_bg04"><a href="#">가게홈페이지 관리</a></li>
				<li class="gnb_bg05"><a href="#">사장님 커뮤니티</a></li>
				<li class="gnb_bg06"><a href="#">공지 및 문의</a>
					<ul>
						<li><a href="/bbs_notice_list.do">공지사항</a></li>
						<li><a href="/bbs_qa_list.do">문의하기</a></li>
					</ul>
				</li>
			</ul>
		</nav>

	</div>
	<!-- 모바일일때 우측 메뉴 아이콘 노출 끝 //-->


	<h1><a href="#">UNTITLED</a></h1>


	<!-- 웹 일때 오픈 //-->
	<div class="log_info" >
		<a href="#" id="logbtn" onclick="go_loginfo(1);"><span class="log_text">다시 뵙게되어 반갑습니다. <strong><c:out value="${sessionScope.name}" /></strong> 님</span> <img src="/src/owner/images/common/icon_loginfo_more.png" alt="더 보기"></a>
	</div>

	<!-- 모바일 일때 오픈 사용안함
	<div class="log_info_mobile" >
		<a href="#" id="logbtn" onclick="go_loginfo(1);" ><img src="/src/owner/images/common/icon_loginfo_more_mobile.png" /></a>
	</div>
	//-->


	<script type="text/javascript">
	$('#logbtn').click(function() {
	  $('#go_loginfo_1').toggle('slow', function() {
		// Animation complete.
	  });
	});
	</script>
	<div id="go_loginfo_1"  style="display:none;">
	<div class="arrow"></div>
		<ul>
			<li><a href="/mypage_modify.do"><img src="/src/owner/images/common/icon_meminfo.png" alt="" />회원 정보</a></li>
			<li><a href="/logout.do"><img src="/src/owner/images/common/icon_logout.png" alt="" />로그아웃</a></li>
		</ul>
	</div>

	<script type="text/javascript">
		$suggest_checking = $("#go_loginfo_1");
		$suggest_checking.hover(
		function(){
				$(this).css("display","block");
			},
				function(){
				$(this).css("display","none");
			}
		);
	</script>


</div><!-- END header//-->


