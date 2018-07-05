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
<title>Super Admin ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/upload.jsp" charEncoding="UTF-8" />

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<body>
	<div id="wrap">
		<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
		<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
			<c:param name="index" value="1" />
		</c:import>

		<script>
			var signFlag = false;
			var zipCode;

			var lat;
			var lng;
			var shop_code;

			var idValue = false;


			function validationCheck(id, target){

				var reg_type = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

				id
				var tagID="#"+target;
				var value = $("#"+id).val();

				switch(id){
					case 'id':
						if (!reg_type.test(value)) {
							replaceMessage(tagID,"<p id='id_msg' class='check_red'>아이디는 영문과 숫자 6~16자로 입력해주세요<button onclick='idCheck()'>check</button></p>");
							idValue = false;
						}else{
							replaceMessage(tagID,"<p id='id_msg' class='check_red'>아이디 체크를 눌러주세요<button onclick='idCheck()'>check</button></p>");
							idValue = true;
						}
					break;
					case 'password':
						if (!reg_type.test(value)) {
							replaceMessage(tagID,"<p id='pw_msg' class='check_red'>비밀번호는 영문과 숫자 6~16자로 입력해주세요.</p>");
							$("#"+id).addClass("warning_red");
						}else{
							replaceMessage(tagID,"<p id='pw_msg'>사용가능한 비밀번호 입니다.</p>");
							$("#"+id).removeClass("warning_red");
						}
					break;
					case 'passwordcheck':
						var pwd_value = $("#password").val();

						if (pwd_value!=value) {
							replaceMessage(tagID,"<p id='pw_check_msg' class='check_red'>비밀번호가 일치하지 않습니다.</p>");
							$("#"+id).addClass("warning_red");
						}else{
							replaceMessage(tagID,"<p id='pw_check_msg'>비밀번호가 일치합니다.</p>");
							$("#"+id).removeClass("warning_red");
						}
					break;

				}
			}

			function replaceMessage(id, msg){
				$(id).replaceWith(msg);
			}

			function idCheck() {
				if(!idValue){
					alert("id 값이 올바르지 않습니다");
					return;
				}
				var id = $("#id").val();
				$.get(
					"/owner_regis_check.json?owner_id=" + id,
					function(data) {
						console.log("Data: " + data);
						var obj = $.parseJSON(data);
						console.log("Data: " + obj.result);
						if (obj.result == "true") {
							replaceMessage("#id_msg","<p id='id_msg' class='check_red'>이미 사용중인 아이디입니다.<button onclick='idCheck()'>check</button></p>");
							signFlag = false;
						} else {
							replaceMessage("#id_msg","<p id='id_msg'>사용가능한 아이디입니다.<button onclick='idCheck()'>check</button></p>");
							$("#id").removeClass("warning_red");
							signFlag = true;
						}
					});
			}

			function shopnumberCheck() {
				var id = $("#shopnumber").val();
				console.log("value = " + id);
				$.get(
								"/shop_reg_number_check.json?shop_reg_number="
										+ id,
								function(data) {
									console.log("Data: " + data);
									var obj = $.parseJSON(data);
									console.log("Data: " + obj.result);
									if (obj.result == "true") {
										$("#shopnumber_msg")
												.replaceWith(
														"<p id='shopnumber_msg' class='check_red'>이미 등록된 사업자 등록번호 입니다.<button onclick='shopnumberCheck()'>check</button></p>");
										signFlag = false;
									} else {
										$("#shopnumber_msg")
												.replaceWith(
														"<p id='shopnumber_msg'>사용가능한 사업자 등록번호입니다.<button onclick='shopnumberCheck()'>check</button></p>");
										$("#shopnumber").removeClass("warning_red");
										signFlag = true;
									}
								});
			}

			function shopNameCheck() {
				var id = $("#shopname").val();
				console.log("value = " + id);
				$.get(
								"/shop_name_check.json?shop_name=" + id,
								function(data) {
									console.log("Data: " + data);
									var obj = $.parseJSON(data);
									console.log("Data: " + obj.result);
									if (obj.result == "true") {
										$("#shopname_msg")
												.replaceWith(
														"<p id='shopname_msg' class='check_red'>이미 등록된 가맹점명입니다.<button onclick='shopNameCheck()'>check</button></p>");
										signFlag = false;
									} else {
										$("#shopname_msg")
												.replaceWith(
														"<p id='shopname_msg'>사용가능한 가맹점명입니다.<button onclick='shopNameCheck()'>check</button></p>")
										$("#shopname").removeClass("warning_red");
										signFlag = true;
									}
								});
			}

			function signCall() {
				if($("#container").find("input").hasClass("warning_red")){
					alert("필수 입력사항이 남았습니다.");
					return;
				}
				var url = "/shop_save.json";
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

			function daumPostCode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var roadAddressEnglish = data.roadAddressEnglish;
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수

								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
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
								//getGeoData3(roadAddressEnglish);
								getGeoData3(fullRoadAddr);


								/* alert("zip : "+data.zonecode + "\n addr1 : "+fullRoadAddr+ "\n addr2 : "+data.jibunAddress); */

							}
						}).open();
			}

			var apikey2 = "c73d7d30d6de750c69c79b6255f580ef";
			//var apikey2 = "a9af6938974c7a67923075f99c2ec570";
			//var apikey2 = "316ea6706e1a4d16db918acacf3cc0dd";
			function getGeoData3(addr) {

				$.ajax({
					type: "GET",
					dataType: "jsonp",
					url: "https://apis.daum.net/local/geo/addr2coord",	
					data: "apikey=" + apikey2 + "&q=" + addr + "&output=json" ,
					success: function(obj) {

						//var str = '{"channel":{"result":"1","pageCount":"1","title":"Search Daum Open API","totalCount":"1","description":"Daum Open API search result","item":[{"newAddress":"영평동 2181","mountain":"","buildingAddress":"","lng":126.57049352777591,"placeName":"Not avaliable","mainAddress":"242","id":"N30664967","point_x":126.57049352777591,"point_y":33.450680345348374,"title":"제주특별자치도 제주시 첨단로 242","isNewAddress":"Y","point_wx":"400166","point_wy":"-11708","subAddress":"0","localName_1":"제주특별자치도","localName_2":"제주시","lat":33.450680345348374,"localName_3":"첨단로"}],"lastBuildDate":"","link":"http://developers.daum.net/services","generator":"Daum Open API"}}'
						//var obj = JSON.parse(str);
                
 
						console.log(obj.channel);
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
					}
				});

			}

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
				shoptype.value = name;
				shop_code = code;

				$("#shoptype").removeClass("warning_red");
			}

			function phone_check(event){
				//var id = "#"+value;
				var pn = $(id).val();
				console.log($("#tel").val().length);
				if($("#tel").val().length > 7){
					$("#tel").removeClass("warning_red");
				}
				/* var id = "#"+value;
				var menu = $(id).val();
				if(menu.lengh <= 0){
					$(id).addClass("warning_red");
				}else{
					$(id).removeClass("warning_red");
				} */
			}
			function phonenumber(inputtxt){
			  var phoneno = /^\d{10}$/;
			  if(inputtxt.value.match(phoneno)){
			      return true;
			  }else{
			  	alert("message");
			  	return false;
			  }
			}
		</script>

			<div id="container">

			<div class="page_guide">
				사장님과 가맹점 <strong>상세 정보 등록</strong> 페이지 입니다.<br />해당 정보를 <span>등록</span>
				해주세요
			</div>


			<div class="regis_area">
				<ul>
					<li>
						<ul class="regis_left">
							<li class="left"><label for="id" class="regis_tit">아이디</label>
								<input type="text" id="id" class="regis_input_blur warning_red"
										onkeyup="validationCheck('id','id_msg')" />
							<!-- 프로그램 체크로 입력값이 맞지 않을 경우 클래스 warning_red 추가하면 빨간색 라인으로 변경됨 //-->
								<p id="id_msg" class="check_red">
									아이디는 영문과 숫자 6~16자로 입력해 주세요.
									<button onclick="idCheck()">check</button>
								</p>
							</li>
							<li class="clear left"><label for="password"
								class="regis_tit">비밀번호</label> <input type="password"
								id="password" class="regis_input_blur warning_red"
								onkeyup="validationCheck('password','pw_msg')"
								style="font-size: 30px;" />
								<p id="pw_msg" class="check_red">비밀번호는 영문과 숫자 6~16자로 입력해주세요.</p>
							</li>
							<li><label for="passwordcheck" class="regis_tit">비밀번호
									확인</label> <input type="password" id="passwordcheck"
								class="regis_input_blur warning_red" style="font-size: 30px;"
								onkeyup="validationCheck('passwordcheck','pw_check_msg')">
								<p id="pw_check_msg" class="check_red">비밀번호가 일치하지 않습니다.</p>
							<li class="clear left"><label for="shopname"
								class="regis_tit">가맹점명</label> <input type="text" id="shopname"
								class="regis_input_blur warning_red" />
								<p id="shopname_msg">
									<button onclick="shopNameCheck()">check</button>
								</p> <!-- 체크후 결과값 <p class="check_red">이미 등록된 가맹점명입니다.</p>//--></li>
							<li><label for="shopnumber" class="regis_tit">사업자등록번호</label>
								<input type="text" id="shopnumber"
								class="regis_input_blur warning_red" />
								<p id="shopnumber_msg">
									<button onclick="shopnumberCheck()">check</button>
								</p> <!-- 체크후 결과값 <p class="check_red">이미 등록된 사업자 등록번호 입니다.</p>//-->
							</li>
							<li class="wide"><label for="address" class="regis_tit">가게주소</label>
								<input type="text" id="address"
								class="regis_input_blur warning_red" placeholder="주소검색"
								onClick="daumPostCode()" value="주소검색" /></li>
							<li class="clear left"><label for="location"
								class="regis_tit">위치좌표</label> <input type="text" id="location"
								placeholder="주소를 입력해주세요" disabled="disabled"

								value="" class="regis_input_blur" /></li>
							<li><label for="tel" class="regis_tit">가게전화</label> <input
								type="number" id="tel" class="regis_input_blur warning_red"
								onkeypress="return phone_check(event);"  maxlength="11" /></li>
							<li class="clear left business_type"><label for="shoptype"
								class="regis_tit">업종</label> <input type="text" id="shoptype"
								class="regis_input_blur warning_red" placeholder="업종을 선택"
								onclick="suggest(1);" value="업종을 선택" /> <!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
								<div class="business_type" id="suggest_1" style="display: none;">
									<ul>
										<c:forEach items="${shop_code}" var="codeVo">
											<li><a
												href="javascript:setCode('${codeVo.code_name}','${codeVo.code_id}')"
												class="close"><span>업종</span>${codeVo.code_name}</a></li>
										</c:forEach>
									</ul>
								</div> <script type="text/javascript">
									function suggest(num){
										document.getElementById('suggest_' + num ).style.display = "";
									}
									$(".close").click(function() {
										$("#suggest_1").css("display", "none");
									});
									$suggest_checking = $("#suggest_1");
									$suggest_checking.hover(function() {
										$(this).css("display", "block");
									}, function() {
										$(this).css("display", "none");
									});
								</script></li>
							<li><label for="coremenu" class="regis_tit">주요메뉴</label> <input
								type="text" id="coremenu" placeholder="주요메뉴 품명"
								class="regis_input_blur" />
							</li>
							<li class="clear left"><label for="owner" class="regis_tit">대표자</label>
								<input type="text" id="owner" class="regis_input_blur" /></li>
							<li><label for="hp" class="regis_tit">휴대전화</label> <input
								type="tel" id="hp" class="regis_input_blur"
								onkeypress="return telValidate(event);" maxlength="11" /></li>
						</ul> <script type="text/javascript">
							/* $("ul.regis_left  > li > input").focus(function() {
								$(this).attr('class', 'regis_input_focus');
							});
							$("ul.regis_left  > li > input").blur(function() {
								$(this).attr('class', 'regis_input_blur');
							}); */
						</script>


					</li>
					<li class="photo_area">
						<div class="regis_photo">
							<div id="holder" class="photo">
								<img src="/src/admin/images/contents/@img_photo.jpg" />
							</div>
							<div class="btn_photo">
								<img src="/src/admin/images/contents/btn_photo.png"  onclick='document.all.file.click();'/>
								<form id="frm" action="/shop_img_upload.do" method="post" encType="multipart/form-data">
									<p><input type="file" id="file"  name="shop_img_file" style='display: none;'></p>
								</form>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- END regis_area //-->


			<div class="f_btn_area">
				<a href="javascript:signCall()"><img
					src="/src/admin/images/contents/btn_regis_blur.png" />
				<!-- 콘텐츠가 변경되어 등록활성화가 가능할 경우 <img src="/src/admin/images/contents/btn_regis_focus.png" />//--></a>
				<a href="#"><img src="/src/admin/images/contents/btn_cancle_blur.png" /></a>

			</div>

		</div>
		<!-- END container//-->
	</div>
	<!-- END wrap//-->
</body>
</html>