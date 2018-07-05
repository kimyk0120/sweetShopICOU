<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!--> <html>         <!--<![endif]-->
<head>
<title>Super Admin ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />
</head>
<script type="text/javascript">
	var notice_target;
	$(document).ready(function(){

		notice_target='${param.notice_target}';
		var keyword='${param.notice_title}';

		var index =0;

		if(notice_target == "A"){
			index=0;
		}else if(notice_target == "S"){
			index=1;
		}else if(notice_target == "U"){
			index=2;
		}else{
			index=0;
		}

		$('.sitem_text').removeClass('checked');
		$('.radiocls').removeClass('checked');

		$('.sitem_text:eq('+index+')').addClass('checked');
		$('.radiocls:eq('+index+')').addClass('checked');
	});

	function search(page){
		var url = "/notice_list.do?page="+page+"&notice_target="+notice_target+"&notice_title="+$("#search_input").val();
		$(location).attr('href',url);
	}
</script>
<body>
<div id="wrap">
<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
	<c:param name="index" value="3" />
</c:import>


<div id="container" >

	<div class="page_guide page_guide_03">
		가맹점ㆍ손님을 위한 공지사항을 관리하기 위해<br /><span>조회ㆍ수정ㆍ등록</span>이 가능한 페이지입니다.
	</div>

<!-- 리스트 상단 검색 시작 //-->
	<div class="top_search_box">
		<fieldset>
		<legend>검색타입선택</legend>
			<span class="sitem_list">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li01" class="iRadio radio1" type="radio" name="sex" value="전체" />
				<label for="li01" class="sitem_text radio1">전체</label>
			</span>
			<span class="sitem_list">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li02" class="iRadio radio2" type="radio" name="sex" value="가맹점" />
				<label for="li02" class="sitem_text radio2">가맹점</label>
			</span>
			<span class="sitem_list">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li03" class="iRadio radio3" type="radio" name="sex" value="손님" />
				<label for="li03" class="sitem_text radio3">손님</label>
			</span>
			<p class="sform"><input type="text" id="search_input" class="topSearch_blur" value="${param.notice_title}"><span class="a_area" ><a href="javascript:search(1)"></a></span></p>
		</fieldset>

	<script type="text/javascript">
		$(document).ready(function(){
			/* 선택된값의 value는 _value 에 있음 */

			var _designRadio = $('.designRadio');
			var _iLabel = $('.sitem_text');
			//$(_designRadio).children().removeClass('checked');

			$(_iLabel).click(function(){

				var _thisRadio = $(this).parent().find('> .designRadio');
				var _value = $(this).parent().find('>input').val();

				$(_designRadio).children().removeClass('checked');
				$(_thisRadio).children().addClass('checked');
				$(_iLabel).removeClass('checked');

				//$(this).removeClass('checked');
				//alert($(this).hasClass("checked"));
				$(this).addClass('checked');

				/*console.log(_value);*/
			});

			$(_designRadio).click(function(){
				var index = $(_designRadio).index(this);

				if(index == 0){
					notice_target = "A";
				}else if(index == 1){
					notice_target = "S";
				}else if(index == 2){
					notice_target = "U";
				}else{
					notice_target = "A";
				}

				$('.sitem_text').removeClass('checked');
				$('.radiocls').removeClass('checked');

				$('.sitem_text:eq('+index+')').addClass('checked');
				$('.radiocls:eq('+index+')').addClass('checked');

				/*
				var _value = $(this).parent().find('>input').val();
				$(_designRadio).children().removeClass('checked');
				$(this).children().addClass('checked');
				*/
				/*console.log(_value);*/
			});
		});

	$("#search_input").focus(function() {
		$(this).attr('class','topSearch_focus');
	});
	$("#search_input").blur(function() {
		$(this).attr('class','topSearch_blur');
	});
	</script>
</div>
<!-- 리스트 상단 검색 끝 //-->




	<!-- 리스트 테이블 시작 //-->
	<table class="table_list mb80">
		<colgroup>
		<col width="80px" />
		<col width="611px" />
		<col width="80px" />
		<col width="80px;" />
		</colgroup>

		<thead>
			<tr>
				<th>공지대상</th>
				<td class="tal">제목</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<c:if test="${notice_list.getTotalRow() eq '0'}">
			<tbody class="result">
				<tr>
					<td colspan="7">
						<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
						검색결과가 없습니다.
					</td>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${notice_list.getTotalRow() ne '0'}">
			<tfoot>
				<tr>
					<th colspan="7">
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
		<tbody>
		<c:forEach items="${notice_list}" var="notice_list">
			<tr>
				<c:set var="notice_target" value="${notice_list.notice_target}" />
				<c:choose>
					<c:when test="${notice_target eq 'A'}">
						<th>전체</th>
					</c:when>
					<c:when test="${notice_target eq 'S'}">
						<th>가맹점</th>
					</c:when>
					<c:when test="${notice_target eq 'U'}">
						<th>손님</th>
					</c:when>
					<c:otherwise>
						<th>전체</th>
					</c:otherwise>
				</c:choose>
				<td class="subject"><a href="/notice_detail.do?notice_seq=${notice_list.notice_seq}">${notice_list.notice_title}</a></td>
				<td><fmt:formatDate value="${notice_list.reg_date}"/></td>
				<td>${""+notice_list.notice_view_count}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<script type="text/javascript">
	$(".paging").focus(function() {
		$(this).css("color","#000");
	});
	$(".paging").blur(function() {
		$(this).css("color","#ff6600");
	});
	</script>
	<!-- 리스트 테이블 끝 //-->


	<div class="btn_plus_area">
		<a href="/notice_write.do"><img src="/src/admin/images/common/btn_more.png" /></a>
	</div>



</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>