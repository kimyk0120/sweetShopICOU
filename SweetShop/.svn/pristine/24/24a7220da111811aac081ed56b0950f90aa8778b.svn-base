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

	$(document).ready(function(){

		var attr = '${promotion_detail}';
		var attr2 = '${promotion_view_count}';
		var attr3 = '${promotion_down_count}';
		var attr4 = '${promotion_date_chart}';
		var attr6 = '${promotion_time_chart}';
		var attr7 = '${promotion_view_gender_chart}';
		var attr8 = '${promotion_down_gender_chart}';
		var attr9 = '${promotion_view_age_chart}';
		var attr10 = '${promotion_down_age_chart}';
		console.log(attr);
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
		});



	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(initDrawChart);
	function initDrawChart() {
		  drawTimeChart('chart_div_time', '${promotion_time_chart}');
		  drawDateChart('chart_div_date', '${promotion_date_chart}');

		  drawGenderChart('view_gender_donut','${promotion_view_gender_chart}', "gender_view");
		  drawGenderChart('down_gender_donut','${promotion_down_gender_chart}', "gender_down");
		  drawAgeChart('view_age_donut','${promotion_view_age_chart}', "age_view");
		  drawAgeChart('down_age_donut','${promotion_down_age_chart}', "age_down");

		  /* drawViewGenderChart();
		  drawDownGenderChart();
		  drawViewAgeChart();
		  drawDownAgeChart(); */

	}


	//라인 차트 내부의 값 패턴 세팅
	function getChartDateObject(obj){
		return [obj.rs_date, parseInt(obj.view_count),parseInt(obj.down_count), parseInt(obj.use_count) ];
	}

	//라인 차트 내부의 값 패턴 세팅
	function getChartTimeObject(obj){
		return [obj.rs_time, parseInt(obj.view_count),parseInt(obj.down_count), parseInt(obj.use_count) ];
	}

	//시간별 라인차트의 컬럼세팅
	function setColumnTimeChart(){
		timeChart_dt.addColumn('string', 'time');
		timeChart_dt.addColumn('number', 'view');
		timeChart_dt.addColumn('number', 'down');
		timeChart_dt.addColumn('number', 'use');
	}

	//날짜별 라인차트의 컬럼세팅
	function setColumnDateChart(){
		dateChart_dt.addColumn('string', 'X');
		dateChart_dt.addColumn('number', 'view');
		dateChart_dt.addColumn('number', 'down');
		dateChart_dt.addColumn('number', 'use');
	}

	//파이챠트의 옵션을 세팅해주는 부분 / 타입별로 구분
	function optionTypeChart(index, tag, type) {
		switch (type) {
		case "gender_view":
			return options_view_gender_pie(index, tag);
		case "gender_down":
			return options_down_gender_pie(index, tag);
		case "age_view":
			return optionDrawViewAgeChart(index, tag);
		case "age_down":
			return optionDrawDownAgeChart(index, tag);
		}
	}

	function options_view_gender_pie(index, tag){
		var sliceObject = {
	             0: { color: '#cecece' },
	             1: { color: '#d4d4d4' }
	         }
		sliceObject[index].color = '#aaaaaa';

		var options = {
				//legend:'none',
		 		pieHole: 0.6,
		 		pieSliceTextStyle: {
		             color: 'white',
		         },
		         pieSliceText: 'none',
		 		slices: sliceObject
		};
		tag = "<font color='#aaaaaa'>"+tag+"</font>";
		$('#view_gender_center').html(tag);
		return options;
	}

	function options_down_gender_pie(index, tag){
		var sliceObject = {
	             0: { color: '#cecece' },
	             1: { color: '#d4d4d4' }
	         }
		sliceObject[index].color = '#007aff';

		var options = {
				//legend:'none',
		 		pieHole: 0.6,
		 		pieSliceTextStyle: {
		             color: 'white',
		         },
		         pieSliceText: 'none',
		 		slices: sliceObject
		};
		tag = "<font color='#007aff'>"+tag+"</font>";
		$('#down_gender_center').html(tag);
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

		sliceObject[index].color = '#aaaaaa';

		var options = {
				//legend:'none',
		 		pieHole: 0.6,
		 		pieSliceTextStyle: {
		             color: 'white',
		         },
		         pieSliceText: 'none',
		 		slices:sliceObject
		};
		tag = "<font color='#aaaaaa'>"+tag+"</font>";
		$('#view_age_center').html(tag);
		return options;
	}

	function optionDrawDownAgeChart(index, tag){
		var sliceObject = {
             0: { color: '#b5b5b5' },
             1: { color: '#b6b6b6' },
             2: { color: '#a9a9a9' },
             3: { color: '#dfdddd' },
             4: { color: '#f4f4f4' },
             5: { color: '#d4d4d4' }
         }

		sliceObject[index].color = '#007aff';

		var options = {
				//legend:'none',
		 		pieHole: 0.6,
		 		pieSliceTextStyle: {
		             color: 'white',
		         },
		         pieSliceText: 'none',
		 		slices:sliceObject
		};

		tag = "<font color='#007aff'>"+tag+"</font>";
		$('#down_age_center').html(tag);
		return options;
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
		<h3><img src="/src/owner/images/contents/h3_img_03.png" alt=""  /><span>홍보ㆍ마케팅 상품 &nbsp; &gt; &nbsp; </span> 홍보전단</h3>




		<div class="guide_area">
			<ul>
				<li class="guide_wid" style="width:100%; text-align:left;"><span>현재 우리가게 홍보전단 현황을 한눈에 확인하실 수 있습니다.</span></li>
			</ul>
		</div><!-- END guide_area //-->


		<!-- 총평 //-->
		<div class="cont_area mb20">
			<div class="ev_dash_subject">
				<p>${promotion_detail.promotion_start_day} ~ ${promotion_detail.promotion_end_day}까지 진행된 이벤트 성과 통계입니다.
					<span>비교적 <strong class="orange" >성공적</strong> 이었습니다.
						<strong class="mobile_icon"><a href="#"><img src="/src/owner/images/contents/icon_medal.png" /></a></strong>
					</span>
				</p>
				<div class="subsubject">${promotion_detail.promotion_title}</div>
			</div>
		</div>

		<!--  주변고객수, 관심 고객수, 구매 고객수 //-->
		<div class="dash_area_01 width_half50">
			<ul>
				<li>
					<p class="text">홍보전단<br /><strong>열람</strong></p>
					<p class="number gray"><strong>${promotion_view_count}</strong>건</p>
				</li>
				<li>
					<p class="text">홍보전단<strong>챙기기 수</strong></p>
					<p class="number orange"><strong>${promotion_down_count}</strong>건</p>
				</li>
			</ul>
		</div>

		<!-- 시간대별 평균 추이 //-->
		<div class="time_graph">
			<p class="text">
				<span>시간대별 이벤트 열람 수, 쿠폰 다운로드 수, 쿠폰 사용 수에 대한 추이입니다.</span><br />
				<strong>시간대별</strong> 홍보전단 <strong>성과 추이</strong>
			</p>
			<p class="graph_info"><span class="gray">■</span> 열람 &nbsp;&nbsp; <span class="orange">■</span> 다운로드 &nbsp;&nbsp; <span class="blue">■</span> 사용</p>
			<div id="chart_div_time"></div>
		</div>

		<!-- 요일별 평균 추이 //-->
		<div class="time_graph">
			<p class="text">
				<span>일별 이벤트 열람 수, 쿠폰 다운로드 수, 쿠폰 사용 수에 대한 추이입니다..</span><br />
				 <strong>일별</strong> 이벤트 <strong>성과 추이</strong>
			</p>
			<p class="graph_info"><span class="gray">■</span> 열람 &nbsp;&nbsp; <span class="orange">■</span> 다운로드 &nbsp;&nbsp; <span class="blue">■</span> 사용</p>
			<div id="chart_div_date"></div>
		</div>





		<!--  이벤트현황, 성과, 홍보전단 성과 //-->
		<div class="dash_event_area width_half50 ">
			<ul>
				<li class=" pb20">
					<p class="tit"> 홍보전단 <strong>열람</strong> - <strong>성별</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="view_gender_donut" style="width: auto; height: auto"></div>
						<div id="view_gender_center" style="position:absolute;top:133px;left:34%;"></div>
					</div>
					<div class="garo_line"></div>
					<p class="tit"> 홍보전단 <strong>열람</strong> - <strong>연령별</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="view_age_donut" style="width: auto; height: auto;"></div>
						<div id="view_age_center" style="position:absolute;top:425px;left:34%;"></div>
					</div>
				</li>

				<li class=" pb20">
					<p class="tit"> 홍보전단 <strong>챙기기</strong> - <strong>성별</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="down_gender_donut" style="width: auto; height: auto;"></div>
						<div id="down_gender_center" style="position:absolute;top:133px;left:34%;"></div>
					</div>
					<div class="garo_line"></div>
					<p class="tit"> 홍보전단 <strong>챙기기</strong> - <strong>연령별</strong> 비율</p>
					<div class="graph_img pad10">
						<div id="down_age_donut" style="width: auto; height: auto;"></div>
						<div id="down_age_center" style="position:absolute;top:425px;left:34%;"></div>
					</div>
				</li>

			</ul>
		</div>



	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->




<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />













</div><!-- END wrap//-->
</body>
</html>