<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="selected_tab" value="${param.index}" />

<!-- 960 이상 웹 화면시 좌측 메뉴 구성 부분 시작 //-->
	<div id="gnb_web">

		<ul class="gnb_dropdown">

		 <li class="gnb_web_bg01"><a class="dashboard" href="/dashboard.do">Dashboard</a></li>

		 <li class="gnb_web_bg02">
			<a class="anal" href="#">통계분석</a>
				<ul>
					<li <c:if test="${selected_tab eq '2'}">class="on"</c:if> ><a class="depth2" href="/analy_customer.do">고객분석</a></li>
					<li <c:if test="${selected_tab eq '3'}">class="on"</c:if> ><a class="depth2" href="/analy_review.do">리뷰분석</a></li>
				</ul>
	      </li>
		  <li class="gnb_web_bg03">
			<a class="pr" href="#">홍보ㆍ마케팅 상품</a>
				<ul>
					<li <c:if test="${selected_tab eq '5'}">class="on"</c:if> ><a class="depth2" href="/pr_event_list.do">이벤트</a></li>
					<li <c:if test="${selected_tab eq '6'}">class="on"</c:if> ><a class="depth2" href="/pr_handbill_list.do">홍보전단</a></li>
					<li <c:if test="${selected_tab eq '7'}">class="on"</c:if> ><a class="depth2" href="/pr_shopcard.do">가게 명함</a></li>
				</ul>
	      </li>
	      <!--
		  <li class="gnb_web_bg04"><a class="homepage" href="#">가게 홈페이지 관리</a></li>
		  <li class="gnb_web_bg05"><a class="owner" href="#">사장님 커뮤니티</a></li>
		   -->
		  <li class="gnb_web_bg06">
			<a class="notice" href="#">공지 및 문의</a>
				<ul>
					<li <c:if test="${selected_tab eq '10'}">class="on"</c:if> ><a class="depth2" href="/bbs_notice_list.do">공지사항</a></li>
					<li <c:if test="${selected_tab eq '11'}">class="on"</c:if> ><a class="depth2" href="/bbs_qa_list.do">문의하기</a></li>
				</ul>
	      </li>
	    </ul>

	    <script src="/src/owner/js/tendina.js"></script>
	    <script>
	    var menu;
	    var selected_tab = ${selected_tab};
	    if(selected_tab == 1){
	    	menu = '.dashboard';
	    }else if(selected_tab == 2 | selected_tab == 3 | selected_tab == 4 ){
	    	menu = '.anal';
	    }else if(selected_tab == 5 | selected_tab == 6 | selected_tab == 7 ){
	    	menu = '.pr';
	    }else if(selected_tab == 8 ){
	    	menu = '.homepage';
	    }else if(selected_tab == 9 ){
	    	menu = '.owner';
	    }else if(selected_tab == 10 | selected_tab == 11 | selected_tab == 12 ){
	    	menu = '.notice';
	    }
	      $('.gnb_dropdown').tendina({
	        animate: true,
	        speed: 700,
	        onHover: false,
	        hoverDelay: 300,

	        activeMenu: $(menu),
	        openCallback: function(clickedEl) {
	          console.log('open!');
	        },
	        closeCallback: function(clickedEl) {
	          console.log('close');
	        }
	      })
	    </script>

	</div><!-- END gnb_web//-->
	<!-- 960 이상 웹 화면시 좌측 메뉴 구성 부분 끝//-->