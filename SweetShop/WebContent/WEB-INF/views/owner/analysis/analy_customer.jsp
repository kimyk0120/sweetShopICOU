<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<title>Shop Owner ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/owner/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/owner/jsp/include.jsp" charEncoding="UTF-8" />
<c:import url="/src/owner/jsp/chart.jsp" charEncoding="UTF-8" />
</head>

<script type="text/javascript">
	$(document).ready(
			function() {

				var attr = '${shop_around_count}';
				var attr2 = '${shop_interest_count}';
				var attr3 = '${shop_buy_count}';
				var attr4 = '${shop_around_gender_chart}';
				var attr6 = '${shop_interest_gender_chart}';
				var attr7 = '${shop_buy_gender_chart}';
				var attr8 = '${shop_around_age_chart}';
				var attr9 = '${shop_interest_age_chart}';
				var attr10 = '${shop_buy_age_chart}';
				var attr11 = '${shop_time_avg}';
				var attr12 = '${shop_date_avg}';

				console.log(attr);

				console.log("=============");
				console.log(attr11);
				console.log(attr12);
				console.log("=============");

				$("#datepicker1")
						.datepicker(
								{
									dateFormat : 'yy-mm-dd',
									prevText : '이전 달',
									nextText : '다음 달',
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ '일', '월', '화', '수', '목', '금',
											'토' ],
									dayNamesShort : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									showMonthAfterYear : true,
									changeMonth : true,
									changeYear : true,
									yearSuffix : '년'
								});

				$("#datepicker2")
						.datepicker(
								{
									dateFormat : 'yy-mm-dd',
									prevText : '이전 달',
									nextText : '다음 달',
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNames : [ '일', '월', '화', '수', '목', '금',
											'토' ],
									dayNamesShort : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									showMonthAfterYear : true,
									changeMonth : true,
									changeYear : true,
									yearSuffix : '년',
									onSelect : function(dateText, inst) {
										search();
									}
								});

				var sDate = '${param.start_date}';
				var eDate = '${param.end_date}';

				setDate(sDate, eDate);

			});

	function setDate(sDate, eDate) {
		if (sDate == "" || eDate == "") {
			eDate = new Date();
			sDate = new Date();
			sDate.setDate(eDate.getDate() - 7);
			$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
			$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

			var messageText = "최근7일";
			$('#dateTerm').val(messageText);
		} else {
			var arr1 = sDate.split('-');
			var arr2 = eDate.split('-');
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			var diff = dat2 - dat1;
			var currDay = 24 * 60 * 60 * 1000;

			$('#datepicker1').val(sDate);
			$('#datepicker2').val(eDate);

			var messageText = "최근" + (parseInt(diff / currDay)) + "일";
			$('#dateTerm').val(messageText);
		}
	}

	function checkDateTerm(date) {
		console.log("check : " + date);
		eDate = new Date();
		sDate = new Date();

		sDate.setDate(eDate.getDate() - (date));

		$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
		$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

		var messageText = "최근" + date + "일";
		$('#dateTerm').val(messageText);

		search();
	}

	function search() {
		var sDateParam = $('#datepicker1').val();
		var eDateParam = $('#datepicker2').val();
		var url = "/analy_customer.do?start_date=" + sDateParam + "&end_date="
				+ eDateParam;
		$(location).attr('href', url);
	}
