<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

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
	<c:import url="/src/owner/jsp/upload.jsp" charEncoding="UTF-8" />
	<c:import url="/src/owner/jsp/imagePreView.jsp" charEncoding="UTF-8" />
</head>
<script>
	//달력(datepicker) 초기화
	$(document).ready(function(){

		var attr = '${shop_detail}';
		var attr2 = '${promotion_detail}';

		console.log("=============");
		//console.log(attr);
		//console.log(attr2);
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
		    yearSuffix: '년',
		    onSelect: function (dateText, inst) {
		    	eventTitleChange();

		    	setDate($('#datepicker1').val(), $('#datepicker2').val());
		    }
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
		    	eventTitleChange();

		    	setDate($('#datepicker1').val(), $('#datepicker2').val());
	    	}

		});

		setDate("","");
	})


	function setDate(sDate, eDate){
		if(sDate=="" || eDate ==""){
			eDate = new Date();
			sDate = new Date();
			sDate.setDate(eDate.getDate());
			$('#datepicker1').val($.datepicker.formatDate('yy-mm-dd', sDate));
			$('#datepicker2').val($.datepicker.formatDate('yy-mm-dd', eDate));

			var guide_tag = "현재, <span>"+(eDate-sDate+1)+"일</span>, 동안 이벤트가 진행 될 예정입니다.";
			$(".guide_text").html(guide_tag);
		}else{
			var arr1 = sDate.split('-');
			var arr2 = eDate.split('-');
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			var diff = dat2 - dat1;
			var currDay = 24*60*60*1000;
			var cal = ((dat2-dat1)/currDay+1).toFixed(0) ;

			$('#datepicker1').val(sDate);
			$('#datepicker2').val(eDate);
			console.log("22   / " + dat2);
			console.log("22   / " + dat1);
			var guide_tag = "현재, <span>"+cal+"일</span>, 동안 이벤트가 진행 될 예정입니다.";
			$(".guide_text").html(guide_tag);
		}

		var comment = '${promotion_detail.promotion_detail_desc}';

		comment = brChange(comment);

		$('#event_desc_input').val(comment);

		eventTitleChange();
		eventDescChange();
		initImageSet();
	}


</script>
<script>
	//업로드 성공시 화면에 세팅하는 부분
	function changeImageData(data){
		console.log(data.file_name);
		imageSet(".preview_image");

		item_index++;
	}

	function initImageSet(){
		var img_obj = new Object();

		var imgp = '${promotion_detail.img_path}';
		console.log("promotion_detail.img_path" + (imgp==""));

		if(imgp==""){
			$(".preview_image").attr("src", "/src/owner/images/contents/noimg.jpg");
		}else{
			img_obj.img_path = '${promotion_detail.img_path}';
			img_obj.img_file_name = '${promotion_detail.img_file_name}';
			img_obj.img_org_name = '${promotion_detail.img_org_name}';
			img_obj.event_order = item_index;

			img_array.push(img_obj);

			imageSet(".preview_image");

			item_index++;
		}
	}

