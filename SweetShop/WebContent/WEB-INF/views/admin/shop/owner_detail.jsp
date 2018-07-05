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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function setImagePath(path){
		console.log("path : " + path);
		return path;
	}

	function editLoad(flag){
		if(flag == true){
			$('#detailArea').hide();
			$('#editArea').show();
		}else{
			$('#detailArea').show();
			$('#editArea').hide();
		}

	}

	function pageLoad(seq){
		console.log("seq ? " + seq);
		var form = document.createElement("form");
	    form.setAttribute("action", "/owner_modify.do");
	    form.setAttribute("method", "post");

	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "shop_seq");
        hiddenField.setAttribute("value", seq);

        form.appendChild(hiddenField);

	    document.body.appendChild(form);
	    form.submit();
	}

	function deleteShop() {
		var url = "/shop_delete.json";
		var seq = ${shop_detail.shop_seq};
		$.post(url, {
			shop_seq : seq
		}, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/owner_list.do";
				$(location).attr('href',url);
			}else{
				alert("삭제를 실패하였습니다");
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
		사장님과 가맹점 <strong>상세 정보</strong> 페이지 입니다.<br />해당 정보의 <span>수정ㆍ삭제</span>가 가능한 페이지입니다.
	</div>


	<div class="regis_area">
		<ul>
			<li id="detailArea">
				<ul class="regis_left">
					<li class="left">
						<div class="regis_tit">아이디</div>
						<div class="detail_cont point">${shop_detail.shop_name}</div>
					</li>

					<li class="clear left">
						<div class="regis_tit">가맹점명</div>
						<div class="detail_cont">${shop_detail.shop_name}</div>
					</li>
					<li>
						<div class="regis_tit">사업자등록번호</div>
						<div class="detail_cont">${shop_detail.shop_reg_number}</div>
					</li>
					<li class="wide">
						<div class="regis_tit">가게주소</div>
						<div class="detail_cont_wide">${shop_detail.shop_addr1}</div>
					</li>
					<li class="clear left">
						<div class="regis_tit">위치좌표</div>
						<div class="detail_cont">${shop_detail.shop_location_lat}, ${shop_detail.shop_location_long}</div>
					</li>
					<li>
						<div class="regis_tit">가게전화</div>
						<div class="detail_cont">${shop_detail.shop_tel}</div>
					</li>
					<li class="clear left business_type">
						<div class="regis_tit">업종</div>
						<c:forEach items="${shop_code}" var="codeVo">
							<c:if test="${shop_detail.shop_kind eq codeVo.code_id}">
								<div class="detail_cont">${codeVo.code_name}</div>
							</c:if>
						</c:forEach>
					</li>
					<li>
						<div class="regis_tit">주요메뉴</div>
						<div class="detail_cont">${shop_detail.shop_menu}</div>
					</li>
					<li class="clear left">
						<div class="regis_tit">대표자</div>
						<div class="detail_cont">${shop_detail.shop_owner_name}</div>
					</li>
					<li>
						<div class="regis_tit">휴대전화</div>
						<div class="detail_cont">${shop_detail.shop_phone}</div>
					</li>
				</ul>
			</li>
			<li class="photo_area">
				<div class="regis_photo">
					<div class="photo">
					<img src="${shop_detail.shop_img_path}"
					          onError="this.src='/src/owner/images/contents/noimg.jpg';" /></div>
				</div>
			</li>
		</ul>
	</div><!-- END regis_area //-->


	<div class="f_btn_area">
		<a href="javascript:pageLoad(${shop_detail.shop_seq})"><img src="/src/admin/images/contents/btn_modi_focus.png" /></a>
		<a href="javascript:deleteShop()"><img src="/src/admin/images/contents/btn_delete_blur.png" /></a>
	</div>












</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>