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
		var obj = '${bbs_qa_list}';
		console.log(obj);
	});


	function search(page){
		var url = "/bbs_qa_list.do?page="+page+"&qna_comment="+$("#search_input").val();
		$(location).attr('href',url);
	}

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
		<h3><img src="/src/owner/images/contents/h3_img_06.png" alt=""  /><span>공지 및 문의하기 &nbsp; &gt; &nbsp; </span> 문의하기</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>문의사항 조회ㆍ수정ㆍ답변이 가능한 페이지입니다.</span></li>
			</ul>
			<ul>
				<li class="searchzone">
					<p class="sform"><input type="text" id="search_input" class="topSearch_blur"  value="${param.qna_comment}"><span class="a_area"><a href="javascript:search(1)"></a></span></p>
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






		<div class="cont_area cont_bbs_area">
			<table id="bbs_list_table" class="table">
			<colgroup>
			<col width="*" />
			<col width="*" />
			<col width="*" />
			<col width="*" />
			</colgroup>

				<thead>
					<tr>
						<th class="first">진행상태</th>
						<th>제목</th>
						<th class="tar">등록일</th>
						<th class="tar last">문의분야</th>
					</tr>
				</thead>
				<c:if test="${bbs_qa_list.getTotalRow() eq '0'}">
					<tbody class="result">
						<tr>
							<td colspan="4">
								<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
								검색결과가 없습니다.
							</td>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${bbs_qa_list.getTotalRow() ne '0'}">
					<tfoot>
						<tr>
							<th colspan="4">
							<ul class="borad_paging">
								<li class="paging_info">${bbs_qa_list.getSPage()}-${bbs_qa_list.getEPage()}  &nbsp; of &nbsp; ${bbs_qa_list.getTotalRow()}</li>
								<li class="paging_first"><a href="javascript:search(${bbs_qa_list.getBlockFirstPage()})"><img src="/src/owner/images/board/btn_first.png" /></a></li>
								<li class="paging_prev"><a href="javascript:search(${bbs_qa_list.getPrePage()})"><img src="/src/owner/images/board/btn_prev.png" /></a></li>
								<li class="paging_now"><input type="text" placeholder="1"   value="${bbs_qa_list.getCurrentPage()}" class="paging" ></li>
								<li class="paging_next"><a href="javascript:search(${bbs_qa_list.getNextPage()})"><img src="/src/owner/images/board/btn_next.png" /></a></li>
								<li class="paging_end"><a href="javascript:search(${bbs_qa_list.getBlockLastPage()})"><img src="/src/owner/images/board/btn_end.png" /></a></li>
							</ul>
							</th>
						</tr>
					</tfoot>
				</c:if>
				<c:forEach items="${bbs_qa_list}" var="bbs_qa_list">
					<tbody class="bgcolor">
						<tr>
							<c:set var="qna_status" value="${bbs_qa_list.qna_status}" />
							<c:choose>
								<c:when test="${qna_status eq '1'}">
									<td class="process_end qa_first">완료</td>
								</c:when>
								<c:otherwise>
									<td class="process_ing_orange qa_first">처리중</td>
								</c:otherwise>
							</c:choose>
							<td class="subject"><a href="/bbs_qa_view.do?qna_seq=${bbs_qa_list.qna_seq}">${bbs_qa_list.qna_title}</a></td>
							<td class="ev_date"><fmt:formatDate value="${bbs_qa_list.qna_reg_date}"/></td>
							<td class="report">${bbs_qa_list.qna_type}</td>
						</tr>
					</tbody>
				</c:forEach>

			</table>
		</div>

		<div class="list_btm_more_area">
			<p class="mo_gotop"><a href="/bbs_qa_regis.do"><img src="/src/owner/images/contents/btn_mobile_gotop.png" /></a></p>
			<p class="more_green"><a href="/bbs_qa_regis.do"><img src="/src/owner/images/contents/btn_more_plus.png" /></a></p>
		</div>






	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->




<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />













</div><!-- END wrap//-->
</body>
</html>