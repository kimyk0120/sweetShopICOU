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
<c:import url="/src/owner/jsp/upload.jsp" charEncoding="UTF-8" />
<c:import url="/src/owner/jsp/imagePreView.jsp" charEncoding="UTF-8" />
</head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	var zipCode='${shop_detail.shop_zip}';
	var lat='${shop_detail.shop_location_lat}';
	var lng='${shop_detail.shop_location_long}';
	var shop_code = '${shop_detail.shop_kind}';

	$(document).ready(function() {

		var obj = '${shop_detail}';
		var obj2 = '${shop_code}';
		var obj3 = '${user_info}';

		console.log("shop_detail=============");
		console.log("shop_code=============");
		console.log("user_info=============");
		console.log(obj);

		initImageSet();
	});

	function initImageSet() {
		var img_obj = new Object();

		var imgp = '${shop_detail.shop_img_path}';
		console.log("shop_detail.shop_img_path" + (imgp == ""));

		if (imgp == "") {
			$(".preview_image").attr("src",
					"/src/owner/images/contents/noimg.jpg");
		} else {
			img_obj.img_path = '${shop_detail.shop_img_path}';
			img_obj.img_file_name = '${shop_detail.shop_img_name}';
			img_obj.img_org_name = '${shop_detail.shop_img_org_name}';
			img_obj.event_order = item_index;

			img_array.push(img_obj);

			imageSet(".preview_image");

			item_index++;
		}
	}

	//업로드 성공시 화면에 세팅하는 부분
	function changeImageData(data) {
		console.log(data.file_name);
		imageSet(".preview_image");

		item_index++;
	}
	//saveCall('/mypage_update.json')
	function saveCall(url) {

		if ($("#password").val() != $("#passwordcheck").val()) {
			alert("입력된 패스워드 값이 틀립니다");
			return;
		}

		var img_obj = img_array[item_index - 1];
		var param = new Object();
		var seq = '${shop_detail.shop_seq}';
		console.log("img_array.length ? " + img_array.length);
		console.log("url ? " + url);
		if (img_array.length > 0) {
			console.log("img_array.path ? " + img_obj.img_path);
			img_obj = img_array[item_index - 1];
			param = {
				shop_seq : seq,
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
				shop_img_name : img_obj.img_file_name,
				shop_img_org_name : img_obj.img_org_name,
				shop_img_path : img_obj.img_path
			};

		} else {

			param = {
				shop_seq : seq,
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
				shop_phone1 : $("#hp").val()
			};
		}
		$.post(url, param, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if (obj.result == "success") {
				var url = "/mypage_modify.do";
				alert("저장을 성공하였습니다");
				$(location).attr('href', url);
			} else {
				alert("저장을 실패하였습니다");
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("서버와의 연결을 실패하였습니다");
		});
	}

	function daumPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var roadAddressEnglish = data.roadAddressEnglish;
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				zipCode = data.zonecode;

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				/*  document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
				 document.getElementById('sample4_roadAddress').value = fullRoadAddr;
				 document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */

				$("#address").val(fullRoadAddr);
				//getGeoData(roadAddressEnglish);
				getGeoData2(roadAddressEnglish);

				/* alert("zip : "+data.zonecode + "\n addr1 : "+fullRoadAddr+ "\n addr2 : "+data.jibunAddress); */

			}
		}).open();
	}


	var apikey2 = "c73d7d30d6de750c69c79b6255f580ef";

	function getGeoData2(addr) {
		var url = "https://apis.daum.net/local/geo/addr2coord?apikey="
				+ apikey2 + "&q=" + addr +"&output=json"
		console.log("getGeoData addr: " + addr);
		$.get(url, function(obj) {
			//var str = '{"channel":{"result":"1","pageCount":"1","title":"Search Daum Open API","totalCount":"1","description":"Daum Open API search result","item":[{"newAddress":"영평동 2181","mountain":"","buildingAddress":"","lng":126.57049352777591,"placeName":"Not avaliable","mainAddress":"242","id":"N30664967","point_x":126.57049352777591,"point_y":33.450680345348374,"title":"제주특별자치도 제주시 첨단로 242","isNewAddress":"Y","point_wx":"400166","point_wy":"-11708","subAddress":"0","localName_1":"제주특별자치도","localName_2":"제주시","lat":33.450680345348374,"localName_3":"첨단로"}],"lastBuildDate":"","link":"http://developers.daum.net/services","generator":"Daum Open API"}}'
			//var obj = JSON.parse(str);
			console.log("url: " + url);
			console.log(obj);
			if (obj.channel.result == "1") {
				var geoData = obj.channel.item[0];
				console.log("lng: " + geoData.lng);
				console.log("lat: " + geoData.lat);
				lng = geoData.lng;
				lat = geoData.lat;

				$("#location").val(geoData.lat + "," + geoData.lng);
				$("#address").removeClass("warning_red");
			} else {
				console.log("lng: ZERO_RESULTS");
				$("#location").val("");
			}
		});
	}

	var apikey = "AIzaSyAuVzkpkh4Soz70X4KW6zO4Q5Pi0OgFGeg";

	function getGeoData(addr) {
		var url = "https://maps.googleapis.com/maps/api/geocode/json?language=ko&key="
				+ apikey + "&address=" + addr
		console.log("getGeoData addr: " + addr);
		$.get(url, function(obj) {

			console.log("Data: " + obj.status);

			if (obj.status == "OK") {
				var geoData = obj.results[0].geometry.location;
				console.log("lng: " + geoData.lng);
				console.log("lat: " + geoData.lat);
				lng = geoData.lng;
				lat = geoData.lat;

				$("#location").val(geoData.lat + "," + geoData.lng);

			} else {
				console.log("lng: ZERO_RESULTS");
				$("#location").val("");
			}
		});
	}

	function setCode(name, code) {
		console.log("setCode: " + code);
		$("#shop_type").val(name);
		shop_code = code;
	}