</script>
<script type="text/javascript">
	//차트초기화
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(initDrawChart);

	// 차트가 리사이즈 될때 차트를 다시 그려주는 구문
	$(window).resize(function() {
		if (this.resizeTO)
			clearTimeout(this.resizeTO);
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
		drawDateChart('chart_div_date', '${shop_date_avg}', "date");
		drawTimeChart('chart_div_time', '${shop_time_avg}', "time");

		drawGenderChart('view_gender_donut', '${shop_around_gender_chart}',
				"gender_down");
		drawGenderChart('down_gender_donut', '${shop_interest_gender_chart}',
				"gender_view");
		drawGenderChart('use_gender_donut', '${shop_buy_gender_chart}',
				"gender_use");
		drawAgeChart('view_age_donut', '${shop_around_age_chart}', "age_view");
		drawAgeChart('down_age_donut', '${shop_interest_age_chart}', "age_down");
		drawAgeChart('use_age_donut', '${shop_buy_age_chart}', "age_use");
	}

	//라인 차트 내부의 값 패턴 세팅
	function getChartDateObject(obj) {
		var day_label = "";
		switch(obj.rs_day){
			 case '1':
				 day_label="일";
				 break;
			 case '2':
				 day_label="월";
				 break;
			 case '3':
				 day_label="화";
				 break;
			 case '4':
				 day_label="수";
				 break;
			 case '5':
				 day_label="목";
				 break;
			 case '6':
				 day_label="금";
				 break;
			 case '7':
				 day_label="토";
				 break;
		}

		return [ day_label, parseInt(obj.around_count),
				parseInt(obj.interest_count), parseInt(obj.buy_count) ];
	}

	//라인 차트 내부의 값 패턴 세팅
	function getChartTimeObject(obj) {
		return [ obj.rs_time, parseInt(obj.around_count),
				parseInt(obj.interest_count), parseInt(obj.buy_count) ];
	}

	//시간별 라인차트의 컬럼세팅
	function setColumnTimeChart() {
		timeChart_dt.addColumn('string', 'rs_time');
		timeChart_dt.addColumn('number', 'around');
		timeChart_dt.addColumn('number', 'interest');
		timeChart_dt.addColumn('number', 'buy');
	}
	//날짜별 라인차트의 컬럼세팅
	function setColumnDateChart() {
		dateChart_dt.addColumn('string', 'rs_day');
		dateChart_dt.addColumn('number', 'around');
		dateChart_dt.addColumn('number', 'interest');
		dateChart_dt.addColumn('number', 'buy');
	}

	//파이챠트의 옵션을 세팅해주는 부분 / 타입별로 구분
	function optionTypeChart(index, tag, type) {

		switch (type) {
		case "gender_view":
			return options_view_gender_pie(index, tag);
		case "gender_down":
			return options_down_gender_pie(index, tag);
		case "gender_use":
			return options_use_gender_pie(index, tag);
		case "age_view":
			return optionDrawViewAgeChart(index, tag);
		case "age_down":
			return optionDrawDownAgeChart(index, tag);
		case "age_use":
			return optionDrawUseAgeChart(index, tag);
		}

		return options;
	}

	function options_view_gender_pie(index, tag) {
		var sliceObject = {
			0 : {
				color : '#d4d4d4'
			},
			1 : {
				color : '#d4d4d4'
			}
		}
		sliceObject[index].color = '#aaaaaa';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};
		tag = "<font color='#aaaaaa'>" + tag + "</font>";
		$('#view_gender_center').html(tag);
		return options;
	}

	function options_down_gender_pie(index, tag) {
		var sliceObject = {
			0 : {
				color : '#d4d4d4'
			},
			1 : {
				color : '#d4d4d4'
			}
		}
		sliceObject[index].color = '#ff8500';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};
		tag = "<font color='#ff8500'>" + tag + "</font>";
		$('#down_gender_center').html(tag);
		return options;
	}

	function options_use_gender_pie(index, tag) {
		var sliceObject = {
			0 : {
				color : '#d4d4d4'
			},
			1 : {
				color : '#d4d4d4'
			}
		}
		sliceObject[index].color = '#007aff';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};
		tag = "<font color='#007aff'>" + tag + "</font>";
		$('#use_gender_center').html(tag);
		return options;
	}

	function optionDrawViewAgeChart(index, tag) {
		var sliceObject = {
			0 : {
				color : '#b5b5b5'
			},
			1 : {
				color : '#b6b6b6'
			},
			2 : {
				color : '#a9a9a9'
			},
			3 : {
				color : '#dfdddd'
			},
			4 : {
				color : '#f4f4f4'
			},
			5 : {
				color : '#d4d4d4'
			}
		}

		sliceObject[index].color = '#aaaaaa';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};
		tag = "<font color='#aaaaaa'>" + tag + "</font>";
		$('#view_age_center').html(tag);
		return options;
	}

	function optionDrawDownAgeChart(index, tag) {
		var sliceObject = {
			0 : {
				color : '#b5b5b5'
			},
			1 : {
				color : '#b6b6b6'
			},
			2 : {
				color : '#a9a9a9'
			},
			3 : {
				color : '#dfdddd'
			},
			4 : {
				color : '#f4f4f4'
			},
			5 : {
				color : '#d4d4d4'
			}
		}

		sliceObject[index].color = '#ff8500';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};

		tag = "<font color='#ff8500'>" + tag + "</font>";
		$('#down_age_center').html(tag);
		return options;
	}

	function optionDrawUseAgeChart(index, tag) {
		var sliceObject = {
			0 : {
				color : '#b5b5b5'
			},
			1 : {
				color : '#b6b6b6'
			},
			2 : {
				color : '#a9a9a9'
			},
			3 : {
				color : '#dfdddd'
			},
			4 : {
				color : '#f4f4f4'
			},
			5 : {
				color : '#d4d4d4'
			}
		}

		sliceObject[index].color = '#007aff';

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};

		tag = "<font color='#007aff'>" + tag + "</font>";
		$('#use_age_center').html(tag);

		return options;
	}
