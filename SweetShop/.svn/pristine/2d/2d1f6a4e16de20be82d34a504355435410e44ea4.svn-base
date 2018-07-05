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
	<title>Shop Owner ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
	<c:import url="/src/owner/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/owner/jsp/include.jsp" charEncoding="UTF-8" />
</head>

<script type="text/javascript">
	$(document).ready(function(){

		var attr = '${pr_list}';

		console.log("=============");
		console.log(attr);
		console.log("=============");

		$( "#datepicker1" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		});

		$( "#datepicker2" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년'
		});

		var sDate='${param.start_date}';
		var eDate='${param.end_date}';


		setDate(sDate, eDate);

		var messageText = "날짜간격";
		$('#dateTerm').val(messageText);
	});

	function setDate(sDate, eDate){
		if(sDate=="" || eDate ==""){
			eDate = new Date();
			sDate = new Date();
			sDate.setDate(eDate.getDate());
			$('#datepicker1').val($.datepicker.formatDate('yy.mm.dd', sDate));
			$('#datepicker2').val($.datepicker.formatDate('yy.mm.dd', eDate));
		}else{
			$('#datepicker1').val(sDate);
			$('#datepicker2').val(eDate);
		}
	}

	function checkDateTerm(date){
		console.log("check : "+date);
		eDate = new Date();
		sDate = new Date();

		sDate.setDate(eDate.getDate() - (date));

		$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
		$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

		var messageText = "최근"+date+"일";
		$('#dateTerm').val(messageText);

		var url = "/pr_event_list.do?start_date="+sDateParam+"&end_date="+eDateParam+"&event_name="+$('#search_input').val()+"&page="+page;
		$(location).attr('href',url);
	}
</script>
<script>
	function movePage(seq){
		var url = "/pr_event_modify.do?event_seq="+seq;
		$(location).attr('href',url);
	}


	function search(page){
		var sDateParam=$('#datepicker1').val();
		var eDateParam=$('#datepicker2').val();
		var url = "/pr_handbill_list.do?start_date="+sDateParam+"&end_date="+eDateParam+"&promotion_name="+$('#search_input').val()+"&page="+page;
		$(location).attr('href',url);
	}
</script>
<body>
<div id="wrap">

