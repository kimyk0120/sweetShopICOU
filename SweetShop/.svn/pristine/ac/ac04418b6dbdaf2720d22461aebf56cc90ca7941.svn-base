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
		var obj = '${qna_detail}';
		var obj2 = '${qna_answer}';
		var pre = '${qna_pre}';
		var next = '${qna_next}';
		console.log("============================");
		console.log(obj);
		console.log("============================");
		console.log(obj2);
		console.log("============================");
		console.log(pre);
		console.log("============================");
		console.log(next);
	});

</script>
<body>
<div id="wrap">

<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="12" />
</c:import>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="12" />
	</c:import>



	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_06.png" alt=""  /><span>공지 및 문의 &nbsp; &gt; &nbsp; </span> 문의하기</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>문의사항 조회ㆍ수정ㆍ답변이 가능한 페이지입니다.</span></li>
			</ul>
			<ul>
				<li class="searchzone">


					<p class="sform"><input type="text" id="search_input" class="topSearch_blur"><span class="a_area"><a href="#"></a></span></p>
						<script type="text/javascript">
							$("#search_input").focus(function() {
								$(this).attr('class','topSearch_focus');
							});
							$("#search_input").blur(function() {
								$(this).attr('class','topSearch_blur');
							});
						</script>
				</li>
			</ul>
		</div><!-- END guide_area //-->





		<!-- 콘텐츠 시작 //-->
		<div class="cont_area">

			<div class="bbs_qa_head">
				${qna_detail.qna_title}
			</div>
			<div class="garo_line_wide"></div>
			<div class="qa_update">등록일 <fmt:formatDate value="${qna_detail.reg_date}"/> &nbsp;&nbsp; <span>문의자 ${qna_detail.qna_writer} &nbsp;&nbsp; </span>| &nbsp;&nbsp; ${qna_detail.code_name} </div>

			<div class="bbs_qa_content">
				${qna_detail.qna_comment}
			</div>

			<div class="garo_line_wide mt20 mb20"></div>

			<div class="bbs_qa_head_reply">
				<c:choose>
					<c:when test="${qna_answer eq null}">
						<div class="bbs_qa_reply_none">
							<img src="/src/owner/images/contents/qa_reply_icon.png" alt="" />
							<p><strong>답변 처리 중</strong>입니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="bbs_qa_head_reply_date">등록일 <fmt:formatDate value="${qna_answer.qna_edit_date}"/> &nbsp;&nbsp;  관리자</div>
							${qna_answer.qna_title}
							<br/><br/><br/>
							${qna_answer.qna_comment}
							<br/><br/>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="garo_line_wide mt20 mb20"></div>

			<div class="bbs_btn_area">
				<p class="golist"><a href="/bbs_qa_list.do">목록</a></p>
			</div>


			<div class="prevnext_area">
				<ul>
					<li class="prev"><a href="/bbs_qa_view.do?qna_seq=${qna_pre.qna_seq}"><span>이전글</span>${qna_pre.qna_title}</a></li>
					<c:choose>
						<c:when test="${qna_next.qna_title eq null}">
							<li class="next"><a href="/bbs_qa_view.do?qna_seq=${qna_next.qna_seq}"><span>다음글</span><p>다음글이 없습니다.</p></a></li>
						</c:when>
						<c:otherwise>
							<li class="next"><a href="/bbs_qa_view.do?qna_seq=${qna_next.qna_seq}"><span>다음글</span>${qna_next.qna_title}</a></li>
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