</script>
<body>


	<div id="wrap">


		<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
			<c:param name="index" value="2" />
		</c:import>

		<div id="container">

			<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
				<c:param name="index" value="2" />
			</c:import>

			<!-- 우측 콘텐츠의 시작 //-->
			<div id="content_area">

				<h3>
					<img src="/src/owner/images/contents/h3_img_02.png" alt="" /><span>통계분석
						&nbsp; &gt; &nbsp; </span> 고객 분석
				</h3>


				<div class="guide_area">
					<ul>
						<li class="guide_wid"><span>현재 우리가게 고객에 대한 분석을 확인하실 수
								있습니다.</span></li>
						<li><span class="dash_category"> <input type="text"
								id="dateTerm" class="dash_searproc_input_blur"
								onclick="dash_category(1);" value="" title="카테고리 선택">
								<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//--> <script
									type="text/javascript">
								<!--
									function dash_category(num) {
										document
												.getElementById('dash_category_'
														+ num).style.display = "";
									}
								//-->
								</script>
								<div class="dash_cate_type" id="dash_category_1"
									style="display: none;">
									<ul>
										<li><a href="javascript:checkDateTerm(1)"
											class="close_dash">최근1일</a></li>
										<li><a href="javascript:checkDateTerm(7)"
											class="close_dash">최근7일</a></li>
										<li><a href="javascript:checkDateTerm(10)"
											class="close_dash">최근10일</a></li>
										<li><a href="javascript:checkDateTerm(30)"
											class="close_dash">최근30일</a></li>
										<li><a href="javascript:checkDateTerm(90)"
											class="close_dash">최근90일</a></li>
									</ul>
								</div> <script type="text/javascript">
									$(".close_dash").click(
											function() {
												$("#dash_category_1").css(
														"display", "none");
											});

									$dash_category_checking = $("#dash_category_1");
									$dash_category_checking.hover(function() {
										$(this).css("display", "block");
									}, function() {
										$(this).css("display", "none");
									});
								</script>
						</span> <span class="seach_date"> <input type="text"
								id="datepicker1" class="seach_date_input_blur"
								readonly="readonly" value="2016.06.4" title="시작일 선택">
								&nbsp; ~ &nbsp; <input type="text" id="datepicker2"
								class="seach_date_input_blur" value="2016.06.11"
								readonly="readonly" title="종료일 선택">
						</span></li>
					</ul>
				</div>
				<!-- END guide_area //-->



				<!--  주변고객수, 관심 고객수, 구매 고객수 //-->
				<div class="dash_area_01">
					<ul>
						<li>
							<p id="q_mark_01" class="q_mark_layer">
								<span>▲</span> <strong>우리가게 주변 고객이란?</strong> GPS를 통해 매장 주변
								500m내에 감지되었거나, 500m 내에 있는 매장에서 쿠폰을 사용한 고객을 의미합니다.
							</p>
							<p class="q_mark">
								<a href="#" id="btn_qmark_01"><img
									src="/src/owner/images/contents/icon_qustion.png"
									alt="관련 정보 안내" /></a>
							</p>
							<p class="text">
								우리가게<br />주변 고객수
							</p>
							<p class="number gray">
								<strong>${shop_around_count}</strong>명
							</p>
						</li>
						<li>
							<p id="q_mark_02" class="q_mark_layer">
								<span>▲</span> <strong>관심 고객이란?</strong> 이벤트, 홍보전단, 가게 명함을 조회하거나
								다운로드 및 사용, 해당 가게를 즐겨 찾는 가게에 추가한 고객을 위미합니다.
							</p>
							<p class="q_mark">
								<a href="#" id="btn_qmark_02"><img
									src="/src/owner/images/contents/icon_qustion.png"
									alt="관련 정보 안내" /></a>
							</p>
							<p class="text">
								<strong>관심 고객</strong>수
							</p>
							<p class="number orange">
								<strong>${shop_interest_count}</strong>명
							</p>
						</li>
						<li>
							<p id="q_mark_03" class="q_mark_layer">
								<span>▲</span> <strong>구매 고객이란?</strong> 쿠폰을 사용한 고객으로 매장에 방문하여
								구매한 이력이 있는 고객을 의미합니다.
							</p>
							<p class="q_mark">
								<a href="#" id="btn_qmark_03"><img
									src="/src/owner/images/contents/icon_qustion.png"
									alt="관련 정보 안내" /></a>
							</p>
							<p class="text">
								<strong>구매 고객</strong>수
							</p>
							<p class="number blue">
								<strong>${shop_buy_count}</strong>명
							</p>
						</li>
					</ul>
				</div>


				<script type="text/javascript">
					$('#btn_qmark_01').click(function() {
						$('#q_mark_01').toggle('slow', function() {
						});
					});
					$('#btn_qmark_02').click(function() {
						$('#q_mark_02').toggle('slow', function() {
						});
					});
					$('#btn_qmark_03').click(function() {
						$('#q_mark_03').toggle('slow', function() {
						});
					});
				</script>




				<!-- 시간대별 평균 추이 //-->
				<div class="time_graph">
					<p class="text">
						<span><strong>시간대별</strong>, 우리 가게 주변 고객수, 관심 고객수, 구매 고객수 <strong>평균
								추이</strong>입니다.</span><br /> <strong>시간대별</strong> 우리가게 주변 고객 수 <strong>평균
							추이</strong>
					</p>
					<p class="graph_info">
						<span class="gray">■</span> 주변 고객 &nbsp;&nbsp; <span
							class="orange">■</span> 관심고객 &nbsp;&nbsp; <span class="blue">■</span>
						구매고객
					</p>
					<div class="graph_img">
						<div id="chart_div_time"></div>
					</div>
				</div>

				<!-- 요일별 평균 추이 //-->
				<div class="time_graph">
					<p class="text">
						<span>한 달간 동일 요일의 <strong>시간대별</strong>, 우리 가게 주변 고객수, 관심
							고객수, 구매 고객수 <strong>평균 추이</strong>입니다.
						</span><br /> <strong>요일별</strong> 고객 수 <strong>평균 추이</strong>
					</p>
					<p class="graph_info">
						<span class="gray">■</span> 주변 고객 &nbsp;&nbsp; <span
							class="orange">■</span> 관심고객 &nbsp;&nbsp; <span class="blue">■</span>
						구매고객
					</p>
					<div class="graph_img">
						<div id="chart_div_date"></div>
					</div>
				</div>

				<!--  이벤트현황, 성과, 홍보전단 성과 //-->
				<div class="dash_event_area">
					<ul>
						<li class=" pb20">
							<p class="tit">
								이벤트 <strong>열람</strong> - <strong>성별</strong> 비율
							</p>
							<div>
								<div id="view_gender_donut" style="width: 100%; height: 240px;"></div>
								<div id="view_gender_center"
									style="position: absolute; top: 140px; left: 35%;"></div>
							</div>
							<div class="garo_line"></div>
							<p class="tit">
								이벤트 <strong>열람</strong> - <strong>연령별</strong> 비율
							</p>
							<div>
								<div id="view_age_donut" style="width: 100%; height: 240px;"></div>
								<div id="view_age_center"
									style="position: absolute; top: 455px; left: 35%;"></div>
							</div>
						</li>

						<li class=" pb20">
							<p class="tit">
								쿠폰 <strong>다운로드</strong> - <strong>성별</strong> 비율
							</p>
							<div>
								<div id="down_gender_donut" style="width: 100%; height: 240px;"></div>
								<div id="down_gender_center"
									style="position: absolute; top: 140px; left: 35%;"></div>
							</div>
							<div class="garo_line"></div>
							<p class="tit">
								쿠폰 <strong>다운로드</strong> - <strong>연령별</strong> 비율
							</p>
							<div>
								<div id="down_age_donut" style="width: 100%; height: 240px;"></div>
								<div id="down_age_center"
									style="position: absolute; top: 455px; left: 35%;"></div>
							</div>
						</li>

						<li class=" pb20">
							<p class="tit">
								쿠폰 <strong>사용</strong> - <strong>성별</strong> 비율
							</p>
							<div>
								<div id="use_gender_donut" style="width: 100%; height: 240px;"></div>
								<div id="use_gender_center"
									style="position: absolute; top: 140px; left: 35%;"></div>
							</div>
							<div class="garo_line"></div>
							<p class="tit">
								쿠폰 <strong>사용</strong> - <strong>연령별</strong> 비율
							</p>
							<div>
								<div id="use_age_donut" style="width: 100%; height: 240px;"></div>
								<div id="use_age_center"
									style="position: absolute; top: 455px; left: 35%;"></div>
							</div>
						</li>

					</ul>
				</div>



			</div>
			<!-- END content_area//-->
			<!-- 우측 콘텐츠의 시작 //-->

		</div>
		<!-- END container//-->


		<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />












	</div>
	<!-- END wrap//-->
</body>
</html>