<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="6" />
</c:import>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="6" />
	</c:import>


	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_02.png" alt=""  /><span>홍보ㆍ마케팅 상품 &nbsp; &gt; &nbsp; </span> 홍보전단</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>현재 우리가게 홍보전단 현황을 한눈에 확인하실 수 있습니다.</span></li>
			</ul>
			<ul>
				<li class="searchzone">
					<span class="dash_category">
						<input type="text" id="dateTerm" class="dash_searproc_input_blur" onclick="dash_category(1);" value="최근1일" title="카테고리 선택"  >
						<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
						<script type="text/javascript">
						<!--
						function dash_category(num){
						document.getElementById('dash_category_' + num ).style.display = "";
						}
						//-->
						</script>
						<div class="dash_cate_type" id="dash_category_1" style="display:none;">
							<ul>
								<li><a href="javascript:checkDateTerm(1)" class="close_dash">최근1일</a></li>
								<li><a href="javascript:checkDateTerm(3)" class="close_dash">최근3일</a></li>
								<li><a href="javascript:checkDateTerm(5)" class="close_dash">최근5일</a></li>
								<li><a href="javascript:checkDateTerm(7)" class="close_dash">최근7일</a></li>
								<li><a href="javascript:checkDateTerm(10)" class="close_dash">최근10일</a></li>
							</ul>
						 </div>
						<script type="text/javascript">
							$(".close_dash").click(function() {
							$("#dash_category_1").css("display","none");
							});

							$dash_category_checking = $("#dash_category_1");
							$dash_category_checking.hover(
								function(){
									$(this).css("display","block");
								},
								function(){
									$(this).css("display","none");
								}
							);
						</script>
					</span>


					<span class="seach_date">
						<input type="text" id="datepicker1" class="seach_date_input_blur" onclick="seach_date(1);" readonly="readonly"
								value="2016.06.4" title="시작일 선택" > &nbsp; ~ &nbsp;
						<input type="text" id="datepicker2" class="seach_date_input_blur" onclick="seach_date(2);" readonly="readonly"
								value="2016.06.11"  title="종료일 선택">
					</span>

					<p class="sform"><input type="text" id="search_input" class="topSearch_blur" value="${param.promotion_name}">
					<span class="a_area"><a href="javascript:search(1)"></a></span></p>
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
		<div class="cont_area">
			<table id="bbs_list_table" class="table">
			<colgroup>
			<col width="*" />
			<col width="*" />
			<col width="*" />
			<col width="*" />
			<col width="*" />
			</colgroup>

				<thead>
					<tr>
						<th class="first">등록일</th>
						<th>진행상태</th>
						<th>홍보전단 이미지</th>
						<th class="tar">기간</th>
						<th class="tar last">성과보기</th>
					</tr>
				</thead>
				<c:if test="${pr_list.getTotalRow() eq '0'}">
					<tbody class="result">
						<tr>
							<td colspan="7">
								<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
								검색결과가 없습니다.
							</td>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${pr_list.getTotalRow() ne '0'}">
					<tfoot>
						<tr>
							<th colspan="7">
								<ul class="borad_paging">
									<li class="paging_info">${pr_list.getSPage()}-${pr_list.getEPage()}  &nbsp; of &nbsp; ${pr_list.getTotalRow()}</li>
									<li class="paging_first"><a href="javascript:search(${pr_list.getBlockFirstPage()})"><img src="/src/owner/images/board/btn_first.png" /></a></li>
									<li class="paging_prev"><a href="javascript:search(${pr_list.getPrePage()})"><img src="/src/owner/images/board/btn_prev.png" /></a></li>
									<li class="paging_now"><input type="text" placeholder="1"   value="${pr_list.getCurrentPage()}" class="paging" ></li>
									<li class="paging_next"><a href="javascript:search(${pr_list.getNextPage()})"><img src="/src/owner/images/board/btn_next.png" /></a></li>
									<li class="paging_end"><a href="javascript:search(${pr_list.getBlockLastPage()})"><img src="/src/owner/images/board/btn_end.png" /></a></li>
								</ul>
							</th>
						</tr>
					</tfoot>
				</c:if>

				<c:forEach items="${pr_list}" var="prList">
					<tbody>
						<tr>
							<th><fmt:formatDate value="${prList.reg_date}" type="both" pattern="yyyy.MM.dd"/></th>
							<c:set var="status" value="${prList.promotion_status}" />
							<c:choose>
								<c:when test="${status eq '0'}">
									<td class="process_ing">진행중</td>
								</c:when>
								<c:otherwise>
									<td class="process_end">종료</td>
								</c:otherwise>
							</c:choose>

							<td class="subject"><a href="/pr_handbill_modify.do?promotion_seq=${prList.promotion_seq}"><span><img src="${prList.img_path}" onError="this.src='/src/owner/images/contents/noimg_4545.png';"  style="width:60px; height:auto; margin-right:15px;" ></span>${prList.promotion_detail_desc}</a></td>
							<td class="ev_date">${prList.promotion_start_day}~${prList.promotion_end_day}</td>
							<td class="report"><span><a href="/pr_handbill_index.do?promotion_seq=${prList.promotion_seq}"><img src="/src/owner/images/contents/icon_report.png" /></a></span></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>

		<div class="list_btm_more_area">
			<p class="mo_gotop"><a href="#"><img src="/src/owner/images/contents/btn_mobile_gotop.png" /></a></p>
			<p class="more_green"><a href="/pr_handbill_regis.do"><img src="/src/owner/images/contents/btn_more_plus.png" /></a></p>
		</div>








	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->




<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />













</div><!-- END wrap//-->
</body>
</html>