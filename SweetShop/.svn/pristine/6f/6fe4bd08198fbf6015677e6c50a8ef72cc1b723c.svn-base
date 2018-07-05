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
	<c:import url="/src/owner/jsp/chart.jsp" charEncoding="UTF-8" />
</head>


<script type="text/javascript">

	$(document).ready(function(){

		var attr2 = '${shop_review_count}';
		var attr3 = '${shop_review_avg}';
		var attr4 = '${shop_review_avg_date}';

		var attr6 = '${shop_review_gender}';
		var attr7 = '${shop_review_age}';
		var attr8 = '${shop_review_visit}';

		var attr9 = '${shop_review_visit_date}';
		var attr10 = '${shop_review_visit_detail}';


		console.log("=============");
		console.log(attr2);
		console.log(attr3);
		console.log(attr4);
		console.log(attr6);
		console.log(attr7);
		console.log(attr8);
		console.log(attr9);
		console.log(attr10);
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
		    yearSuffix: '년',
		    onSelect: function (dateText, inst) {
		    	search();
	    	}
		});

		var sDate='${param.start_date}';
		var eDate='${param.end_date}';

		setDate(sDate, eDate);

	});

	function setDate(sDate, eDate){
		if(sDate=="" || eDate ==""){
			eDate = new Date();
			sDate = new Date();
			sDate.setDate(eDate.getDate()-7);
			$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
			$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

			var messageText = "최근7일";
			$('#dateTerm').val(messageText);
		}else{

			var arr1 = sDate.split('-');
			var arr2 = eDate.split('-');
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			var diff = dat2 - dat1;
			var currDay = 24*60*60*1000;

			$('#datepicker1').val(sDate);
			$('#datepicker2').val(eDate);


			var messageText = "최근"+(parseInt(diff/currDay))+"일";
			$('#dateTerm').val(messageText);
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

		search();
	}

	function search(){
		var sDateParam=$('#datepicker1').val();
		var eDateParam=$('#datepicker2').val();
		var url = "/analy_review.do?start_date="+sDateParam+"&end_date="+eDateParam;
		$(location).attr('href',url);
	}
</script>
<script>

//차트초기화
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(initDrawChart);

// 차트가 리사이즈 될때 차트를 다시 그려주는 구문
$(window).resize(function() {
    if(this.resizeTO) clearTimeout(this.resizeTO);
    this.resizeTO = setTimeout(function() {
        $(this).trigger('resizeEnd');
    }, 500);
});

$(window).on('resizeEnd', function() {
	console.log("resoze");
	initDrawChart();
});
//// 차트가 리사이즈 될때 차트를 다시 그려주는 구문 end

//차트 그리는 부분
function initDrawChart() {
	drawPointChart('view_point_chart', '${shop_review_avg_date}', "special_point_view");
	drawVisitChart('view_visit_chart', '${shop_review_visit_date}', "special_visit_view");
	drawGenderChart('view_gender_donut', '${shop_review_gender}', "special_gender_view");
	drawAgeChart('view_age_donut','${shop_review_age}', "special_age_view");
	drawTypeChart('view_type_donut','${shop_review_visit}', "special_type_view");
	drawDetailChart('view_detail_culumn','${shop_review_visit_detail}', "special_detail_view");
}



//파이챠트의 옵션을 세팅해주는 부분 / 타입별로 구분
function optionTypeChart(index, tag, type){
	switch(type){
		case "special_gender_view":
			return options_view_gender_pie(index, tag);
		case "special_age_view":
			return optionDrawViewAgeChart(index, tag);
		case "special_type_view":
			return optionDrawViewTypeChart(index, tag);
	}

	return options;
}

function responseData(type, maxField, maxData, minField, minData){
	console.log(type+",  "+maxField+",  "+maxData+",  "+minField+",  "+minData);
	switch(type){
		case "special_gender_view":
			var tag = "<span class='orange'><strong>"+maxField+"</strong></span>의 리뷰 등록 비율은 <strong>"+maxData+"%</strong>로, "+minField+"보다 "+(maxData-minData).toFixed(1)+"% <span class='orange'><strong>높습니다.</strong></span>";
			$("#gender_text").html(tag);
			break;
		case "special_age_view":
			var tag = "<span class='orange'><strong>"+maxField+"</strong></span>의 리뷰 등록 비율이 <strong>"+maxData+"%</strong>로 가장 <span class='orange'><strong>많으며,</strong></span> <span class='orange'><strong>"+minField+"</strong></span>의 리뷰등록 비율은 "+minData+"로 가장 <span class='orange'><strong>낮습니다.</strong></span>";
			$("#age_text").html(tag);
			break;
		case "special_type_view":
			var tag = "<span class='orange'><strong>"+maxField+" 유형</strong></span> 방문객  리뷰 등록이 <strong>"+maxData+"%</strong>로 <span class='orange'><strong>가장 많으며</strong></span>, <span class='orange'><strong>"+minField+" 유형 방문객</strong></span> 리뷰등록은 "+minData+"%로 <span class='orange'><strong>가장 낮습니다.</strong></span>";
			$("#type_text").html(tag);
			break;
		case "special_visit_view":
			var tag = maxField;
			$("#visit_text").html(tag);
			break;
		case "special_detail_view":
			var tag;
			if(maxField != ""){
				tag = "고객님의 상점은<strong class='blue'>'"+maxField+"'</strong>가(이) <strong class='blue'>우수</strong>하며,";
				$("#nice_detail").html(tag);
			}

			if(maxData != ""){
				var tag_data = $("#nice_detail").html();

				if(tag_data.length <= 0){
					tag = "고객님의 상점은<strong class='blue'>'"+maxData+"'</strong>가(이) <strong>적정</strong>합니다.";
					$("#nice_detail").html(tag);
				}else{
					tag = "''"+maxData+"'</strong>은 <strong>적정</strong>합니다.";
					$("#nice_detail").append(tag);
				}
			}

			/* <strong>'서비스, 시설'</strong>은(는) <strong>적정</strong>합니다. */

			if(minField != ""){
				tag = "고객님의 상점은<strong class='orange'>'"+minField+"'</strong>의 <strong class='orange'>개선</strong>이 필요합니다.";
				$("#bad_detail").html(tag);
			}

			break;
	}


}


function setColumnPointChart(){
	pointChart_dt.addColumn('string', 'rs_date');
	pointChart_dt.addColumn('number', 'review_grade');
}

function setColumnVisitChart(){
	visitChart_dt.addColumn('string', 'rs_date');
	visitChart_dt.addColumn('number', 'review_count');
}


//라인 차트 내부의 값 패턴 세팅
function getChartPointObject(obj){
	return [obj.rs_date, parseInt(obj.review_grade)];
}

//라인 차트 내부의 값 패턴 세팅
function getChartVisitObject(obj){
	return [obj.rs_date, parseInt(obj.review_count)];
}

function optionDrawViewDetailChart(max, min , tag){
	var sliceObject = {
	         0: { color: '#b5b5b5' },
	         1: { color: '#b6b6b6' },
	         2: { color: '#a9a9a9' },
	         3: { color: '#dfdddd' },
	         4: { color: '#f4f4f4' }
	     }
}

function optionDrawViewTypeChart(index, tag){
	var sliceObject = {
         0: { color: '#b5b5b5' },
         1: { color: '#b6b6b6' },
         2: { color: '#a9a9a9' },
         3: { color: '#dfdddd' },
         4: { color: '#f4f4f4' }
     }

	sliceObject[index].color = '#ff8500';

	var options = {
			//legend:'none',
	 		pieHole: 0.6,
	 		pieSliceTextStyle: {
	             color: 'white',
	         },
	         pieSliceText: 'none',
	 		slices:sliceObject
	};
	tag = "<font color='#ff8500'>"+tag+"</font>";
	$('#view_type_center').html(tag);
	return options;
}


function options_view_gender_pie(index, tag){
	var sliceObject = {
             0: { color: '#d4d4d4' },
             1: { color: '#d4d4d4' }
         }
	sliceObject[index].color = '#ff8500';

	var options = {
			//legend:'none',
	 		pieHole: 0.6,
	 		pieSliceTextStyle: {
	             color: 'white',
	         },
	         pieSliceText: 'none',
	 		slices: sliceObject
	};
	tag = "<font color='#ff8500'>"+tag+"</font>";
	$('#view_gender_center').html(tag);
	return options;
}

function optionDrawViewAgeChart(index, tag){
	var sliceObject = {
         0: { color: '#b5b5b5' },
         1: { color: '#b6b6b6' },
         2: { color: '#a9a9a9' },
         3: { color: '#dfdddd' },
         4: { color: '#f4f4f4' },
         5: { color: '#d4d4d4' }
     }

	sliceObject[index].color = '#ff8500';

	var options = {
			//legend:'none',
	 		pieHole: 0.6,
	 		pieSliceTextStyle: {
	             color: 'white',
	         },
	         pieSliceText: 'none',
	 		slices:sliceObject
	};
	tag = "<font color='#ff8500'>"+tag+"</font>";
	$('#view_age_center').html(tag);
	return options;
}

</script>
<body>


<div id="wrap">



<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="3" />
</c:import>



<div id="container">
	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="3" />
	</c:import>



	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_02.png" alt=""  /><span>통계분석 &nbsp; &gt; &nbsp; </span> 리뷰 분석</h3>


		<div class="guide_area">
			<ul>
				<li class="guide_wid"><span>등록된 리뷰에 대한 분석을 확인하실 수 있습니다.</span></li>
				<li>
					<span class="dash_category">
						<input type="text" id="dateTerm" class="dash_searproc_input_blur" onclick="dash_category(1);" value="" title="카테고리 선택"  >
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
								<li><a href="javascript:checkDateTerm(7)" class="close_dash">최근7일</a></li>
								<li><a href="javascript:checkDateTerm(10)" class="close_dash">최근10일</a></li>
								<li><a href="javascript:checkDateTerm(30)" class="close_dash">최근30일</a></li>
								<li><a href="javascript:checkDateTerm(90)" class="close_dash">최근90일</a></li>
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
						<input type="text" id="datepicker1" class="seach_date_input_blur" readonly="readonly"
							 value="2016.06.4" title="시작일 선택" > &nbsp; ~ &nbsp;
						<input type="text" id="datepicker2"  class="seach_date_input_blur" value="2016.06.11"  readonly="readonly"  title="종료일 선택">
					</span>
				</li>
			</ul>
		</div><!-- END guide_area //-->





		<!-- 리뷰 데이터 //-->
		<div class="dash_review_area">
			<ul>
				<li>
					<p class="text">리뷰등록<br /><strong>건수</strong></p>
					<p class="number orange"><strong>${shop_review_count}</strong>명</p>
				</li>
				<!-- 위치 문제로 웹에서는 이부분이 노출됨 //-->
				<li class="web">
					<p class="text">
					 <strong>일별</strong> 리뷰 <strong>평점 추이</strong>
					</p>
					<div class="graph_img mt70">

						<div id="view_point_chart" style="width: 100%; height: 200px;"></div>
					</div>
				</li>
				<li>
					<p class="star">
						<c:set var="value" value="${shop_review_avg}" />
						<c:forEach var="index" begin="0" end="4" step="1" >
							<c:set var="full_star" value="${4.9 - index}" />
							<c:set var="half_star" value="${4.4 - index}" />
							<c:choose>
								<c:when test="${value ge full_star}">
									<img src="/src/owner/images/contents/star_full.png" />
								</c:when>
								<c:when test="${value ge half_star}">
									<img src="/src/owner/images/contents/star_half.png" />
								</c:when>
								<c:otherwise>
									<img src="/src/owner/images/contents/star_null.png" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</p>
					<p class="text">리뷰 <strong>평점</strong></p>
					<p class="number blue"><strong>${shop_review_avg}</strong>점</p>
				</li>
				<!-- 위치 문제로 모바일에서느 이부분이 노출 됨 //-->
				<li class="mobile">
					<p class="text">
					<span><strong class="blue">3월 26일</strong>과, <strong class="blue">3월 30일</strong>에는 전일 대비 리뷰 평점이 크게 <strong class="blue">상승</strong>하였습니다.</span> <br />
					 <strong>일별</strong> 리뷰 <strong>평점 추이</strong>
					</p>
					<div class="graph_img mt90">
						<img src="/src/owner/images/contents/@graph_04.png"  alt="" />
					</div>
				</li>
			</ul>
		</div>



		<!-- 중간 3칸 짜리 //-->
		<div class="rev_counter_area">
			<ul>
				<li>
					<p class="guide_text" id="gender_text"></p>
					<p class="tit"><strong>성별</strong> 리뷰 <strong>등록</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="view_gender_donut" style="width: 100%; height: 200px;"></div>
						<div id="view_gender_center" style="position:absolute;top:180px;left:34%;"></div>
					</div>
				</li>
				<li>
					<p class="guide_text" id="age_text"></p>
					<p class="tit"><strong>연령별</strong> 리뷰 <strong>등록</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="view_age_donut" style="width: 100%; height: 200px;"></div>
						<div id="view_age_center" style="position:absolute;top:180px;left:34%;"></div>
					</div>
				</li>
				<li>
					<p class="guide_text" id="type_text"></p>
					<p class="tit"><strong>방문유형별</strong> 리뷰 <strong>등록</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="view_type_donut" style="width: 100%; height: 200px;"></div>
						<div id="view_type_center" style="position:absolute;top:180px;left:34%;"></div>
					</div>
				</li>

			</ul>
		</div>




		<!-- 방문 시기별 리뷰 등록 수 //-->
		<div class="time_graph">
			<p class="text">
				<span><strong class="blue" id="visit_text"></strong> 방문객의 리뷰 등록이 가장 <strong class="blue">많습니다.</strong></span> <br />
				<strong>방문 시기별</strong> 리뷰 <strong>등록 수</strong>
			</p>
			<div class="graph_img mt30">
				<div id="view_visit_chart" style="width: 100%; height: 200px;"></div>
			</div>
		</div>


		<!-- 세부 항목별 평점 //-->
		<div class="time_graph">
			<p class="text">
				<span id="nice_detail"></span> <br />
				<span id="bad_detail"></span> <br />
				<strong>세부 항목별</strong> 평점
			</p>
			<div class="graph_img mt30">
				<div id="view_detail_culumn" style="width: 100%; height: 200px;"></div>
			</div>
		</div>






	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->




<div id="footer">
© Sweet K. All Rights Reserved.
</div>













</div><!-- END wrap//-->
</body>
</html>