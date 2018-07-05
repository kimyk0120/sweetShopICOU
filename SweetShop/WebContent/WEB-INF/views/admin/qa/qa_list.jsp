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

<script>
	var qna_title='${param.qna_title}';
	var qna_writer='${param.qna_writer}';


	var selected_code='${param.qna_type}';;
	var selected_target='${param.qna_target}';
	var selected_status='${param.qna_status}';
	var selected_search_type='${param.qna_search}';


	$(document).ready(function(){

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

		setLayout();
	});

	function setLayout(){

		var index = 0;

		if(selected_target=="S"){
			index = 1;
		}else if(selected_target=="U"){
			index = 2;
		}else{
			index = 0;
		}

		$('.sitem_text_qauser').removeClass('checked');
		$('.radiocls_qauser').removeClass('checked');

		$('.sitem_text_qauser:eq('+index+')').addClass('checked');
		$('.radiocls_qauser:eq('+index+')').addClass('checked');


		if(selected_status=="1"){
			index = 2;
		}else if(selected_status=="0"){
			index = 1;
		}else{
			index = 0;
		}

		$('.sitem_text_qaproc').removeClass('checked');
		$('.radiocls_qaproc').removeClass('checked');

		$('.sitem_text_qaproc:eq('+index+')').addClass('checked');
		$('.radiocls_qaproc:eq('+index+')').addClass('checked');

		if(selected_search_type=="name"){
			index = 1;
		}else{
			index = 0;
		}

		$('.sitem_text').removeClass('checked');
		$('.radiocls').removeClass('checked');

		$('.sitem_text:eq('+index+')').addClass('checked');
		$('.radiocls:eq('+index+')').addClass('checked');
	}

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

	//문의분야
	function setCode(code, codeName){
		selected_code = code;

		$("#code_type").val(codeName);
	}

	//문의자구분
	function setTarget(code){
		console.log(code);

		selected_target = code;
	}
	//진행상태
	function setStatus(code){
		selected_status = code;
	}
	//검색타입(제목/문의자)
	function setSearchType(code){
		selected_search_type = code;
	}

	function search(page){

		var sDateParam=$('#datepicker1').val();
		var eDateParam=$('#datepicker2').val();
		var url= "/qa_list.do?start_date="+sDateParam+"&end_date="+eDateParam+"&page="+page
			+"&qna_target="+selected_target+"&qna_status="+selected_status+"&qna_type="+selected_code;


		if(selected_search_type == ""){
			url+="&qna_title="+$('#search_input').val()+"&qna_search=title";
		}else{
			url+="&qna_writer="+$('#search_input').val()+"&qna_search=name";
		}
		
		$(location).attr('href',url);
	}
</script>

<body>
<div id="wrap">
<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
	<c:param name="index" value="4" />
</c:import>

<div id="container" >

	<div class="page_guide page_guide_04">
		가맹점ㆍ손님의 문의를 관리하기 위해<br /><span>조회ㆍ수정ㆍ답변</span>이 가능한 페이지입니다.
	</div>

