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
	<c:import url="/src/owner/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/owner/jsp/include.jsp" charEncoding="UTF-8" />
</head>
<script type="text/javascript">
	$(document).ready(function(){

	});

	function search(page){
		var url = "/bbs_notice_list.do?page="+page+"&notice_title="+$("#search_input").val();
		$(location).attr('href',url);
	}
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


					<p class="sform"><input type="text" id="search_input" class="topSearch_blur" value="${param.notice_title}"><span class="a_area"><a href="javascript:search(1)"></a></span></p>
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





		<!-- 일별 방문 현황 //-->
		<div class="cont_area cont_bbs_area">
			<table id="bbs_list_table" class="table">
			<colgroup>
			<col width="*" />
			<col width="*" />
			<col width="*" />
			</colgroup>

				<thead>
					<tr>
						<th class="first">제목</th>
						<th class="tar">등록일</th>
						<th class="tar last">조회수</th>
					</tr>
				</thead>
				<c:if test="${notice_list.getTotalRow() eq '0'}">
					<tbody class="result">
						<tr>
							<td colspan="3">
								<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
								검색결과가 없습니다.
							</td>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${notice_list.getTotalRow() ne '0'}">
					<tfoot>
						<tr>
							<th colspan="3">
								<ul class="borad_paging">
									<li class="paging_info">${notice_list.getSPage()}-${notice_list.getEPage()}  &nbsp; of &nbsp; ${notice_list.getTotalRow()}</li>
									<li class="paging_first"><a href="javascript:search(${notice_list.getBlockFirstPage()})"><img src="/src/owner/images/board/btn_first.png" /></a></li>
									<li class="paging_prev"><a href="javascript:search(${notice_list.getPrePage()})"><img src="/src/owner/images/board/btn_prev.png" /></a></li>
									<li class="paging_now"><input type="text" placeholder="1"   value="${notice_list.getCurrentPage()}" class="paging" ></li>
									<li class="paging_next"><a href="javascript:search(${notice_list.getNextPage()})"><img src="/src/owner/images/board/btn_next.png" /></a></li>
									<li class="paging_end"><a href="javascript:search(${notice_list.getBlockLastPage()})"><img src="/src/owner/images/board/btn_end.png" /></a></li>
								</ul>
							</th>
						</tr>
					</tfoot>
				</c:if>

				<c:forEach items="${notice_list}" var="notice_list">
					<tbody>
						<tr>
							<td class="subject first"><a href="/bbs_notice_view.do?notice_seq=${notice_list.notice_seq}">${notice_list.notice_title}</a></td>
							<td class="ev_date evlast"> ${notice_list.reg_date}</td>
							<td class="report notice_hidden">${""+notice_list.notice_view_count}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
</div>


	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->

<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />












</div><!-- END wrap//-->
</body>
</html>