</script>
<script>
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

	function eventDescChange(){
		var tag = $('#event_desc_input').val();
		/* console.log("key input...."+tag); */
		$(".preview_event_infotext").html(newLineChange(tag));
	}

	function eventTitleChange(){
		var tag = $('#datepicker1').val()+" ~ "+$('#datepicker2').val()+"<p>"+$("#event_subject").val()+"</p>";
		/* console.log("key input...."+tag); */
		$('.preview_infotext').html('${shop_card_detail.shop_intro}');
		$(".preview_event_title").html(tag);
	}

	function saveCall() {

		var url = "/shop_promotion_update.json";

		var img_obj;
		var param = new Object();

		var comment = newLineChange($('#event_desc_input').val());

		if(img_array.length > 0){
			img_obj = img_array[item_index-1];
			param = {
					promotion_seq:'${promotion_detail.promotion_seq}',
					promotion_detail_desc:comment,
					promotion_start_day:$('#datepicker1').val(),
					promotion_end_day:$('#datepicker2').val(),
					promotion_status:0,
					img_path:img_obj.img_path,
					img_file_name:img_obj.img_file_name,
					img_org_name:img_obj.img_org_name
			};
		}else{
			param = {
					promotion_seq:'${promotion_detail.promotion_seq}',
					promotion_detail_desc:comment,
					promotion_start_day:$('#datepicker1').val(),
					promotion_end_day:$('#datepicker2').val(),
					promotion_status:0
			};
		}

		console.log(img_obj);
		$.post(url, param
			, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/pr_handbill_list.do";
				alert("저장을 성공하였습니다");
				$(location).attr('href',url);
			}else{
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
	<c:param name="index" value="6" />
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
		<c:param name="index" value="6" />
	</c:import>
	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_03.png" alt=""  /><span>홍보ㆍ마케팅 상품 &nbsp; &gt; &nbsp; </span> 홍보전단</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>현재 우리가게 홍보전단 현황을 한눈에 확인하실 수 있습니다.</span></li>
			</ul>
		</div><!-- END guide_area //-->





		<div class="half_box">
			<ul>
				<!-- 좌측 콘텐츠 //-->
				<li class="left">

					<!-- 상단칸//-->
					<div class="cont_area ">
						<div class="ev_regis_subject">
							<jsp:useBean id="toDay" class="java.util.Date" />
							<p><fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" /></p>
							<input type="text" id="event_subject" class="regis_input_blur" placeholder="홍보전단 명을 입력하여 주세요."
									style="display:none">
						</div>
					</div>

					<!-- 하단칸 //-->
					<div class="cont_area ev_regis_cont mt20">

						<div class="gab_box">


							<div class="photo">
								<ul>
									<li class="title">
										홍보 전단 이미지
										<p class="mb10">가게 홍보전단의 대표 이미지를 등록해 주세요.</p>
										<p>사이즈 : 500*500px<br />용량 : 500MB 이하로<br />등록해 주세요</p>
									</li>
									<li class="photobox">
										<div class="photo_in">
											<img class="preview_image" src="/src/owner/images/contents/noimg.jpg"
												onError="this.src='/src/owner/images/contents/noimg.jpg';" alt="이미지 등록"  style="width:100%; max-width:250px; height:auto;" />
											<div id="holder" class="photo" style="display:none;">
												<img src="/src/admin/images/contents/@img_photo.jpg" />
											</div>
											<p class="more_photo"><img src="/src/owner/images/contents/icon_camera.png"  onclick='document.all.file.click();'/></p>
											<form id="frm" action="/shop_pr_img_upload.do" method="post" encType="multipart/form-data">
												<p><input type="file" id="file"  name="event_img_file" style='display: none;'></p>
											</form>
										</div>
									</li>
								</ul>
							</div>


							<!--
							<div>
								<label for="pum">가게 홈페이지 주소(선택입력)</label>
								<input type="text" id="pum" class="regis_input_blur"  placeholder="" style="font-size:14px;">
							</div>
 							-->

							<div class="design_textarea">
								<div class="title">상세 설명</div>
										<textarea id="event_desc_input" placeholder="이용방법, 유의사항, 영업시간, 위치 등  &#13;&#10; 이미지에 홍보 문구가 없을 경우 추가적인 설명을 입력해 주세요." class="write_input_blur"></textarea>


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
								<div class="title">홍보 기간</div>
								<div class="cont tar">
								<span class="seach_date">
									<input type="text" id="datepicker1" class="seach_date_input_blur" value="2016.06.4" title="시작일 선택" readonly="readonly"  >
									&nbsp; ~ &nbsp;
									<input type="text" id="datepicker2" class="seach_date_input_blur" value="2016.06.11"  title="종료일 선택" readonly="readonly" >
									<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
									<script type="text/javascript">
									<!--
									function seach_date(num){
									document.getElementById('seach_date_' + num ).style.display = "";
									}
									//-->
									</script>
									</span>
								</div>
							</div>

							<p class="guide_text">현재, (<span>30일</span>, 1달) 동안 홍보가 진행 될 예정입니다.</p>


							<div class="btn_regis_area">
								<p><a href="javascript:saveCall()">수정</a></p>
								<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
								<p class="cancle"><a href="/pr_handbill_list.do">취소</a></p>
							</div>






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
				<p class="category_icon"><img src="${shopKindImg}" /><p>
				<div class="preview_title">
					${shop_detail.code_name}
				<p class="color_sky">${shop_detail.shop_name}</p>
				</div>

				<div class="preview_img">
					<img class="preview_image" src="/src/owner/images/contents/noimg.jpg" />
				</div>
				<div class="preview_infotext">
					기존에 입력하신 가게 소개글이 자동으로 노출됩니다.
				</div>
				<div class="preview_dotted"></div>
				<div class="preview_event_title">
					2016.06.08 ~ 2016.06.14
					<p>홍보전단명이 노출됩니다.</p>
				</div>
				<div class="preview_event_infotext color_sky">
				${promotion_detail.promotion_detail_desc}
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
						<p>예정 홍보전단을 미리 볼 수 있습니다.</p>
						<span class="title">미리보기</span>
					</div>



					<!-- 하단 칸 //-->
					<div class="cont_area mt20" >
					<div class="preview_area">

						<p class="category_icon"><img src="${shopKindImg}" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart.png" /><p>

						<div class="preview_title">
							${shop_detail.code_name}
							<p class="color_sky">${shop_detail.shop_name}</p>
						</div>

						<div class="preview_img">
							<img class="preview_image" src="/src/owner/images/contents/noimg.jpg" />
						</div>

						<div class="preview_infotext">
						기존에 입력하신 가게 소개글이 자동으로 노출됩니다.
						</div>

						<div class="preview_dotted"></div>

						<div class="preview_event_title">
							2016.06.08 ~ 2016.06.14
							<p>홍보전단명이 노출됩니다.</p>
						</div>

						<div class="preview_event_infotext color_sky">
						${promotion_detail.promotion_detail_desc}
						</div>

						<div class="preview_btn_area">
							<p><a href="#">자세히</a></p>
							<p class="gocart color_sky_bg"><a href="#" >챙기기</a></p>
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