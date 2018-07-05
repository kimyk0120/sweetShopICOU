<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	$(document).ready(function(){

		var attr = '${shop_detail}';
		var attr2 = '${shop_card_detail}';
		console.log("shop_detail=============");
		console.log('${shop_card_detail.etc_text}');
		console.log("shop_card_detail=============");
		console.log(attr2);
		console.log("=============");

		layoutSet();
	});
</script>
<script>
	$(function() {
		$("#shop_info_text").keyup(function() {
			eventInfoChange();
		});

		$("#etc_text_area").keyup(function() {
			eventDescChange();
		});

		$("#shop_info_text").focusout(function() {
			eventInfoChange();
		});

		$("#etc_text_area").focusout(function() {
			eventDescChange();
		});
	});
/* 	var into = ${shop_card_detail.shop_intro};
	into */

	function eventInfoChange(){
		var tag = $('#shop_info_text').val();

		/* console.log("key input...."+tag); */
		$(".preview_infotext").html(newLineChange(tag));
	}

	function eventDescChange(){
		var tag = $('#etc_text_area').val();

		/* console.log("key input...."+tag); */
		$(".etc_detail_text").html(newLineChange(tag));
	}

	//업로드 성공시 화면에 세팅하는 부분
	function changeImageData(data){
		console.log(data.file_name);
		imageSet(".preview_image");

		item_index++;
	}

	function layoutSet(){
		var card = '${shop_card_detail}';
		if(card == ""){
			console.log("empty card");

			$(".reg").show();
			$(".modify").hide();
		}else{
			console.log("have card");

			$(".reg").hide();
			$(".modify").show();
			/* shop_card_detail.etc_text */
			$('#shop_info_text').val(brChange('${shop_card_detail.shop_intro}'));
			$('#etc_text_area').val(brChange('${shop_card_detail.etc_text}'));
			eventDescChange();
			initImageSet();
		}
	}

	function initImageSet(){
		var img_obj = new Object();

		var imgp = '${shop_card_detail.img_path}';
		console.log("shop_card_detail.img_path" + (imgp==""));

		if(imgp==""){
			$(".preview_image").attr("src", "/src/owner/images/contents/noimg.jpg");
		}else{
			img_obj.img_path = '${shop_card_detail.img_path}';
			img_obj.img_file_name = '${shop_card_detail.img_file_name}';
			img_obj.img_org_name = '${shop_card_detail.img_org_name}';
			img_obj.event_order = item_index;

			img_array.push(img_obj);

			imageSet(".preview_image");

			item_index++;
		}
	}

	function saveCall(url) {

		var img_obj = img_array[item_index-1];
		var param = new Object();
		console.log("img_array.length ? " + img_array.length);

		var shop_intro = newLineChange($("#shop_info_text").val());
		var shop_etc = newLineChange($("#etc_text_area").val());




		if(img_array.length > 0){
			console.log("img_array.path ? " + img_obj.img_path);

			img_obj = img_array[item_index-1];
			param = {
					shop_seq:"${shop_detail.shop_seq}",
					shop_intro:shop_intro,
					etc_text:shop_etc,
					img_path:img_obj.img_path,
					img_file_name:img_obj.img_file_name,
					img_org_name:img_obj.img_org_name
			};
		}else{
			param = {
					shop_seq:"${shop_detail.shop_seq}",
					shop_intro:shop_intro,
					etc_text:shop_etc
			};
		}
		$.post(url, param
		, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/pr_shopcard.do";
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
	<c:param name="index" value="7" />
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
<c:set var="addr" value="${shop_detail.shop_addr1}"/>
<c:set var="addrArr" value="${fn:split(addr,' ')}"/>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="7" />
	</c:import>

	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_03.png" alt=""  /><span>홍보ㆍ마케팅 상품 &nbsp; &gt; &nbsp; </span> 가게명함</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>현재 우리가게 가게명함 현황을 한눈에 확인하실 수 있습니다.</span></li>
			</ul>
		</div><!-- END guide_area //-->





		<div class="half_box">
			<ul>
				<!-- 좌측 콘텐츠 //-->
				<li class="left">

					<!-- 하단칸 //-->
					<div class="cont_area ev_regis_cont">

						<div class="gab_box">



							<div class="photo" style="padding-top:20px;">
								<div class="photp_card_title">
									<p class="date">
									<jsp:useBean id="toDay" class="java.util.Date" />
									<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" />
									</p>
									<p class="title"><strong class="color_darkblue">${shop_detail.shop_name}</strong> 가게명함</p>
									<p class="g_text">고정되어 있는 부분은 회원정보 수정페이지에서 수정해 주세요.<br />가게명함에 자동으로 반영됩니다.</p>
								</div>
								<ul>
									<li class="title">
										가게 명함 이미지
										<p class="mb10">가게 명함 이미지를 등록해 주세요.</p>
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
											<form id="frm" action="/shop_card_img_upload.do" method="post" encType="multipart/form-data">
												<p><input type="file" id="file"  name="shop_card_img_file" style='display: none;'></p>
											</form>
										</div>
									</li>
								</ul>
							</div>


							<div>
								<label for="shoptype">업종</label>
								<input type="text" id="shoptype" class="regis_input_blur" readonly="readonly"  value="${shop_detail.code_name}">
							</div>

							<div>
								<label for="shopgu">입점지역</label>
								<input type="text" id="shopgu" class="regis_input_blur" readonly="readonly"  value="${shop_detail.shop_addr1}" >
							</div>

							<div>
								<label for="shoptel">가게 전화</label>
								<input type="text" id="shoptel" class="regis_input_blur" readonly="readonly" value="${shop_detail.shop_tel}" >
							</div>


							<div class="design_textarea">
								<div class="title"><span class="orange">* 두줄 소개</span></div>
								<textarea id="shop_info_text"  class="write_input_blur">

								</textarea>
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
							<p class="guide_text">40자 내외로 적어주세요.</p>

							<div>
								<label for="shoptel">* 주요 메뉴</label>
								<input type="text" id="shoptel" class="regis_input_blur" readonly="readonly"  value="${shop_detail.shop_menu}" >
							</div>



					<div>
						<label for="shophp">휴대전화</label>
						<input type="text" id="shophp" class="regis_input_blur" readonly="readonly" value="${shop_detail.shop_phone}">
					</div>


					<script>
					function cmaTextareaSize(obj, bsize) { // 객체명, 기본사이즈
						var sTextarea = document.getElementById(obj);
						var csize = (sTextarea.scrollHeight >= bsize) ? sTextarea.scrollHeight+"px" : bsize+"px";
						sTextarea.style.height = bsize+"px";
						sTextarea.style.height = csize;
					}
					</script>
						<div class="design_textarea">
												<div class="title title_blur">상세 설명</div>
						<textarea id="etc_text_area" class="write_input_blur" style="color:#6b80a0; overflow:visible" name="cma_test2" id="cma_test2" class="textarea_size" onchange="cmaTextareaSize('cma_test2', 35);" onkeyup="cmaTextareaSize('cma_test2', 35);"></textarea>
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
											$(".design_textarea > div").attr('class','title_focus');
										});
										$("div.design_textarea  textarea").blur(function() {
											$(this).attr('class','write_input_blur');
											$(".design_textarea > div").attr('class','title_blur');
										});
										 </script>
										 <script>cmaTextareaSize('cma_test2', 35);</script>
							</div>
					<div class="btn_regis_area">
						<p class="reg"><a href="javascript:saveCall('/shop_card_save.json')" >등록</a></p>
						<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
						<p class="cancle reg"><a href="#">취소</a></p>
						<p class="modify" style="display:none"><a href="javascript:saveCall('shop_card_update.json')">수정</a></p>
						<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">수정</a></p> //-->
						<p class="cancle modify" style="display:none"><a href="#">삭제</a></p>
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


						<p class="category_icon"><img src="${shopKindImg}" alt="카테고리명삽입필요" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart_red.png"  alt="즐겨찾기" /><!-- 다른 아이콘 <img src="/src/owner/images/contents/icon_reflash.png" alt="해당아이콘설명삽입필요"  />//--><p>

						<div class="preview_title">
							${shop_detail.code_name}ㆍ${addrArr[0]} ${addrArr[1]}
							<p class="color_darkblue">${shop_detail.shop_name}</p>
						</div>

						<div class="preview_img">
							<img class="preview_image" src="/src/owner/images/contents/noimg.jpg" />
						</div>

						<div class="preview_infotext">
							${shop_card_detail.shop_intro}
						</div>

						<div class="preview_dotted"></div>

						<div class="plus_info">
							<dl>
								<dt><img src="/src/owner/images/contents/icon_card_01.png" alt="" /> 주요메뉴</dt>
								<dd>${shop_detail.shop_menu}</dd>
							</dl>
							<dl>
								<dt><img src="/src/owner/images/contents/icon_card_04.png" alt="" /> 휴대전화</dt>
								<dd>010-8232-4021</dd>
							</dl>
						</div>



						<div class="plus_text">
							<dl>
								<dt>상세설명</dt>
								<dd class="etc_detail_text">${shop_card_detail.etc_text}</dd>
							</dl>
						</div>

					</div><!-- END preview_area //-->

		</div>
		</div>

		<!-- 모바일에서 노출되는 팝업 미리보기 끝 //-->









				<!-- 우측 콘텐츠 //-->
				<li class="right rightpadding">

					<!-- 상단 칸 //-->
					<div class="cont_area ev_regis_subject rightpadd" >
						<p>노출될 가게명함을 미리 볼 수 있습니다.</p>
						<span class="title">미리보기</span>
					</div>



					<!-- 하단 칸 //-->
					<div class="cont_area mt20" >
					<div class="preview_area">

						<p class="category_icon"><img src="${shopKindImg}" alt="카테고리명삽입필요" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart_red.png"  alt="즐겨찾기" /><!-- 다른 아이콘 <img src="/src/owner/images/contents/icon_reflash.png" alt="해당아이콘설명삽입필요"  />//--><p>

						<div class="preview_title">
							${shop_detail.code_name}ㆍ${addrArr[0]} ${addrArr[1]}
							<p class="color_darkblue">${shop_detail.shop_name}</p>
						</div>

						<div class="preview_img">
							<img class="preview_image" src="/src/owner/images/contents/noimg.jpg" />
						</div>

						<div class="preview_infotext">
							${shop_card_detail.shop_intro}
						</div>

						<div class="preview_dotted"></div>

						<div class="plus_info">
							<dl>
								<dt><img src="/src/owner/images/contents/icon_card_01.png" alt="" /> 주요메뉴</dt>
								<dd>${shop_detail.shop_menu}</dd>
							</dl>
							<dl>
								<dt><img src="/src/owner/images/contents/icon_card_04.png" alt="" /> 휴대전화</dt>
								<dd>${shop_detail.shop_phone}</dd>
							</dl>
						</div>

						<div class="plus_text">
							<dl>
								<dt>상세설명</dt>
								<dd class="etc_detail_text">${shop_card_detail.etc_text}</dd>
							</dl>
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