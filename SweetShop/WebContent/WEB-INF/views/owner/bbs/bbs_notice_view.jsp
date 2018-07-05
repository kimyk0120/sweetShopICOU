<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<head>
	<title>Shop Owner ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
	<c:import url="/src/owner/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/owner/jsp/include.jsp" charEncoding="UTF-8" />
</head>
<script>
	$(document).ready(function(){
		var obj = '${notice_detail}';
		var pre = '${notice_pre}';
		var next = '${notice_next}';
		console.log("============================");
		console.log(obj);
		console.log("============================");
		console.log(pre);
		console.log("============================");
		console.log(next);
	});

</script>
<body>
<div id="wrap">

<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="10" />
</c:import>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="10" />
	</c:import>



	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_06.png" alt=""  /><span>공지 및 문의 &nbsp; &gt; &nbsp; </span> 공지사항</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>공지사항을 조회 할 수 있습니다.</span></li>
			</ul>
			<ul>
				<li class="searchzone">
				</li>
			</ul>
		</div><!-- END guide_area //-->





		<!-- 콘텐츠 시작 //-->
		<div class="cont_area">

			<div class="bbs_head">
				${notice_detail.notice_title}
			</div>
			<div class="garo_line_wide"></div>
			<div class="update">등록일 <fmt:formatDate value="${notice_detail.reg_date}"/> &nbsp;&nbsp; 조회수 ${notice_detail.notice_view_count}</div>

			<div class="bbs_content">
				${notice_detail.notice_comment}
			</div>

			<div class="garo_line_wide mt20 mb20"></div>

			<div class="bbs_btn_area">
				<p class="golist"><a href="/bbs_notice_list.do">목록</a></p>
			</div>

			<div class="prevnext_area">
				<ul>
					<li class="prev"><a href="/bbs_notice_view.do?notice_seq=${notice_pre.notice_seq}"><span>이전글</span>${notice_pre.notice_title}</a></li>
					<c:choose>
						<c:when test="${notice_next.notice_title eq null}">
							<li class="next"><a href="/bbs_notice_view.do?notice_seq=${notice_next.notice_seq}"><span>다음글</span><p>다음글이 없습니다.</p></a></li>
						</c:when>
						<c:otherwise>
							<li class="next"><a href="/bbs_notice_view.do?notice_seq=${notice_next.notice_seq}"><span>다음글</span>${notice_next.notice_title}</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>




			</div>



	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->




<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />













</div><!-- END wrap//-->
</body>
</html>