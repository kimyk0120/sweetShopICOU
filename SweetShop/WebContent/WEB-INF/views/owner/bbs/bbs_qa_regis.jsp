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
</head>
<script>
var qna_code;

$(document).ready(function(){
	var obj = '${qna_code}';
	var obj = '${shop_detail}';
	console.log(obj);
});


function saveCall(url) {

	var title = $('#subject').val();
	var comment = $('#ta').val();

	var param = {
			qna_target:"S",
			qna_type:qna_code,
			qna_title:title,
			qna_comment:comment,
			qna_shop_name:"${shop_detail.shop_name}",
			shop_owner_name:"${shop_detail.shop_owner_name}",
			shop_seq:"${shop_detail.shop_seq}",
	};

	console.log("param ? " + param.qna_target);
	console.log("param ? " + param.qna_type);
	console.log("param ? " + param.qna_title);
	console.log("param ? " + param.qna_comment);

	$.post(url, param, function(data) {
		console.log("result : " + data);
		var obj = $.parseJSON(data);

		if(obj.result == "success"){
			var url = "/bbs_qa_list.do";
			alert("저장을 성공하였습니다");
			$(location).attr('href',url);
		}else{
			alert("저장을 실패하였습니다");
		}
	}).fail(function(jqXHR, textStatus, errorThrown) {
		alert("서버와의 연결을 실패하였습니다");
	});
}

function setCode(name, code) {
	console.log("setCode: " + code);
	qna_code_type.value = name;
	qna_code = code;
}
</script>
<body>
<div id="wrap">

<c:import url="/src/owner/jsp/header.jsp" charEncoding="UTF-8">
	<c:param name="index" value="12" />
</c:import>

<div id="container">

	<c:import url="/src/owner/jsp/leftmenu.jsp" charEncoding="UTF-8">
		<c:param name="index" value="12" />
	</c:import>



	<!-- 우측 콘텐츠의 시작 //-->
	<div id="content_area">
		<h3><img src="/src/owner/images/contents/h3_img_06.png" alt=""  /><span>공지 및 문의하기 &nbsp; &gt; &nbsp; </span> 문의하기</h3>


		<div class="guide_area_wide">
			<ul>
				<li class="guide_wid"><span>문의사항 조회ㆍ수정ㆍ답변이 가능한 페이지입니다.</span></li>
			</ul>
			<ul>
				<li class="searchzone">

				</li>
			</ul>
		</div><!-- END guide_area //-->




		<div class="cont_area cont_bbs_area">
			<div class="gab_box">




				<div class="qa_half" style="margin-top: 0px;">
						<label for="detail_guide" class="qa">문의 분야</label>
								<input type="text" id="qna_code_type" class="regis_input_blur bg_arrow"  onclick="suggest(1);" style="background: url('/src/owner/images/contents/arrow_btm.png') no-repeat 98% center; padding-right:25px;  " placeholder="분야을 선택해 주세요."><!-- 반응형웹 사이즈 문제로 화살표가 들어가는 인풋화면에서는 플레이스홀더 옆에 8칸 비워주세요 !! //-->
									<!-- 레이어팝업으로 나오는 화면에서 선택시 인풋값에 자동 들어가도록 프로그램 처리 필요//-->
									<script type="text/javascript">
									<!--
									function suggest(num){
									 document.getElementById('suggest_' + num ).style.display = "";
									}
									//-->
									</script>
									 <div class="qa_type" id="suggest_1" style="display:none;">
										<ul>
											<c:forEach items="${qna_code}" var="codeVo">
												<li><a
													href="javascript:setCode('${codeVo.code_name}','${codeVo.code_id}')"
													class="close"><span class="stile_vh">문의 분야</span>${codeVo.code_name}</a></li>
											</c:forEach>
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







					<div class="tal">
						<label for="detail_guide" class="hide">제목</label>
						<input type="text" id="subject" class="regis_input_blur tal"  placeholder="제목을 입력해 주세요." >
					</div>


					<div class="design_textarea2">
						<div class="title hide">내용</div>
						<textarea id="ta" placeholder="내용을 입력해 주세요." class="write_input_blur"></textarea>
						<script type="text/javascript">
										$(document).ready(function() {
											$('.design_textarea2').on( 'keyup', 'textarea', function (e){
												$(this).css('height', 'auto' );
												$(this).height( this.scrollHeight );
											});
											$('.write_input_blur').find( 'textarea' ).keyup();
										});
										$("div.design_textarea2  textarea").focus(function() {
											$(this).attr('class','write_input_focus');
										});
										$("div.design_textarea2  textarea").blur(function() {
											$(this).attr('class','write_input_blur');
										});
										 </script>
							</div>

							<div class="btn_regis_area">
								<p><a href="javascript:saveCall('/qna_save.json')">등록</a></p>
								<!-- 수정모드 등에서 활성화 될 경우 p태글에 on클래스 추가로 배경색 바뀌게 적용    <p class="on"><a href="#">등록</a></p> //-->
								<p class="cancle"><a href="/bbs_qa_list.do">취소</a></p>
							</div>



				<script type="text/javascript">
				$("div.gab_box > div > input").focus(function() {
					$(this).attr('class','regis_input_focus');
				});
				$("div.gab_box > div > input").blur(function() {
					$(this).attr('class','regis_input_blur');
				});
				</script>






			</div>



</div>



	</div><!-- END content_area//-->
	<!-- 우측 콘텐츠의 시작 //-->

</div><!-- END container//-->



<c:import url="/src/owner/jsp/footer.jsp" charEncoding="UTF-8" />













</div><!-- END wrap//-->
</body>
</html>