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
	<c:param name="index" value="5" />
</c:import>






<div id="container">
	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="5" />
	</c:import>


	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_03.png" alt=""  /><span>홍보ㆍ마케팅 상품 &nbsp; &gt; &nbsp; </span> 이벤트</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>현재 우리가게 고객 현황과 이벤트를 한눈에 확인하실 수 있습니다.</span></li>
			</ul>
		</div><!-- END guide_area //-->





		<div class="half_box">
			<ul>
				<!-- 좌측 콘텐츠 //-->
				<li class="left">

					<!-- 상단칸//-->
					<div class="cont_area ">
						<div class="ev_regis_subject">
							<p>2016.06.08</p>
							<input type="text" id="event_subject" class="regis_input_blur" placeholder=" 이벤트 명을 입력하여 주세요.">
						</div>
					</div>

					<!-- 하단칸 //-->
					<div class="cont_area ev_regis_cont mt20">
						<ul class="tap_menu">
							<li><a href="#">할인 이벤트</a><li>
							<li class="on"><a href="#">혜택 제공 이벤트</a><li>
						</ul>


						<div class="gab_box">
							<div>
								<label for="pum">적용 서비스 품목</label>
								<input type="text" id="pum" class="regis_input_blur"  placeholder="혜택이 적용될 서비스 품목을 입력해 주세요."style="font-size:14px;">
							</div>

							<div class="w_half whleft">
								<label for="detail_guide">제공 혜택</label>
								<input type="text" id="detail_guide" class="regis_input_blur bg_arrow"  onclick="suggest(1);" style="width:92%; padding-right:8%; background: url('/src/owner/images/contents/arrow_btm.png') no-repeat 98% center;" placeholder="서비스 품목 제공">
									<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
									<script type="text/javascript">
									<!--
									function suggest(num){
									 document.getElementById('suggest_' + num ).style.display = "";
									}
									//-->
									</script>
									 <div class="business_type" id="suggest_1" style="display:none;">
										<ul>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>미용/스파</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>헤어/메이크업</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>부동산중개</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>빵집/제과점</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>숙박</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>슈퍼/마트</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>약국</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>음식점</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>카페</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>인테리어</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>청소</a></li>
											<li><a href="#" class="close"><span class="stile_vh">업종</span>스포츠/헬스</a></li>
										</ul>
									 </div>
									 <script type="text/javascript">
										$(".close").click(function() {
											$("#suggest_1").css("display","none");
										});
										$suggest_checking = $("#suggest_1");
										$suggest_checking.hover(
											function(){
												$(this).css("display","block");
											},
											function(){
												$(this).css("display","none");
											}
										);
									</script>
							</div>
							<div class="w_half whright" >
								<label for="detail_guide" class="hide">제공 혜택 직접입력</label>
								<input type="text" id="detail_guide" class="regis_input_blur"  placeholder="제공되어질 서비스 품목을 입력해주세요.">
							</div>

							<div class="design evimgbox on"><!-- 이벤트 이미지쪽 작업시 클래스 on 추가하면 라인 블루색으로 조정 됨 //-->
								<div class="title">이벤트 이미지</div>
								<div class="cont">
									<div class="item_cont_area">
										<span class="thum"><img src="/src/owner/images/contents/@thum_01.png" /></span>
										<span class="thum"><img src="/src/owner/images/contents/@thum_01.png" /></span>
										<span class="thum">&nbsp;</span>
										<p class="more_green ml20"><a href="#"><img src="/src/owner/images/contents/icon_camera.png" /></a></p>
									</div>
								</div>
							</div>

							<div class="design_textarea">
								<div class="title">상세 설명</div>
											<textarea id="" placeholder="이용방법 등 이벤트에 대한 추가적인 설명을 입력해 주세요." class="write_input_blur"></textarea>
										 <script type="text/javascript">
										$(document).ready(function() {
											$('.design_textarea').on( 'keyup', 'textarea', function (e){
												$(this).css('height', 'auto' );
												$(this).height( this.scrollHeight );
											});
											$('.write_input_blur').find( 'textarea' ).keyup();
										});
										$("div.design_textarea  textarea").focus(function() {
											$(this).attr('class','write_input_focus');
										});
										$("div.design_textarea  textarea").blur(function() {
											$(this).attr('class','write_input_blur');
										});
										 </script>
							</div>

							<div class="design"><!-- 이벤트 이미지쪽 작업시 클래스 on 추가하면 라인 블루색으로 조정 됨 //-->
								<div class="title">이벤트 기간</div>
								<div class="cont tar">
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
								</div>
							</div>
							<p class="guide_text">현재, (<span>7일</span>, 1주일) 동안 이벤트가 진행 될 예정입니다.</p>


						</div>


							<div class="btn_regis_area">
								<p><a href="#">등록</a></p>
								<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
								<p class="cancle"><a href="#">취소</a></p>
							</div>



					</div>



		<!-- 767 이하 1칸 조정되면서 미리보기 아이콘 노출 시작 //-->
		<div class="btn_floatting_area">
			<p class="more_green"><a onclick="go_popup()" style='cursor:pointer; cursor:hand;'><img src="/src/owner/images/contents/btn_icon_flotting.png" /></a></p>
		</div>



		<!-- 모바일에서 노출되는 팝업 미리보기 //-->
		<script src="/src/owner/js/jquery.bpopup.min.js"></script>
		<script type="text/javascript">
			function go_popup() {
				$('#preview_layer').bPopup({
					speed: 650,
					transition: 'slideDown',
					transitionClose: 'slideBack'
					 });
				 };
		</script>


		<div id="preview_layer" class="preview_layer">
		<p class="more_green preview_close"><a  href="#" class="b-close"><img src="/src/owner/images/contents/btn_icon_flotting.png" /></a></p>
		<div class="preview_cont" >


  			<div class="preview_area mb30">
				<p class="category_icon"><img src="/src/owner/images/contents/category_01.png" /><p>
				<div class="preview_title">
					업종키워드
					<p class="color_brown">가게명 노출</p>
				</div>
				<div class="preview_img">




							<!-- 터치 포함 슬라이드 이미지 //-->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide"><img src="/src/owner/images/contents/noimg.jpg" /></div>
									<div class="swiper-slide"><img src="/src/owner/images/contents/@sample_img_001.jpg" /></div>
								</div>
								<!-- Add Pagination -->
								<div class="swiper-pagination"></div>
								<!-- Add Arrows -->
								<div class="swiper-button-next"></div>
								<div class="swiper-button-prev"></div>
							</div>

							<!-- Initialize Swiper -->
							<script>
							var swiper = new Swiper('.swiper-container', {
								nextButton: '.swiper-button-next',
								prevButton: '.swiper-button-prev',
								pagination: '.swiper-pagination',
								paginationType: 'fraction'
							});
							</script>





				</div>
				<div class="preview_infotext">
					기존에 입력하신 가게 소개글이 자동으로 노출됩니다.
				</div>
				<div class="preview_dotted"></div>
				<div class="preview_event_title">
					2016.06.08 ~ 2016.06.14
					<p>이벤트명이 노출됩니다.</p>
				</div>
				<div class="preview_event_infotext color_brown">
				메인메뉴 포함 모든 와인 주문시, 20% 할인 .. 많은 이용 바랍니다. 이벤트 내용이 노출되는 공간 길면 길수록 스크롤 생성<br />메인메뉴 포함 모든 와인 주문시, 20% 할인 .. 많은 이용 바랍니다. 이벤트 내용이 노출되는 공간 길면 길수록 스크롤 생성<br />메인메뉴 포함 모든 와인 주문시, 20% 할인 .. 많은 이용 바랍니다. 이벤트 내용이 노출되는 공간 길면 길수록 스크롤 생성<br />
				</div>
			</div><!-- END preview_area //-->

		</div>
		</div>

		<!-- 모바일에서 노출되는 팝업 미리보기 끝 //-->







				</li>
				<script type="text/javascript">
				$("div.gab_box > div > input").focus(function() {
					$(this).attr('class','regis_input_focus');
				});
				$("div.gab_box > div > input").blur(function() {
					$(this).attr('class','regis_input_blur');
				});
				</script>




				<!-- 우측 콘텐츠 //-->
				<li class="right rightpadding">

					<!-- 상단 칸 //-->
					<div class="cont_area ev_regis_subject rightpadd" >
						<p>등록 전 이벤트를 미리 볼 수 있습니다.</p>
						<span class="title">미리보기</span>
					</div>



					<!-- 하단 칸 //-->
					<div class="cont_area mt20" >
					<div class="preview_area">

						<p class="category_icon"><img src="/src/owner/images/contents/category_01.png" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart.png" /><p>

						<div class="preview_title">
							업종키워드
							<p class="color_brown">가게명 노출</p>
						</div>

						<div class="preview_img">

							<!-- 터치 포함 슬라이드 이미지 //-->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide"><img src="/src/owner/images/contents/noimg.jpg" /></div>
									<div class="swiper-slide"><img src="/src/owner/images/contents/@sample_img_001.jpg" /></div>
								</div>
								<!-- Add Pagination -->
								<div class="swiper-pagination"></div>
								<!-- Add Arrows -->
								<div class="swiper-button-next"></div>
								<div class="swiper-button-prev"></div>
							</div>

							<!-- Initialize Swiper -->
							<script>
							var swiper = new Swiper('.swiper-container', {
								nextButton: '.swiper-button-next',
								prevButton: '.swiper-button-prev',
								pagination: '.swiper-pagination',
								paginationType: 'fraction'
							});
							</script>


						</div>

						<div class="preview_infotext">
						기존에 입력하신 가게 소개글이 자동으로 노출됩니다.
						</div>

						<div class="preview_dotted"></div>

						<div class="preview_event_title">
							2016.06.08 ~ 2016.06.14
							<p>이벤트명이 노출됩니다.</p>
						</div>

						<div class="preview_event_infotext color_brown">
						기존에 입력하신 가게 소개글이 자동으로 노출됩니다.
						</div>

						<div class="preview_btn_area">
							<p><a href="#">자세히</a></p>
							<p class="gocart"><a href="#">담기</a></p>
						</div>
					</div><!-- END preview_area //-->

					</div><!-- END cont_area //-->






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