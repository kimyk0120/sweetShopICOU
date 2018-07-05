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
<title>Super Admin ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />
</head>

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
				<input id="li01" class="chkclass iRadio" type="radio" name="sex" value="전체"  />
				<label for="li01" class="sitem_text">전체</label>
			</span>
			<span class="sitem_list">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li02" class="iRadio" type="radio" name="sex" value="가맹점" />
				<label for="li02" class="sitem_text">가맹점</label>
			</span>
			<span class="sitem_list">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li03" class="iRadio" type="radio" name="sex" value="손님" />
				<label for="li03" class="sitem_text">손님</label>
			</span>
			<p class="sform"><input type="text" id="search_input" class="topSearch_blur" value="기룩갸룩"><span class="a_area"><a href="#"></a></span></p>
		</fieldset>

	<script type="text/javascript">
		$(document).ready(function(){
			/* 선택된값의 value는 _value 에 있음 */

			var _designRadio = $('.designRadio');
			var _iLabel = $('.sitem_text');
			//$(_designRadio).children().removeClass('checked');

			/* 체크 항목을 잡기 위한 것 */
			$('.sitem_text:eq(1)').addClass('checked');
			$('.radiocls:eq(1)').addClass('checked');


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

		<tbody class="result">
			<tr>
				<td colspan="4">
					<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
					검색결과가 없습니다.
				</td>
			</tr>
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
		<a href="#"><img src="/src/admin/images/common/btn_more.png" /></a>
	</div>



</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>