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
	<title>Super Admin ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
	<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />
	<c:import url="/src/admin/jsp/upload.jsp" charEncoding="UTF-8" />

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		var zipCode;

		var lat;
		var lng;
		var shop_code;


		function save() {
			var url = "/owner_modify.json";

			console.log("shop_seq : "+'${shop_detail.shop_seq}');
			$.post(url, {
				shop_seq : '${shop_detail.shop_seq}',
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


</head>

<body>
<div id="wrap">
<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
	<c:param name="index" value="1" />
</c:import>



<div id="container" >

	<div class="page_guide">
		사장님과 가맹점 <strong>상세 정보 페이지</strong> 입니다.<br />해당 정보의 <span>수정</span>이 가능한 페이지입니다.
	</div>

	<div class="regis_area">
		<ul>
			<li>
				<ul class="regis_left">
					<li class="left">
						<div class="regis_tit">아이디</div>
						<div class="detail_cont">${shop_detail.shop_name}</div>
					</li>
					<li class="clear left">
						<label  for="password"  class="regis_tit">비밀번호</label>
						<input type="password" id="password" class="regis_input_blur" value="123456789" style="font-size:30px;">
					</li>
					<li>
						<label  for="passwordcheck"  class="regis_tit">비밀번호 확인</label>
						<input type="password" id="passwordcheck" class="regis_input_blur" value="123456789" style="font-size:30px;">
					</li>
					<li class="clear left">
						<label  for="shopname"  class="regis_tit">가맹점명</label>
						<input type="text" id="shopname" class="regis_input_blur" value="${shop_detail.shop_name}">
					</li>
					<li>
						<label  for="shopnumber"  class="regis_tit">사업자등록번호</label>
						<input type="text" id="shopnumber" class="regis_input_blur" value="${shop_detail.shop_reg_number}">
					</li>
					<li class="wide">
						<label  for="address" class="regis_tit">가게주소</label>
						<input type="text" id="address" class="regis_input_blur"  value="${shop_detail.shop_addr1}"  >
					</li>
					<li class="clear left">
						<label  for="location"  class="regis_tit">위치좌표</label>
						<input type="text" id="location" value="${shop_detail.shop_location_lat}, ${shop_detail.shop_location_long}"  class="regis_input_blur">
					</li>
					<li>
						<label  for="tel"  class="regis_tit">가게전화</label>
						<input type="text" id="tel" class="regis_input_blur" value="${shop_detail.shop_tel}">
					</li>
					<li class="clear left business_type">
						<label  for="btn"  class="regis_tit">업종</label>
						<c:forEach items="${shop_code}" var="codeVo">
							<c:if test="${shop_detail.shop_kind eq codeVo.code_id}">
								<input type="text" id="shoptype" class="regis_input_blur"   onclick="suggest(1);" value="${codeVo.code_name}"  />
							</c:if>
						</c:forEach>
						 <div class="business_type" id="suggest_1" style="display: none;">
							<ul>
								<c:forEach items="${shop_code}" var="codeVo">
									<li><a
										href="javascript:setCode('${codeVo.code_name}','${codeVo.code_id}')"
										class="close"><span>업종</span>${codeVo.code_name}</a></li>
								</c:forEach>
							</ul>
						</div>
						 <script type="text/javascript">
							function suggest(num){
							 document.getElementById('suggest_' + num ).style.display = "";
							}
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
					</li>
					<li>
						<label  for="coremenu"  class="regis_tit">주요메뉴</label>
						<input type="text" id="coremenu" value="파스타"  class="regis_input_blur">
					</li>
					<li class="clear left">
						<label  for="owner"  class="regis_tit">대표자</label>
						<input type="text" id="owner" class="regis_input_blur" value="장대영">
					</li>
					<li>
						<label  for="hp"  class="regis_tit">휴대전화</label>
						<input type="text" id="hp" class="regis_input_blur" value="011-1234-5678">
					</li>
				</ul>
				<script type="text/javascript">
				$("ul.regis_left  > li > input").focus(function() {
					$(this).attr('class','regis_input_focus');
				});
				$("ul.regis_left  > li > input").blur(function() {
					$(this).attr('class','regis_input_blur');
				});
				</script>


			</li>
			<li class="photo_area">
				<div class="regis_photo">
					<div id="holder" class="photo">
						<img src="${shop_detail.shop_img_path}" />
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
	</div><!-- END regis_area //-->

	<div class="f_btn_area">
		<a href="javascript:save()"><img src="/src/admin/images/contents/btn_save_blur.png" /><!-- 콘텐츠가 변경되어 등록활성화가 가능할 경우 <img src="/src/admin/images/contents/btn_save_focus.png" />//--></a>
		<a href="/owner_detail.do"><img src="/src/admin/images/contents/btn_cancle_blur.png" /></a>
	</div>
</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>