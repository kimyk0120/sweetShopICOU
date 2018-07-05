<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				이벤트 등록 어떻게 하나요? 제목 두줄 세줄 이상 등에 사용 가능하도록 등록일 문의자 카테고리는 하단으로 적용해서 긴글의 문의 제목이 나와도 레이아웃 깨지지 않도록 처리 한 구성입니다.
			</div>
			<div class="garo_line_wide"></div>
			<div class="qa_update">등록일 2016.06.12 &nbsp;&nbsp; <span>문의자 홍길동 &nbsp;&nbsp; </span>| &nbsp;&nbsp; 서비스 이용 </div>

			<div class="bbs_qa_content">
				이벤트는 어디서 등록을 하면 되는 건가요?<br />
등록 후 확인은 어디서 하면 되는 건지도 궁금합니다~<br /><br />

답변 부탁 드려요~
			</div>

			<div class="garo_line_wide mt20 mb20"></div>

			<div class="bbs_qa_head_reply">
			<div class="bbs_qa_head_reply_date">등록일 2016.06.12 &nbsp;&nbsp;  관리자</div>
				반갑습니다. 홍길동 회원님.<br />
UNTITLED의 관리자입니다.<br /><br />

문의하신 이벤트 등록은 <br />
이렇게 하시면 됩니다.<br /><br />

감사합니다.<br /><br />

좋은 하루 되세요. ^  ^
			</div>




			<div class="garo_line_wide mt20 mb20"></div>

			<div class="bbs_btn_area">
				<p class="golist"><a href="#">목록</a></p>
			</div>


			<div class="prevnext_area">
				<ul>
					<li class="prev"><a href="#"><span>이전글</span>시스템 점검 안내</a></li>
					<li class="next"><a href="#"><span>다음글</span><p>다음글이 없습니다.</p></a></li>
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