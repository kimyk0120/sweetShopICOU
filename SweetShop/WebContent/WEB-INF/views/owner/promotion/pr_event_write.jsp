<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

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
<c:import url="/src/owner/jsp/upload.jsp" charEncoding="UTF-8" />
<c:import url="/src/owner/jsp/gallery.jsp" charEncoding="UTF-8" />
</head>
<script>
	//달력(datepicker) 초기화

	$(document).ready(
			function() {

				var attr = '${shop_detail}';
				console.log("=============");
				console.log(attr);
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
									yearSuffix : '년',
									onSelect : function(dateText, inst) {
										eventTitleChange();

										setDate($('#datepicker1').val(), $(
												'#datepicker2').val());
									}
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
										eventTitleChange();

										setDate($('#datepicker1').val(), $(
												'#datepicker2').val());
									}

								});

				setDate("", "");
			})

	function setDate(sDate, eDate) {
		if (sDate == "" || eDate == "") {
			eDate = new Date();
			sDate = new Date();
			sDate.setDate(eDate.getDate());
			$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
			$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

			var guide_tag = "현재, <span>" + (eDate - sDate + 1)
					+ "일</span>, 동안 이벤트가 진행 될 예정입니다.";
			$(".guide_text").html(guide_tag);
		} else {
			var arr1 = sDate.split('-');
			var arr2 = eDate.split('-');
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			var diff = dat2 - dat1;
			var currDay = 24 * 60 * 60 * 1000;
			var cal = ((dat2 - dat1) / currDay + 1).toFixed(0);

			$('#datepicker1').val(sDate);
			$('#datepicker2').val(eDate);

			var guide_tag = "현재, <span>" + cal
					+ "일</span>, 동안 이벤트가 진행 될 예정입니다.";
			$(".guide_text").html(guide_tag);
		}

		eventTitleChange();
	}
</script>
<script>
	//thumb image galley 업로드 부분
	function changeImageData(data) {
		console.log(data.file_name);

		thumbRefresh(".item_cont_area");
		galleryRefresh(".preview_img .swiper-container .swiper-wrapper");

		item_index++;
		item_id++;
	}
</script>
<script>
	var space = "        ";
	var selected_type_tab = "A";
	var selected_type = "M";

	function selectTypeDC(code) {
		selected_type = code;

		if (code == "M") {
			$("#typeDC").val("금액할인" + space);
		} else if (code == "P") {
			$("#typeDC").val("%할인" + space);
		}
	}
	function selectTypeService(code) {
		selected_type = code;
		if (code == "O") {
			$("#typeService").val("1+1" + space);
		} else if (code == "T") {
			$("#typeService").val("2+1" + space);
		} else if (code == "U") {
			$("#typeService").val("사이즈 업" + space);
		} else if (code == "S") {
			$("#typeService").val("서비스 품목 제공" + space);
		}
	}

	$(function() {
		$("#event_subject").keydown(function() {
			eventTitleChange();
		});

		$("#event_desc_input").keydown(function() {
			eventDescChange();
		});
		$("#event_subject").focusout(function() {
			eventTitleChange();
		});

		$("#event_desc_input").focusout(function() {
			console.log("!!");
			eventDescChange();
		});
	});

	function eventTitleChange() {
		var tag = $('#datepicker1').val() + " ~ " + $('#datepicker2').val()
				+ "<p>" + $("#event_subject").val() + "</p>";
		/* console.log("key input...."+tag); */


		$('.preview_infotext').html('${shop_card_detail.shop_intro}');
		$(".preview_event_title").html(tag);
	}

	function eventDescChange() {
		var tag = $('#event_desc_input').val();
		/* console.log("key input...."+tag); */
		$(".preview_event_infotext").html(newLineChange(tag));
	}
	function eventImageChange() {
		var tag = $('#event_desc_input').val();
		/* console.log("key input...."+tag); */
		$(".preview_event_infotext").html(newLineChange(tag));
	}

	function tabChange(tab) {
		selected_type_tab = tab;
		console.log("tab : " + tab);

		if (tab == "A") {
			$(".tab1").show();
			$(".tab2").hide();
			$("#A").attr('class', 'on');
			$("#B").attr('class', '');
		} else if (tab == "B") {
			$(".tab2").show();
			$(".tab1").hide();
			$("#A").attr('class', '');
			$("#B").attr('class', 'on');
		}
	}

	function saveCall() {

		if($("#event_subject").val()==""){
			alert("이벤트 제목을 입력해주세요");
			return;
		}
		if(img_array.length==0){
			alert("1개이상의 이미지 등록이 필요합니다.");
			return;
		}
		var url = "/shop_event_save.json";
		var pum = "";
		var value = "";
		if (selected_type_tab == "A") {
			pum = $("#pum").val();
			value = $("#dc_value").val()
		} else if (selected_type_tab == "B") {
			pum = $("#pum2").val();
			value = $("#service_value").val()
		}

		var comment = newLineChange($('#event_desc_input').val());


		/* console.log(img_array[0]);
		console.log(selected_type_tab + "," + pum + "," + value + ","
				+ selected_type + "," + event_desc_input); */
		$.post(url, {
			shop_seq : '${shop_detail.shop_seq}',
			event_title : $("#event_subject").val(),
			event_status : 0,
			event_kind : selected_type_tab,
			event_discount_way : selected_type,
			event_discount_target : pum,
			event_discount : value,
			event_detail_desc : comment,
			event_start_day : $('#datepicker1').val(),
			event_end_day : $('#datepicker2').val(),
			event_img_list : JSON.stringify(img_array)
		}, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if (obj.result == "success") {
				var url = "/pr_event_list.do";
				alert("저장을 성공하였습니다");
				$(location).attr('href', url);
			} else {
				alert("저장을 실패하였습니다");
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("서버와의 연결을 실패하였습니다");
		});
	}
