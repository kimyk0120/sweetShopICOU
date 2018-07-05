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
	<c:param name="index" value="7" />
</c:import>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="7" />
	</c:import>
<script type="text/javascript">

	function signCall() {
		var url = "/shop_card_save.json";
		$.post(url, {
			id : $("#id").val(),
			pwd : $("#password").val(),
			shop_name : $("#shopname").val(),
			shop_reg_number : $("#shopnumber").val(),
			shop_zip : zipCode,
			shop_addr1 : $("#address").val(),
			shop_location_lat : lat,
			shop_location_long : lng,
			shop_tel1 : $("#tel").val(),
			shop_kind : shop_code,
			shop_menu : $("#coremenu").val(),
			shop_owner_name : $("#owner").val(),
			shop_phone1 : $("#hp").val(),
			shop_img_name : img_name,
			shop_img_org_name : img_org_name,
			shop_img_path : img_path
		}, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/owner_list.do";
				$(location).attr('href',url);
			}else{
				alert("저장을 실패하였습니다");
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("서버와의 연결을 실패하였습니다");
		});
	}

</script>


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
									<p class="date">2016.06.27</p>
									<p class="title"><strong class="color_darkblue">LIBERTY</strong> 가게명함</p>
									<p class="g_text">고정되어 잇는 부분은 회원정보 수정페이지에서 수정해 주세요.<br />가게명함에 자동으로 반영됩니다.</p>
								</div>
								<ul>
									<li class="title">
										가게 명함 이미지
										<p class="mb10">가게 명함 이미지를 등록해 주세요.</p>
										<p>사이즈 : 500*500px<br />용량 : 500MB 이하로<br />등록해 주세요</p>
									</li>
									<li class="photobox">
										<div class="photo_in">
											<img src="/src/owner/images/contents/noimg.jpg" alt="이미지 등록"  style="width:100%; max-width:250px; height:auto;" />
										<!--
											<p class="more_photo"><a href="#"><img src="/src/owner/images/contents/icon_camera.png" /></a></p>
										 -->
										    <img src="/src/admin/images/contents/btn_photo.png"  onclick='document.all.file.click();'/>
											<form id="frm" action="/shop_card_img_upload.do" method="post" encType="multipart/form-data">
												<p><input type="file" id="file"  name="shop_card_img_file" style='display: none;'></p>
											</form>
										</div>
									</li>
								</ul>
							</div>


							<div>
								<label for="shoptype">업종</label>
								<input type="text" id="shoptype" class="regis_input_blur"  value="인테리어">
							</div>

							<div>
								<label for="shopgu">입점지역</label>
								<input type="text" id="shopgu" class="regis_input_blur"  value="${shop_detail.shop_addr1}" >
							</div>

							<div>
								<label for="shoptel">가게 전화</label>
								<input type="text" id="shoptel" class="regis_input_blur"  value="${shop_detail.shop_tel}" >
							</div>


							<div class="design_textarea">
								<div class="title"><span class="orange">* 두줄 소개</span></div>
											<textarea id="" placeholder="고객의 마음을 사로잡을 멎진 두줄 소개글을 적어주세요." class="write_input_blur"></textarea>
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
								<input type="text" id="shoptel" class="regis_input_blur" value="${shop_detail.shop_menu}"  placeholder="주요 메뉴 품목을 적어주세요." >
							</div>


						   <!-- 영업시간 //-->
						   <div class="design"><!-- 이벤트 이미지쪽 작업시 클래스 on 추가하면 라인 블루색으로 조정 됨 //-->
								<div class="title">영업시간</div>
								<div class="cont tar">
									<span class="shop_time">
									<input type="text" id="btn" class="shop_time_input_blur" onclick="onofftime(1);" value="00:00" title="업무 시작 시간 선택" > &nbsp; ~ &nbsp; <input type="text" id="btn" class="shop_time_input_blur" onclick="onofftime(2);" value="00:00"  title="업무 마감 시간 선택">
										<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
										<script type="text/javascript">
										<!--
										function onofftime(num){
										document.getElementById('onofftime_' + num ).style.display = "";
										}
										//-->
										</script>
										<div class="onofftime" id="onofftime_1" style="display:none;">
											<ul>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>00:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>00:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>01:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>01:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>02:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>02:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>03:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">시작 시간</span>03:30</a></li>
											</ul>
										</div>

										<div class="onofftime" id="onofftime_2" style="display:none;">
											<ul>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>12:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>12:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>13:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>13:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>14:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>14:30</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>15:00</a></li>
												<li><a href="#" class="close"><span class="stile_vh">마감 시간</span>15:30</a></li>
											</ul>
										</div>


										<script type="text/javascript">
											$seach_date_checking = $("#onofftime_1");
											$seach_date_checking.hover(
												function(){
													$(this).css("display","block");
												},
												function(){
													$(this).css("display","none");
												}
											);
											$seach_date_checking = $("#onofftime_2");
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






					<div>
						<label for="shophomepage">가게 홈페이지 주소 (선택입력)</label>
						<input type="text" id="shophomepage" class="regis_input_blur"  placeholder="www.홈페이지 주소.co.kr">
					</div>

					<div>
						<label for="shophp">휴대전화 (선택입력)</label>
						<input type="text" id="shophp" class="regis_input_blur" value="${shop_detail.shop_phone}"  placeholder="010-0000-0000">
					</div>


					<div>
						<label for="shopfax">팩스 (선택입력)</label>
						<input type="text" id="shopfax" class="regis_input_blur" value="${shop_detail.shop_fax}" placeholder="000-0000-0000">
					</div>

					<div class="design_textarea">
								<div class="title">상세 설명</div>
											<textarea id="" placeholder="가격대, 주차안내, 교통안내 등 친절한 상세설명을 해주세요." class="write_input_blur"></textarea>
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





							<div class="btn_regis_area">
								<p><a href="javascript:signCall()" >등록</a></p>
								<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
								<p class="cancle"><a href="#">취소</a></p>
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
						<p class="category_icon"><img src="/src/owner/images/contents/category_03.png" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart.png" /><p>

						<div class="preview_title">
							인테리어ㆍ양재동
							<p class="color_darkblue">LIBERTY</p>
						</div>

						<div class="preview_img">
							<img src="/src/owner/images/contents/noimg.jpg" />
						</div>

						<div class="preview_infotext">
						 입력하신 근사한 두줄 소개글이 노출됩니다.
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
						<p>노출될 가게명함을 미리 볼 수 있습니다.</p>
						<span class="title">미리보기</span>
					</div>



					<!-- 하단 칸 //-->
					<div class="cont_area mt20" >
					<div class="preview_area">

						<p class="category_icon"><img src="/src/owner/images/contents/category_03.png" /><p>
						<p class="heart_icon"><img src="/src/owner/images/contents/icon_heart.png" /><p>

						<div class="preview_title">
							인테리어ㆍ양재동
							<p class="color_darkblue">LIBERTY</p>
						</div>

						<div class="preview_img">
							<img src="/src/owner/images/contents/noimg.jpg" />
						</div>

						<div class="preview_infotext">
						 입력하신 근사한 두줄 소개글이 노출됩니다.
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