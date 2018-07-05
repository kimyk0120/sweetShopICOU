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
<body>


<div id="wrap">

<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="1" />
</c:import>







<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="4" />
	</c:import>

	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_02.png" alt=""  /><span>통계분석 &nbsp; &gt; &nbsp; </span> 홈페이지 방문자 분석</h3>


		<div class="guide_area">
			<ul>
				<li class="guide_wid"><span>현재 우리 홈페이지에 대한 분석을 확인하실 수 있습니다.</span></li>
				<li>
					<span class="dash_category">
						<input type="text" id="btn" class="dash_searproc_input_blur" onclick="dash_category(1);" value="전체" title="카테고리 선택"  >
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
								<li><a href="#" class="close_dash">전체</a></li>
								<li><a href="#" class="close_dash">최근1일</a></li>
								<li><a href="#" class="close_dash">7일</a></li>
								<li><a href="#" class="close_dash">30일</a></li>
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
						<input type="text" id="btn" class="seach_date_input_blur" onclick="seach_date(1);" value="2016.06.4" title="시작일 선택" > &nbsp; ~ &nbsp; <input type="text" id="btn" class="seach_date_input_blur" onclick="seach_date(2);" value="2016.06.11"  title="종료일 선택">
						<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
						<script type="text/javascript">
						<!--
						function seach_date(num){
						document.getElementById('seach_date_' + num ).style.display = "";
						}
						//-->
						</script>
						<div class="seach_date" id="seach_date_1" style="display:none;" >
								<table class="table_date" summary="날짜 검색을 위한 달력">
								<caption>달력</caption>
									<colgroup>
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									</colgroup>

									<thead>
										<tr>
											<th colspan="7">
												<p class="prev"><a href="#"><img src="/src/owner/images/contents/btn_prev.png" alt="이전 월"/></a></p>
												2016.06
												<p class="next"><a href="#"><img src="/src/owner/images/contents/btn_next.png" alt="다음 월" /></a></p>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
											<th>일</th>
										</tr>
										<tr>
											<td></td>
											<td><a href="#">1</a></td>
											<td><a href="#">2</a></td>
											<td><a href="#">3</a></td>
											<td><a href="#">4</a></td>
											<td><a href="#">5</a></td>
											<td><a href="#">6</a></td>
										</tr>
										<tr>
											<td><a href="#">7</a></td>
											<td><a href="#">8</a></td>
											<td><a href="#">9</a></td>
											<td><a href="#">10</a></td>
											<td><a href="#">11</a></td>
											<td><a href="#">12</a></td>
											<td><a href="#">13</a></td>
										</tr>
										<tr>
											<td><a href="#">14</a></td>
											<td><a href="#">15</a></td>
											<td><a href="#">16</a></td>
											<td><a href="#">17</a></td>
											<td><a href="#">18</a></td>
											<td><a href="#">19</a></td>
											<td><a href="#">20</a></td>
										</tr>
										<tr>
											<td><a href="#">21</a></td>
											<td><a href="#">22</a></td>
											<td><a href="#">23</a></td>
											<td><a href="#">24</a></td>
											<td><a href="#">25</a></td>
											<td><a href="#">26</a></td>
											<td><a href="#">27</a></td>
										</tr>
										<tr>
											<td><a href="#">28</a></td>
											<td><a href="#">29</a></td>
											<td><a href="#">30</a></td>
											<td><a href="#">31</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
						 </div>


						 <div class="seach_date date_last" id="seach_date_2" style="display:none;">
								<table class="table_date" summary="날짜 검색을 위한 달력">
								<caption>달력</caption>
									<colgroup>
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									<col width="14.28571%" />
									</colgroup>

									<thead>
										<tr>
											<th colspan="7">
												<p class="prev"><a href="#"><img src="/src/owner/images/contents/btn_prev.png" alt="이전 월" /></a></p>
												2016.06
												<p class="next"><a href="#"><img src="/src/owner/images/contents/btn_next.png" alt="다음 월" /></a></p>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
											<th>일</th>
										</tr>
										<tr>
											<td></td>
											<td><a href="#">1</a></td>
											<td><a href="#">2</a></td>
											<td><a href="#">3</a></td>
											<td><a href="#">4</a></td>
											<td><a href="#">5</a></td>
											<td><a href="#">6</a></td>
										</tr>
										<tr>
											<td><a href="#">7</a></td>
											<td><a href="#">8</a></td>
											<td><a href="#">9</a></td>
											<td><a href="#">10</a></td>
											<td><a href="#">11</a></td>
											<td><a href="#">12</a></td>
											<td><a href="#">13</a></td>
										</tr>
										<tr>
											<td><a href="#">14</a></td>
											<td><a href="#">15</a></td>
											<td><a href="#">16</a></td>
											<td><a href="#">17</a></td>
											<td><a href="#">18</a></td>
											<td><a href="#">19</a></td>
											<td><a href="#">20</a></td>
										</tr>
										<tr>
											<td><a href="#">21</a></td>
											<td><a href="#">22</a></td>
											<td><a href="#">23</a></td>
											<td><a href="#">24</a></td>
											<td><a href="#">25</a></td>
											<td><a href="#">26</a></td>
											<td><a href="#">27</a></td>
										</tr>
										<tr>
											<td><a href="#">28</a></td>
											<td><a href="#">29</a></td>
											<td><a href="#">30</a></td>
											<td><a href="#">31</a></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
						 </div>

						<script type="text/javascript">
							$seach_date_checking = $("#seach_date_1");
							$seach_date_checking.hover(
								function(){
									$(this).css("display","block");
								},
								function(){
									$(this).css("display","none");
								}
							);
							$seach_date_checking = $("#seach_date_2");
							$seach_date_checking.hover(
								function(){
									$(this).css("display","block");
								},
								function(){
									$(this).css("display","none");
								}
							);
						</script>
					</span>
				</li>
			</ul>
		</div><!-- END guide_area //-->




		<!-- 상단 5개 박스 통계팅 //-->
		<div class="dash_counter_area">
			<ul>
				<li>

					<p class="text">
						<span class="g_text">설정하신 기간 동안의 홈페이지 <strong>방문자수</strong>는 <strong>176명</strong>입니다.</span>
						홈페이지<br /><strong>방문자 수</strong></p>
					<p class="number gray"><strong>176</strong>명</p>
				</li>
				<li>
					<p class="text">
						<span class="g_text">설정하신 기간 동안의 홈페이지 <strong>신규 방문자수</strong>는 <strong>105명</strong>입니다.</span>
						신규<br /><strong>방문자 수</strong></p>
					<p class="number gray"><strong>105</strong>명</p>
				</li>


				<li class="web">
					<p class="guide_text"><span class="orange"><strong>신규 방문 비율</strong></span>은 91%로 재방문 비율 9%보다 매우 <span class="orange"><strong>높습니다.</strong></span></p>
					<p class="tit"> <strong>신규 방문</strong> vs <strong>재방문</strong></p>
					<div class="graph_img pad10">
						<img src="/src/owner/images/contents/@graph_19.png" style="max-width:207px; height:auto" alt=""  />
					</div>
				</li>
				<li>
					<p class="text">
						<span class="g_text">설정하신 기간 동안의 홈페이지 <strong>방문횟수</strong>는 <strong>321회</strong>입니다.</span>
						홈페이지<br /><strong>방문 횟수</strong></p>
					<p class="number gray"><strong>321</strong>회</p>
				</li>
				<li>
					<p class="text">
						<span class="g_text">설정하신 기간 동안의 <strong>페이지뷰</strong>(방문자가 들러본 페이지 수)는 <strong>510회</strong>입니다.</span>
						<strong>페이지뷰</strong></p>
					<p class="number gray"><strong>510</strong>회</p>
				</li>

				<li class="mobile">
					<p class="guide_text"><span class="orange"><strong>신규 방문 비율</strong></span>은 91%로 재방문 비율 9%보다 매우 <span class="orange"><strong>높습니다.</strong></span></p>
					<p class="tit"> <strong>신규 방문</strong> vs <strong>재방문</strong></p>
					<div class="graph_img pad10">
						<img src="/src/owner/images/contents/@graph_19.png" style="max-width:207px; height:auto" alt=""  />
					</div>
				</li>

			</ul>
		</div>



		<!-- 일별 방문 현황 //-->
		<div class="time_graph">
			<p class="text">
				<span><strong class="blue">3월 26일, 27일, 4월 2일</strong>에 홈페이지 방문자가 <strong class="blue">많았습니다.</strong></span> <br />
				<strong>일별</strong> 방문 <strong>현황</strong>
			</p>
			<div class="graph_img mt30">
				<img src="/src/owner/images/contents/@graph_20.png"  alt="" />
			</div>
		</div>

		<!-- 요일별 방문 분포 //-->
		<div class="time_graph">
			<p class="text">
				<span>요일별 홈페이지<strong class="blue">금요일, 토요일</strong>에 가장 <strong class="blue">많습니다.</strong></span> <br />
				<strong>요일별</strong> 방문 <strong>분포</strong>
			</p>
			<div class="graph_img mt30">
				<img src="/src/owner/images/contents/@graph_21.png"  alt="" />
			</div>
		</div>



		<!-- 시간대별 방문 분포 //-->
		<div class="time_graph">
			<p class="text">
				<span>시간대별 홈페이지 방문자수는<strong class="blue">오후 12시, 1시</strong>에 가장 <strong class="blue">많습니다.</strong></span> <br />
				<strong>요일별</strong> 방문 <strong>분포</strong>
			</p>
			<div class="graph_img mt30">
				<img src="/src/owner/images/contents/@graph_22.png"  alt="" />
			</div>
		</div>


		<!-- 인기페이지 //-->
		<div class="time_graph">
			<p class="text">
				<strong>인기페이지</strong>
			</p>
			<div class="graph_img mt30">
				<img src="/src/owner/images/contents/@graph_23.png"  alt="" />
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