</script>
<body>
	<div id="wrap">

		<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
			<c:param name="index" value="0" />
		</c:import>

		<div id="container">

			<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
				<c:param name="index" value="0" />
			</c:import>



			<!-- 우측 콘텐츠의 시작 //-->
			<div id="content_area">
				<h3>
					<img src="/src/owner/images/contents/h3_img_07.png" alt="" />
					회원정보수정
				</h3>


				<div class="guide_area_wide">
					<ul>
						<li class="guide_wid"><span>회원정보 수정페이지 입니다.</span></li>
					</ul>
				</div>
				<!-- END guide_area //-->


				<div class="cont_area">

					<div class="gab_box_modify">



						<div class="photo">
							<p>
								아이디<span>${shop_detail.id}</span>
							</p>
							<ul>
								<li class="title">대표 이미지 등록(수정)
									<p class="mb10">가게 대표 이미지를 등록해 주세요.</p>
									<p>
										사이즈 : 500*500px<br />용량 : 500MB 이하로<br />등록해 주세요
									</p>
								</li>
								<li class="photobox">
									<div class="photo_in">
										<img class="preview_image" src="" alt="이미지 등록"
											style="width: 100%; max-width: 250px; height: auto;"
											onError="this.src='/src/owner/images/contents/noimg.jpg';" />
										<div id="holder" class="photo" style="display: none;">
											<img src="/src/admin/images/contents/@img_photo.jpg" />
										</div>
										<p class="more_photo">
											<img src="/src/owner/images/contents/icon_camera.png"
												onclick='document.all.file.click();' />
										</p>
										<form id="frm" action="/shop_card_img_upload.do" method="post"
											encType="multipart/form-data">
											<p>
												<input type="file" id="file" name="shop_card_img_file"
													style='display: none;'>
											</p>
										</form>
									</div>
								</li>
							</ul>
						</div>




						<div class="mofi_area">
							<ul>
								<li><label for="password" class="regis_tit">비밀번호</label> <input
									type="password" id="password" class="regis_input_blur"
									value="${user_info[0].pwd}" style="font-size: 30px;"></li>
								<li><label for="passwordcheck" class="regis_tit">비밀번호
										확인</label> <input type="password" id="passwordcheck"
									class="regis_input_blur" value="${user_info[0].pwd}"
									style="font-size: 30px;"></li>
								<li><label for="shopname" class="regis_tit">가맹점명</label> <input
									type="text" id="shopname" class="regis_input_blur"
									value="${shop_detail.shop_name}"></li>
								<li><label for="shopnumber" class="regis_tit">사업자등록번호</label>
									<input type="text" id="shopnumber" class="regis_input_blur"
									value="${shop_detail.shop_reg_number}"></li>
							</ul>

							<ul>
								<li class="shopaddress"><label for="shopaddress"
									class="regis_tit">가게 주소</label> <input type="text" id="address"
									class="regis_input_blur" value="${shop_detail.shop_addr1}"
									onClick="daumPostCode()"></li>
							</ul>

							<ul>
								<li><label for="shoplocation" class="regis_tit">위치좌표</label>
									<input type="text" id="location" class="regis_input_blur"
									value="${shop_detail.shop_location_lat},${shop_detail.shop_location_long}"
									disabled="disabled"></li>
								<li><label for="shoptel" class="regis_tit">가게전화</label> <input
									type="text" id="tel" class="regis_input_blur"
									value="${shop_detail.shop_tel}"></li>
								<li><label for="shop_type" class="regis_tit label_blur">업종</label>

									<c:forEach items="${shop_code}" var="codeVo">
										<c:if test="${shop_detail.shop_kind eq codeVo.code_id}">
											<input type="text" id="shop_type" class="regis_input_blur bg_arrow" onclick="suggest(1);"
													value="${codeVo.code_name}"
													style="width: 92%; padding-right: 8%; background: url('/src/owner/images/contents/arrow_btm.png') no-repeat 98% center;"
													placeholder="업종을 선택해 주세요.">
										</c:if>
									</c:forEach>
									<div class="business_type" id="suggest_1" style="display: none;">
										<ul>
											<c:forEach items="${shop_code}" var="codeVo">
												<li><a href="javascript:setCode('${codeVo.code_name}','${codeVo.code_id}')" class="close"><span class="stile_vh">업종</span>${codeVo.code_name}</a></li>
											</c:forEach>
										</ul>
									</div>


									<script type="text/javascript">
										function suggest(num){
										 document.getElementById('suggest_' + num ).style.display = "";
										}
										$(".close").click(
												function() {
													$("#suggest_1").css(
															"display", "none");
												});
										$suggest_checking = $("#suggest_1");
										$suggest_checking.hover(function() {
											$(this).css("display", "block");
										}, function() {
											$(this).css("display", "none");
										});
									</script></li>
								<li><label for="coremenu" class="regis_tit">주요메뉴</label> <input
									type="text" id="coremenu" class="regis_input_blur"
									value="${shop_detail.shop_menu}"></li>
								<li><label for="owner" class="regis_tit">대표자</label> <input
									type="text" id="owner" class="regis_input_blur"
									value="${shop_detail.shop_owner_name}"></li>
								<li><label for="hp" class="regis_tit">휴대전화</label> <input
									type="text" id="hp" class="regis_input_blur"
									value="${shop_detail.shop_phone}"></li>
							</ul>




						</div>

						<script type="text/javascript">
							$("div.mofi_area input").focus(function() {
								$(this).attr('class', 'regis_input_focus');
							});
							$("div.mofi_area input").blur(function() {
								$(this).attr('class', 'regis_input_blur');
							});
						</script>



					</div>
					<!-- end gab_box //-->





					<div class="btn_regis_area">
						<p>
							<a href="javascript:saveCall('/mypage_update.json')">저장</a>
						</p>
						<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">저장</a></p> //-->
						<p class="cancle">
							<a href="#">취소</a>
						</p>
					</div>



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