<!-- 리스트 상단 검색 시작 //-->

	<div class="qa_search_process" >
		<span class="tit">진행상태</span>
		<span class="sitem_list" onclick="setStatus('')">
			<span class="designRadio_qaproc"><span class="radiocls_qaproc radio"></span></span>
			<input id="li01" class="chkclass iRadio" type="radio" name="sex" value="전체" />
			<label for="li01" class="sitem_text_qaproc">전체</label>
		</span>
		<span class="sitem_list" onclick="setStatus(0)">
			<span class="designRadio_qaproc"><span class="radiocls_qaproc radio"></span></span>
			<input id="li02" class="iRadio" type="radio" name="sex" value="처리중" />
			<label for="li02" class="sitem_text_qaproc">처리중</label>
		</span>
		<span class="sitem_list" onclick="setStatus(1)">
			<span class="designRadio_qaproc"><span class="radiocls_qaproc radio"></span></span>
			<input id="li02" class="iRadio" type="radio" name="sex" value="완료" />
			<label for="li02" class="sitem_text_qaproc">완료</label>
		</span>

		<script type="text/javascript">
		$(document).ready(function(){
			/* 선택된값의 value는 _value 에 있음 */

			var _designRadio_qaproc = $('.designRadio_qaproc');
			var _iLabel_qaproc = $('.sitem_text_qaproc');

			$(_iLabel_qaproc).click(function(){

				var _thisRadio_qaproc = $(this).parent().find('> .designRadio_qaproc');
				var _value_qaproc = $(this).parent().find('>input').val();

				$(_designRadio_qaproc).children().removeClass('checked');
				$(_thisRadio_qaproc).children().addClass('checked');
				$(_iLabel_qaproc).removeClass('checked');

				//$(this).removeClass('checked');
				//alert($(this).hasClass("checked"));
				$(this).addClass('checked');

				/*console.log(_value_qaproc);*/
			});

			$(_designRadio_qaproc).click(function(){
				var index = $(_designRadio_qaproc).index(this);

				$('.sitem_text_qaproc').removeClass('checked');
				$('.radiocls_qaproc').removeClass('checked');

				$('.sitem_text_qaproc:eq('+index+')').addClass('checked');
				$('.radiocls_qaproc:eq('+index+')').addClass('checked');

				/*
				var _value = $(this).parent().find('>input').val();
				$(_designRadio).children().removeClass('checked');
				$(this).children().addClass('checked');
				*/
				/*console.log(_value_qaproc);*/
			});
		});
		</script>

		<span class="tit ml100">문의 분야</span>
		<span class="qa_category">
			<input type="text" id="code_type" class="qa_searproc_input_blur" value="전체"  onclick="qa_category(1);" value="전"  >
			<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
			<script type="text/javascript">

			function qa_category(num){
			document.getElementById('qa_category_' + num ).style.display = "";
			}

			</script>


			<div class="qa_cate_type" id="qa_category_1" style="display:none;">
				<ul>
					<li><a href="javascript:setCode('','전체')" class="close_qa">전체</a></li>
					<c:forEach items="${qna_code}" var="qnacode">
						<c:if test="${qnacode.code_id eq param.qna_type}">
							<script>
								setCode('${qnacode.code_id}','${qnacode.code_name}');
							</script>
						</c:if>
						<li><a href="javascript:setCode('${qnacode.code_id}','${qnacode.code_name}')" class="close_qa">${qnacode.code_name}</a></li>
					</c:forEach>
				</ul>
			 </div>
			<script type="text/javascript">
				$(".close_qa").click(function() {
				$("#qa_category_1").css("display","none");
				});

				$qa_category_checking = $("#qa_category_1");
				$qa_category_checking.hover(
					function(){
						$(this).css("display","block");
					},
					function(){
						$(this).css("display","none");
					}
				);
			</script>

		</span>
	</div><!-- END qa_search_process //-->



	<!-- 문의자 구분 //-->
	<div class="qa_search_user">
		<span class="tit">문의자 구분</span>
		<span class="sitem_list" onclick="setTarget('')">
			<span class="designRadio_qauser"><span class="radiocls_qauser radio"></span></span>
			<input id="li01" class="chkclass iRadio" type="radio" name="sex" value="전체" />
			<label for="li01" class="sitem_text_qauser">전체</label>
		</span>
		<span class="sitem_list" onclick="setTarget('S')">
			<span class="designRadio_qauser"><span class="radiocls_qauser radio"></span></span>
			<input id="li02" class="iRadio" type="radio" name="sex" value="가맹점" />
			<label for="li02" class="sitem_text_qauser">가맹점</label>
		</span>
		<span class="sitem_list" onclick="setTarget('U')">
			<span class="designRadio_qauser"><span class="radiocls_qauser radio"></span></span>
			<input id="li02" class="iRadio" type="radio" name="sex" value="손님" />
			<label for="li02" class="sitem_text_qauser">손님</label>
		</span>

		<script type="text/javascript">
		$(document).ready(function(){
			/* 선택된값의 value는 _value 에 있음 */

			var _designRadio_qauser = $('.designRadio_qauser');
			var _iLabel_qauser = $('.sitem_text_qauser');

			$(_iLabel_qauser).click(function(){

				var _thisRadio_qauser = $(this).parent().find('> .designRadio_qauser');
				var _value_qauser = $(this).parent().find('>input').val();

				$(_designRadio_qauser).children().removeClass('checked');
				$(_thisRadio_qauser).children().addClass('checked');
				$(_iLabel_qauser).removeClass('checked');

				//$(this).removeClass('checked');
				//alert($(this).hasClass("checked"));
				$(this).addClass('checked');

				/*console.log(_value_qauser);*/
			});

			$(_designRadio_qauser).click(function(){
				var index = $(_designRadio_qauser).index(this);

				$('.sitem_text_qauser').removeClass('checked');
				$('.radiocls_qauser').removeClass('checked');

				$('.sitem_text_qauser:eq('+index+')').addClass('checked');
				$('.radiocls_qauser:eq('+index+')').addClass('checked');

				/*
				var _value = $(this).parent().find('>input').val();
				$(_designRadio).children().removeClass('checked');
				$(this).children().addClass('checked');
				*/
				/*console.log(_value_qauser);*/
			});
		});
		</script>

		<span class="tit ml100">등록일</span>
		<span class="qa_date">
			<input type="text" id="datepicker1" class="qa_date_input_blur"  readonly="readonly" >
			&nbsp; ~ &nbsp;
			<input type="text" id="datepicker2" class="qa_date_input_blur"  readonly="readonly" >

		</span>
	</div><!-- END qa_search_process //-->






	<div class="top_search_box">
		<fieldset>
		<legend>검색타입선택</legend>
			<span class="sitem_list" onclick="setSearchType('')">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li01" class="chkclass iRadio" type="radio" name="sex" value="제목" />
				<label for="li01" class="sitem_text">제목</label>
			</span>
			<span class="sitem_list" onclick="setSearchType('name')">
				<span class="designRadio"><span class="radiocls radio"></span></span>
				<input id="li02" class="iRadio" type="radio" name="sex" value="문의자" />
				<label for="li02" class="sitem_text">문의자</label>
			</span>
			<p class="sform"><input type="text" id="search_input" class="topSearch_blur" value="${param.qna_title}"><span class="a_area"><a href="javascript:search(1)"></a></span></p>
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
		<col width="15%" />
		<col width="*" />
		<col width="10%" />
		<col width="12%" />
		<col width="10%" />
		<col width="8%" />
		</colgroup>

		<thead>
			<tr>
				<th>문의분야</th>
				<td class="tal">제목</td>
				<td>구분</td>
				<td>문의자</td>
				<td>등록일</td>
				<td>진행상태</td>
			</tr>
		</thead>
		<c:if test="${qna_list.getTotalRow() eq '0'}">
			<tbody class="result">
				<tr>
					<td colspan="7">
						<p><img src="/src/admin/images/board/icon_search_result.png" /></p>
						검색결과가 없습니다.
					</td>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${qna_list.getTotalRow() ne '0'}">
			<tfoot>
				<tr>
					<th colspan="7">
						<ul class="borad_paging">
								<li class="paging_info">${qna_list.getSPage()}-${qna_list.getEPage()}  &nbsp; of &nbsp; ${qna_list.getTotalRow()}</li>
								<li class="paging_first"><a href="javascript:search(${qna_list.getBlockFirstPage()})"><img src="/src/owner/images/board/btn_first.png" /></a></li>
								<li class="paging_prev"><a href="javascript:search(${qna_list.getPrePage()})"><img src="/src/owner/images/board/btn_prev.png" /></a></li>
								<li class="paging_now"><input type="text" placeholder="1"   value="${qna_list.getCurrentPage()}" class="paging" ></li>
								<li class="paging_next"><a href="javascript:search(${qna_list.getNextPage()})"><img src="/src/owner/images/board/btn_next.png" /></a></li>
								<li class="paging_end"><a href="javascript:searchs(${qna_list.getBlockLastPage()})"><img src="/src/owner/images/board/btn_end.png" /></a></li>
							</ul>
					</th>
				</tr>
			</tfoot>
		</c:if>

		<tbody>
			<c:forEach items="${qna_list}" var="bbs_qa_list">
				<tr>
					<th>${bbs_qa_list.qna_type}</th>
					<td class="tal"><a href="/qa_detail.do?qna_seq=${bbs_qa_list.qna_seq}">${bbs_qa_list.qna_title}</a></td>
					<c:set var="qna_target" value="${bbs_qa_list.qna_target}" />
					<c:choose>
						<c:when test="${qna_target eq 'S'}">
							<td>가맹점</td>
						</c:when>
						<c:otherwise>
							<td>유저</td>
						</c:otherwise>
					</c:choose>
					<td>${bbs_qa_list.qna_writer}</td>
					<td><fmt:formatDate value="${bbs_qa_list.qna_reg_date}"/></td>
					<c:set var="qna_status" value="${bbs_qa_list.qna_status}" />
					<c:choose>
						<c:when test="${qna_status eq '1'}">
							<td>완료</td>
						</c:when>
						<c:otherwise>
							<td><span class="process_ing">처리중</span></td>
						</c:otherwise>
					</c:choose>
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


</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>