</script>
<body>


	<div id="wrap">


		<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
			<c:param name="index" value="5" />
		</c:import>
		<c:choose>
	<c:when test="${shop_detail.shop_kind eq '000'}">
		<!-- 미용 / 스파 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_beauty.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '001'}">
		<!-- 헤어 / 메이크업 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_hair.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '002'}">
		<!-- 부동산 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_realty.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '003'}">
		<!-- 빵집 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_bakery.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '004'}">
		<!-- 숙박 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_stay.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '005'}">
		<!-- 슈퍼 / 마트 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_super.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '006'}">
		<!-- 약국 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_pharmacy.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '007'}">
		<!-- 음식점 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_food.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '008'}">
		<!-- 카페 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_cafe.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '009'}">
		<!-- 인테리어 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_interier.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '010'}">
		<!-- 청소 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_clean.png" />
	</c:when>
	<c:when test="${shop_detail.shop_kind eq '011'}">
		<!-- 스포츠 -->
		<c:set var="shopKindImg"
			value="/src/user/images/common/ribbon_sports.png" />
	</c:when>
</c:choose>



		<div id="container">

			<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
				<c:param name="index" value="5" />
			</c:import>



			<!-- 우측 콘텐츠의 시작 //-->
			<div id="content_area">
				<h3>
					<img src="/src/owner/images/contents/h3_img_03.png" alt="" /><span>홍보ㆍ마케팅
						상품 &nbsp; &gt; &nbsp; </span> 이벤트
				</h3>


				<div class="guide_area_wide">
					<ul>
						<li class="guide_wid"><span>현재 우리가게 고객 현황과 이벤트를 한눈에
								확인하실 수 있습니다.</span></li>
					</ul>
				</div>
				<!-- END guide_area //-->





				<div class="half_box">
					<ul>
						<!-- 좌측 콘텐츠 //-->
						<li class="left">
							<!-- 상단칸//-->
							<div class="cont_area ">
								<div class="ev_regis_subject">
									<jsp:useBean id="toDay" class="java.util.Date" />
									<p>
										<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" />
									</p>
									<input type="text" id="event_subject" class="regis_input_blur"
										placeholder=" 이벤트 명을 입력하여 주세요.">
								</div>
							</div> <!-- 하단칸 //-->
							<div class="cont_area ev_regis_cont mt20">
								<ul class="tap_menu">
									<li id="A" class="on"><a href="javascript:tabChange('A')">할인
											이벤트</a>
									<li>
									<li id="B"><a href="javascript:tabChange('B')">혜택 제공
											이벤트</a>
									<li>
								</ul>


								<div class="gab_box">
									<div class="tab1">
										<label for="pum">할인 이벤트 품목</label> <input type="text" id="pum"
											class="regis_input_blur" placeholder="할인 이벤트 품목을 입력해 주세요.">
									</div>

									<div class="w_half whleft tab1">
										<label for="typeDC">할인 방식</label> <input type="text"
											id="typeDC" class="regis_input_blur bg_arrow"
											onclick="suggest(1);"
											style="background: url('/src/owner/images/contents/arrow_btm.png') no-repeat 98% center;"
											value="금액할인        " placeholder="방식을 선택해 주세요.        ">
										<!-- 반응형웹 사이즈 문제로 화살표가 들어가는 인풋화면에서는 플레이스홀더 옆에 8칸 비워주세요 !! //-->
										<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
										<script type="text/javascript">
										<!--
											function suggest(num) {
												document
														.getElementById('suggest_'
																+ num).style.display = "";
											}
										//-->
										</script>
										<div class="business_type" id="suggest_1"
											style="display: none;">
											<ul>
												<li><a href="javascript:selectTypeDC('M')"
													class="close"><span class="stile_vh">할인방식</span>금액할인</a></li>
												<li><a href="javascript:selectTypeDC('P')"
													class="close"><span class="stile_vh">할인방식</span>%할인</a></li>
											</ul>
										</div>
										<script type="text/javascript">
											$(".close").click(
													function() {
														$("#suggest_1").css(
																"display",
																"none");
													});
											$suggest_checking = $("#suggest_1");
											$suggest_checking.hover(
													function() {
														$(this).css("display",
																"block");
													}, function() {
														$(this).css("display",
																"none");
													});
										</script>
									</div>
									<div class="w_half whright tab1">
										<label for="dc_value">할인 입력</label> <input type="text"
											id="dc_value" class="regis_input_blur"
											placeholder="할인방식 선택 후 입력해 주세요.">
									</div>

									<div class="tab2" style="display: none">
										<label for="pum2">적용 서비스 품목</label> <input type="text"
											id="pum2" class="regis_input_blur"
											placeholder="혜택이 적용될 서비스 품목을 입력해 주세요."
											style="font-size: 14px;">
									</div>

									<div class="w_half whleft tab2" style="display: none">
										<label for="typeService">제공 혜택</label> <input type="text"
											id="typeService" class="regis_input_blur bg_arrow"
											onclick="suggest(2);"
											style="width: 92%; padding-right: 8%; background: url('/src/owner/images/contents/arrow_btm.png') no-repeat 98% center;"
											placeholder="서비스 품목 제공">
										<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
										<div class="business_type" id="suggest_2"
											style="display: none;">
											<ul>
												<li><a href="javascript:selectTypeService('O')"
													class="close"><span class="stile_vh">제공혜택</span>1+1</a></li>
												<li><a href="javascript:selectTypeService('T')"
													class="close"><span class="stile_vh">제공혜택</span>2+1</a></li>
												<li><a href="javascript:selectTypeService('U')"
													class="close"><span class="stile_vh">제공혜택</span>사이즈업</a></li>
												<li><a href="javascript:selectTypeService('S')"
													class="close"><span class="stile_vh">제공혜택</span>서비스 품목
														제공</a></li>
											</ul>
										</div>
										<script type="text/javascript">
											$(".close").click(
													function() {
														$("#suggest_2").css(
																"display",
																"none");
													});
											$suggest_checking = $("#suggest_2");
											$suggest_checking.hover(
													function() {
														$(this).css("display",
																"block");
													}, function() {
														$(this).css("display",
																"none");
													});
										</script>
									</div>
									<div class="w_half whright tab2" style="display: none">
										<label for="service_value" class="hide">제공 혜택 직접입력</label> <input
											type="text" id="service_value" class="regis_input_blur"
											placeholder="제공되어질 서비스 품목을 입력해주세요.">
									</div>

									<div class="design evimgbox on">
										<!-- 이벤트 이미지쪽 작업시 클래스 on 추가하면 라인 블루색으로 조정 됨 //-->
										<div class="title">이벤트 이미지</div>
										<div class="cont">
											<div class="item_cont_area">
												<div id="holder" class="photo" style="display: none;">
													<img src="/src/admin/images/contents/@img_photo.jpg" />
												</div>
												<p class="more_green ml20">
													<img src="/src/owner/images/contents/icon_camera.png"
														onclick='document.all.file.click();' />
												</p>
												<form id="frm" action="/event_img_upload.do" method="post"
													encType="multipart/form-data">
													<p>
														<input type="file" id="file" name="event_img_file"
															style='display: none;'>
													</p>
												</form>
											</div>
										</div>
									</div>

									<div class="design_textarea">
										<label for="event_desc_input">상세 설명</label>
										<textarea class="write_input_blur" id="event_desc_input"></textarea>
										<script type="text/javascript">
											$(document)
													.ready(
															function() {
																$(
																		'.design_textarea')
																		.on(
																				'keyup',
																				'textarea',
																				function(
																						e) {
																					$(
																							this)
																							.css(
																									'height',
																									'auto');
																					$(
																							this)
																							.height(
																									this.scrollHeight);
																				});
																$(
																		'.design_textarea')
																		.find(
																				'textarea')
																		.keyup();
															});

											$("div.design_textarea  textarea")
													.focus(
															function() {
																$(this)
																		.attr(
																				'class',
																				'write_input_focus');
															});
											$("div.design_textarea  textarea")
													.blur(
															function() {
																$(this)
																		.attr(
																				'class',
																				'write_input_blur');
															});
										</script>
									</div>

									<div class="design">
										<!-- 이벤트 이미지쪽 작업시 클래스 on 추가하면 라인 블루색으로 조정 됨 //-->
										<div class="title">이벤트 기간</div>
										<div class="cont tar">
											<span class="seach_date"> <input type="text"
												id="datepicker1" class="seach_date_input_blur"
												value="2016.06.4" title="시작일 선택" readonly="readonly">
												&nbsp; ~ &nbsp; <input type="text" id="datepicker2"
												class="seach_date_input_blur" value="2016.06.11"
												title="종료일 선택" readonly="readonly"> <!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
												<script type="text/javascript">
												<!--
													function seach_date(num) {
														document
																.getElementById('seach_date_'
																		+ num).style.display = "";
													}
												//-->
												</script>
											</span>
										</div>
									</div>
									<p class="guide_text">
										현재, (<span>7일</span>, 1주일) 동안 이벤트가 진행 될 예정입니다.
									</p>


									<div class="btn_regis_area">
										<p>
											<a href="javascript:saveCall()">등록</a>
										</p>
										<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
										<p class="cancle">
											<a href="/pr_event_list.do">취소</a>
										</p>
									</div>






								</div>

							</div> <!-- 767 이하 1칸 조정되면서 미리보기 아이콘 노출 시작 //-->
							<div class="btn_floatting_area">
								<p class="more_green">
									<a onclick="go_popup()" style='cursor: pointer; cursor: hand;'><img
										src="/src/owner/images/contents/btn_icon_flotting.png" /></a>
								</p>
							</div> <!-- 모바일에서 노출되는 팝업 미리보기 //--> <script
								src="/src/owner/js/jquery.bpopup.min.js"></script> <script
								type="text/javascript">
									function go_popup() {
										$('#preview_layer').bPopup({
											speed : 650,
											transition : 'slideDown',
											transitionClose : 'slideBack'
										});
									};
								</script>


							<div id="preview_layer" class="preview_layer">
								<p class="more_green preview_close">
									<a href="#" class="b-close"><img
										src="/src/owner/images/contents/btn_icon_flotting.png" /></a>
								</p>
								<div class="preview_cont">


									<div class="preview_area mb30">
										<p class="category_icon">
											<img src="${shopKindImg}" />
										<p>
										<div class="preview_title">
											${shop_detail.code_name}
											<p>${shop_detail.shop_name}</p>
										</div>
										<div class="preview_img">
											<div class="swiper-container">
												<div class="swiper-wrapper">
													<div class="swiper-slide">
														<img src="/src/owner/images/contents/noimg.jpg" />
													</div>
												</div>
												<!-- Add Pagination -->
												<div class="swiper-pagination"></div>
												<!-- Add Arrows -->
												<div class="swiper-button-next"></div>
												<div class="swiper-button-prev"></div>
											</div>

											<!-- Initialize Swiper -->
											<script>
												var swiper = new Swiper(
														'.swiper-container',
														{
															nextButton : '.swiper-button-next',
															prevButton : '.swiper-button-prev',
															pagination : '.swiper-pagination',
															paginationType : 'fraction'
														});
											</script>
										</div>
										<div class="preview_infotext">기존에 입력하신 가게 소개글이 자동으로
											노출됩니다.</div>
										<div class="preview_dotted"></div>
										<div class="preview_event_title"></div>
										<div class="preview_event_infotext">
											메인메뉴 포함 모든 와인 주문시, 20% 할인 .. 많은 이용 바랍니다. 이벤트 내용이 노출되는 공간 길면
											길수록 스크롤 생성<br />메인메뉴 포함 모든 와인 주문시, 20% 할인 .. 많은 이용 바랍니다. 이벤트
											내용이 노출되는 공간 길면 길수록 스크롤 생성<br />메인메뉴 포함 모든 와인 주문시, 20% 할인 ..
											많은 이용 바랍니다. 이벤트 내용이 노출되는 공간 길면 길수록 스크롤 생성<br />
										</div>
									</div>
									<!-- END preview_area //-->

								</div>
							</div> <!-- 모바일에서 노출되는 팝업 미리보기 끝 //--> <script type="text/javascript">
								$("div.gab_box > div > input").focus(
										function() {
											$(this).attr('class',
													'regis_input_focus');
										});
								$("div.gab_box > div > input").blur(function() {
									$(this).attr('class', 'regis_input_blur');
								});
							</script> <!-- 우측 콘텐츠 //-->
						<li class="right rightpadding">
							<!-- 상단 칸 //-->
							<div class="cont_area ev_regis_subject rightpadd">
								<p>등록 전 이벤트를 미리 볼 수 있습니다.</p>
								<span class="title">미리보기</span>
							</div> <!-- 하단 칸 //-->
							<div class="cont_area mt20">
								<div class="preview_area">

									<p class="category_icon">
										<img src="${shopKindImg}" />
									<p>
									<p class="heart_icon">
										<img src="/src/owner/images/contents/icon_heart.png" />
									<p>
									<div class="preview_title">
										${shop_detail.code_name}
										<p>${shop_detail.shop_name}</p>
									</div>

									<div class="preview_img">
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<img src="/src/owner/images/contents/noimg.jpg" />
												</div>
											</div>
											<!-- Add Pagination -->
											<div class="swiper-pagination"></div>
											<!-- Add Arrows -->
											<div class="swiper-button-next"></div>
											<div class="swiper-button-prev"></div>
										</div>

										<!-- Initialize Swiper -->
										<script>
											var swiper = new Swiper(
													'.swiper-container',
													{
														nextButton : '.swiper-button-next',
														prevButton : '.swiper-button-prev',
														pagination : '.swiper-pagination',
														paginationType : 'fraction'
													});
										</script>
									</div>

									<div class="preview_infotext">기존에 입력하신 가게 소개글이 자동으로
										노출됩니다.</div>

									<div class="preview_dotted"></div>

									<div class="preview_event_title">
										2016.06.08 ~ 2016.06.14
										<p>이벤트명이 노출됩니다.</p>
									</div>

									<div class="preview_event_infotext">기존에 입력하신 가게 소개글이 자동으로
										노출됩니다.</div>

									<div class="preview_btn_area">
										<p>
											<a href="#">자세히</a>
										</p>
										<p class="gocart">
											<a href="#">담기</a>
										</p>
									</div>
								</div>
								<!-- END preview_area //-->

							</div>
							<!-- END cont_area //-->






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