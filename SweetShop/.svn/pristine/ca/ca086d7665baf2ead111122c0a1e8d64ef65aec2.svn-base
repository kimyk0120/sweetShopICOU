<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:import url="/src/owner/jsp/chart.jsp" charEncoding="UTF-8" />
</head>

<script type="text/javascript">
	$(document).ready(
			function() {

				/* var attr = '${shop_around_count}';
				var attr2 = '${shop_interest_count}';
				var attr3 = '${shop_buy_count}';
				var attr4 = '${shop_review_count}';

				var attr6 = '${shop_review_avg}';
				var attr7 = '${shop_review_avg_date}';
				var attr8 = '${shop_time_avg}';
				var attr10 = '${event_count}';
				var attr11 = '${promotion_count}';
				console.log(event_status);

				console.log("=============");
				console.log(attr6);
				console.log(attr7);
				console.log(attr8);
				console.log(attr10);
				console.log(attr11);
				console.log("============="); */

				//json데이터라서 jstl사용안하고 스크립트 처리
				var event_status = JSON.parse('${event_status}');
				$("#event_use").text(event_status.event_use)
				$("#event_end").text(event_status.event_end)

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
		var url = "/dashboard.do?start_date=" + sDateParam + "&end_date="
				+ eDateParam;
		$(location).attr('href', url);
	}
</script>
<script>
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
		drawPointChart('view_point_chart', '${shop_review_avg_date}',
				"special_point_view");
		drawTimeChart('chart_div_time', '${shop_time_avg}', "time");

		drawEventPromotionChart('view_event_donut', '${event_count}',
				"special_event_view");
		drawEventPromotionChart('view_promotion_donut', '${promotion_count}',
				"special_promotion_view");
	}

	//파이챠트의 옵션을 세팅해주는 부분 / 타입별로 구분
	function optionTypeChart(index, tag, type) {
		switch (type) {
		case "special_event_view":
			return options_view_event_pie(index, tag);
		case "special_promotion_view":
			return options_view_promotion_pie(index, tag);

		}

		return options;
	}

	//시간별 라인차트의 컬럼세팅
	function setColumnTimeChart() {
		timeChart_dt.addColumn('string', 'time');
		timeChart_dt.addColumn('number', 'around');
		timeChart_dt.addColumn('number', 'interest');
		timeChart_dt.addColumn('number', 'buy');
	}

	function setColumnPointChart() {
		pointChart_dt.addColumn('string', 'rs_date');
		pointChart_dt.addColumn('number', 'review_grade');
	}

	//라인 차트 내부의 값 패턴 세팅
	function getChartTimeObject(obj) {
		return [ obj.rs_time, parseInt(obj.around_count),
				parseInt(obj.interest_count), parseInt(obj.buy_count) ];
	}

	//라인 차트 내부의 값 패턴 세팅
	function getChartPointObject(obj) {
		return [ obj.rs_date, parseInt(obj.review_grade) ];
	}

	function options_view_event_pie(index, tag) {
		console.log("data == " + index + "//" + tag);
		var sliceObject = {
			0 : {
				color : '#007aff'
			},
			1 : {
				color : '#d4d4d4'
			}
		}

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};

		tempArr = tag.split(",");

		tag = "<font color='#007aff'>" + tempArr[0]
				+ "건</font><br/><font color='#d4d4d4'>" + tempArr[1]
				+ "건</font>";
		$('#view_event_center').html(tag);

		console.log("data == " + tag);

		var cal = (parseInt(tempArr[0]) / parseInt(tempArr[1]) * 100)
				.toFixed(1);
		var guideTag = "홍보전단 성과는 다운로드 수 "
				+ tempArr[0]
				+ "건, 열람수 "
				+ tempArr[1]
				+ "건으로 <strong>홍보전단 다운로드율</strong>은 <span class='blue'><strong>"
				+ cal + "%</strong></span>입니다.";

		console.log("data == " + cal + " / " + guideTag);
		$('#event_text').html(guideTag);

		return options;
	}

	function options_view_promotion_pie(index, tag) {
		var sliceObject = {
			0 : {
				color : '#007aff'
			},
			1 : {
				color : '#d4d4d4'
			}
		}

		var options = {
			//legend:'none',
			pieHole : 0.6,
			pieSliceTextStyle : {
				color : 'white',
			},
			pieSliceText : 'none',
			slices : sliceObject
		};

		tempArr = tag.split(",");

		tag = "<font color='#007aff'>" + tempArr[0]
				+ "건</font><br/><font color='#d4d4d4'>" + tempArr[1]
				+ "건</font>";
		$('#view_promotion_center').html(tag);

		var cal = (parseInt(tempArr[0]) / parseInt(tempArr[1]) * 100)
				.toFixed(1);
		var guideTag = "홍보전단 성과는 다운로드 수 " + tempArr[0] + "건, 열람수 " + tempArr[1]
				+ "건으로 <strong>이벤트 다운로드율</strong>은 <span class='blue'><strong>"
				+ cal + "%</strong></span>입니다.";
		$('#promotion_text').html(guideTag);

		return options;
	}
