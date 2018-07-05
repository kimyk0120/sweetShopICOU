<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<script type="text/javascript">

		var selected_search_type = '${param.searchType}';
		$(document).ready(function(){






			var attr = '${shop_list}';
			console.log("=============");
			console.log(attr);


			/* 선택된값의 value는 _value 에 있음 */

			var _designRadio = $('.designRadio');
			var _iLabel = $('.sitem_text');
			var index=0;
			if(selected_search_type == "num"){
				index = 1;
			}

			$('.sitem_text:eq('+index+')').addClass('checked');
			$('.radiocls:eq('+index+')').addClass('checked');

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

	function dateFomat(d){
		return d+"z";
	}

	function pageLoad(seq){
		console.log("seq ? " + seq);
		var form = document.createElement("form");
	    form.setAttribute("action", "/owner_detail.do");
	    form.setAttribute("method", "post");

	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "shop_seq");
        hiddenField.setAttribute("value", seq);

        form.appendChild(hiddenField);

	    document.body.appendChild(form);
	    form.submit();
	}

	function search(page){
		var url= "/owner_list.do?page="+page+"&searchType="+selected_search_type;
		if(selected_search_type == ""){
			url+="&shop_name="+$("#search_input").val();
		}else{
			url+="&shop_reg_number="+$('#search_input').val();
		}
		$(location).attr('href',url);
	}

	function setSearchType(code){
		selected_search_type=code;
	}
</script>
<body>
<div id="wrap">

<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
	<c:param name="index" value="1" />
</c:import>


<div id="container" >

	<div class="page_guide">
		사장님들의 가맹점을 관리하기 위해<br /><span>조회ㆍ수정ㆍ등록</span>이 가능한 페이지입니다.
	</div>

<!-- 리스트 상단 검색 시작 //-->
	<div class="top_search_box">
		<fieldset>
		<legend>검색타입선택</legend>
			<span class="sitem_list" onclick="setSearchType('name')">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li01" class="chkclass iRadio" type="radio" name="sex" value="개인회원" />
				<label for="li01" class="sitem_text">가맹점</label>
			</span>
			<span class="sitem_list" onclick="setSearchType('num')">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li02" class="iRadio" type="radio" name="sex" value="기업회원" />
				<label for="li02" class="sitem_text">사업자등록번호</label>
			</span>
			<p class="sform"><input type="text" id="search_input" class="topSearch_blur"
				value="${param.shop_name}${param.shop_reg_number}"><span class="a_area"><a href="javascript:search(1)"></a></span></p>
		</fieldset>


</div>
	<!-- 리스트 상단 검색 끝 //-->
	<table class="table_list mb80">
		<colgroup>
		<col width="*" />
		<col width="14%" />
		<col width="13%" />
		<col width="10%" />
		<col width="15%" />
		<col width="12%" />
		<col width="10%" />
		</colgroup>

		<thead>
			<tr>
				<th>가맹점명</th>
				<td>사업자등록번호</td>
				<td>가맹점ID</td>
				<td>업종</td>
				<td>대표자</td>
				<td>지역</td>
				<td>등록일</td>
			</tr>
		</thead>
		<c:if test="${shop_list.getTotalRow() eq '0'}">
			<tbody class="result">
				<tr>
					<td colspan="5">
						<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
						검색결과가 없습니다.
					</td>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${shop_list.getTotalRow() ne '0'}">
			<tfoot>
				<tr>
					<th colspan="7">
						<ul class="borad_paging">
								<li class="paging_info">${shop_list.getSPage()}-${shop_list.getEPage()}  &nbsp; of &nbsp; ${shop_list.getTotalRow()}</li>
								<li class="paging_first"><a href="javascript:search(${shop_list.getBlockFirstPage()})"><img src="/src/owner/images/board/btn_first.png" /></a></li>
								<li class="paging_prev"><a href="javascript:search(${shop_list.getPrePage()})"><img src="/src/owner/images/board/btn_prev.png" /></a></li>
								<li class="paging_now"><input type="text" placeholder="1"   value="${shop_list.getCurrentPage()}" class="paging" ></li>
								<li class="paging_next"><a href="javascript:search(${shop_list.getNextPage()})"><img src="/src/owner/images/board/btn_next.png" /></a></li>
								<li class="paging_end"><a href="javascript:search(${shop_list.getBlockLastPage()})"><img src="/src/owner/images/board/btn_end.png" /></a></li>
						</ul>
					</th>
				</tr>
			</tfoot>
		</c:if>


		<tbody>
			<c:forEach items="${shop_list}" var="shopList">
			<c:set var="addr" value="${shopList.shop_addr1}"/>
			<c:set var="addrArr" value="${fn:split(addr,' ')}"/>

			<tr>
				<th><a href="javascript:pageLoad(${shopList.shop_seq})">${shopList.shop_name}</th>
				<td>${shopList.shop_tel}</td>
				<td>${shopList.id}</td>
				<td>${shopList.code_name}</td>
				<td>${shopList.shop_owner_name}</td>
				<td>${addrArr[0]} ${addrArr[1]}</td>
				<td><fmt:formatDate value="${shopList.shop_reg_date}" type="both" pattern="yyyy.MM.dd"/></td>
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
		<a href="/owner_regis.do"><img src="/src/admin/images/common/btn_more.png" /></a>
	</div>



</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>