</script>
<body>
	<div id="wrap">

		<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
			<c:param name="index" value="1" />
		</c:import>

		<div id="container">

			<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
				<c:param name="index" value="1" />
			</c:import>

			<!-- 우측 콘텐츠의 시작 //-->
			<div id="content_area">
				<h2>
					<p>안녕하세요.</p><strong>${shop_detail.shop_name}</strong> 점주님
				</h2>
				<h3>
					<img src="/src/owner/images/contents/h3_img_01.png" alt="" />Dashboard
				</h3>


				<div class="guide_area">
					<ul>
						<li class="guide_wid"><span>현재 우리가게 고객 현황과 이벤트를 한눈에
								확인하실 수 있습니다.</span></li>
						<li><span class="dash_category"> <input type="text"
								id="dateTerm" class="dash_searproc_input_blur"
								onclick="dash_category(1);" value="" title="카테고리 선택"> <!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
								<script type="text/javascript">
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
								<strong>현재,</strong> 우리가게<br />주변 고객수
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
								우리가게<br /> <strong>관심 고객</strong>수
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
								우리가게<br /> <strong>구매 고객</strong>수
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
					<div id="chart_div_time"></div>
				</div>


				<!--  이벤트현황, 성과, 홍보전단 성과 //-->
				<div class="dash_event_area">
					<ul>
						<li>
							<p class="matter">
								<span class="orange"><strong id="event_use"></strong>건</span>진행중이벤트
							</p>
							<p class="matter">
								<span class="gray"><strong id="event_end"></strong>건</span>종료된이벤트
							</p>
							<p class="tit mt20">
								이벤트 <strong>현황</strong>
							</p>
						</li>

						<li>
							<p id="event_text" class="guide_text"></p>
							<p class="tit">
								이벤트 <strong>성과</strong>
							</p> <!--<p class="graph_info pl10 pr10"><span class="blue">■</span> 다운로드 수 &nbsp;&nbsp; <span class="gray">■</span> 열람수</p>//-->
							<div class="graph_img pad10">
								<div id="view_event_donut" style="width: 100%; height: 170px;"></div>
								<div id="view_event_center"
									style="position: absolute; top: 163px; left: 36%;"></div>
							</div>
						</li>

						<li>
							<p id="promotion_text" class="guide_text"></p>
							<p class="tit">
								홍보전단 <strong>성과</strong>
							</p> <!--<p class="graph_info pl10 pr10"><span class="blue">■</span> 다운로드 수 &nbsp;&nbsp; <span class="gray">■</span> 열람수</p>//-->
							<div class="graph_img pad10">
								<div id="view_promotion_donut"
									style="width: 100%; height: 170px;"></div>
								<div id="view_promotion_center"
									style="position: absolute; top: 163px; left: 36%;"></div>
							</div>
						</li>
					</ul>
				</div>


				<!-- 리뷰 데이터 //-->
				<div class="dash_review_area">
					<ul>
						<li>
							<p class="text">
								리뷰등록<br /> <strong>건수</strong>
							</p>
							<p class="number orange">
								<strong>${shop_review_count}</strong>명
							</p>
						</li>
						<!-- 위치 문제로 웹에서는 이부분이 노출됨 //-->
						<li class="web">
							<p class="text">
								<strong>일별</strong> 리뷰 <strong>평점 추이</strong>
							</p>
							<div class="graph_img mt70">
								<div id="view_point_chart" style="width: 100%; height: 200px;">
								</div>
						</li>
						<li>
							<p class="star">
								<c:set var="value" value="${shop_review_avg}" />
								<c:forEach var="index" begin="0" end="4" step="1">
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
							<p class="text">
								리뷰 <strong>평점</strong>
							</p>
							<p class="number blue">
								<strong>${shop_review_avg}</strong>점
							</p>
						</li>
						<!-- 위치 문제로 모바일에서느 이부분이 노출 됨 //-->
						<li class="mobile">
							<p class="text">
								<span><strong class="blue">3월 26일</strong>과, <strong
									class="blue">3월 30일</strong>에는 전일 대비 리뷰 평점이 크게 <strong
									class="blue">상승</strong>하였습니다.</span> <br /> <strong>일별</strong> 리뷰 <strong>평점
									추이</strong>
							</p>
							<div class="graph_img mt90">
								<div id="view_point_chart" style="width: 100%; height: 200px;"></div>
							</div>
						</li>
					</ul>
				</div>


				<!-- 하단 카운팅 //-->
				<div class="dash_counter_area">
					<ul>
						<li>
							<p class="text">
								리뷰등록<br /> <strong>건수</strong>
							</p>
							<p class="number gray">
								<strong>176</strong>명
							</p>
						</li>
						<li>
							<p class="text">
								신규<br /> <strong>방문자 수</strong>
							</p>
							<p class="number gray">
								<strong>105</strong>명
							</p>
						</li>


						<li class="web">
							<p class="guide_text">
								이벤트 성과는 다운로드 수 121건, 열람수 254건으로 <strong>이벤트 다운로드율</strong>은 <span
									class="blue"><strong>47.6%</strong></span>입니다.
							</p>
							<p class="tit">
								이벤트 <strong>성과</strong>
							</p> <!--<p class="graph_info pl10 pr10"><span class="blue">■</span> 다운로드 수 &nbsp;&nbsp; <span class="gray">■</span> 열람수</p>//-->
							<div class="graph_img pad10">
								<img src="/src/owner/images/contents/@graph_05.png"
									style="max-width: 212px; height: auto" alt="" />
							</div>
						</li>
						<li>
							<p class="text">
								홈페이지<br /> <strong>방문 횟수</strong>
							</p>
							<p class="number gray">
								<strong>321</strong>회
							</p>
						</li>
						<li>
							<p class="text">
								<strong>페이지뷰</strong>
							</p>
							<p class="number gray">
								<strong>510</strong>회
							</p>
						</li>
						<li class="mobile">
							<p class="guide_text">
								이벤트 성과는 다운로드 수 121건, 열람수 254건으로 <strong>이벤트 다운로드율</strong>은 <span
									class="blue"><strong>47.6%</strong></span>입니다.
							</p>
							<p class="tit">
								이벤트 <strong>성과</strong>
							</p> <!--<p class="graph_info pl10 pr10"><span class="blue">■</span> 다운로드 수 &nbsp;&nbsp; <span class="gray">■</span> 열람수</p>//-->
							<div class="graph_img pad10">
								<img src="/src/owner/images/contents/@graph_05.png"
									style="max-width: 212px; height: auto" alt="" />
							</div>
						</li>
					</ul>
				</div>



			</div>
			<!-- END content_area//-->
			<!-- 우측 콘텐츠의 시작 //-->

		</div>
		<!-- END container//-->




		<div id="footer">© Sweet K. All Rights Reserved.</div>













	</div>
	<!-- END wrap//-->
</body>
</html>