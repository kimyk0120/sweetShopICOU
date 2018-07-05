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
</head>
<script>
	var notice_target="A";
	var index =0;

	$(document).ready(function(){

		var attr = '${notice_detail}';
		console.log("=============");
		console.log(attr);

		notice_target='${notice_detail.notice_target}';

		if(notice_target == "A"){
			index=0;
		}else if(notice_target == "S"){
			index=1;
		}else if(notice_target == "U"){
			index=2;
		}else{
			index=0;
		}

		$('.sitem_text').removeClass('checked');
		$('.radiocls').removeClass('checked');

		$('.sitem_text:eq('+index+')').addClass('checked');
		$('.radiocls:eq('+index+')').addClass('checked');
	});

	function select_target(target){
		selected_target = target;
		console.log("selected_target : " + selected_target);
	}

	function saveCall(url) {

		var img_obj;
		var img_array = new Array();
		var param = new Object();
		console.log("img_array.length ? " + img_array.length);

		if(index==0){
			notice_target = "A"
		}else if(index==1){
			notice_target = "S"
		}else if(index==2){
			notice_target = "U"
		}else{
			notice_target = "A"
		}

		if(img_array.length > 0){
			/* img_obj = img_array[item_index-1]; */
			param = {
					notice_seq:'${notice_detail.notice_seq}',
					notice_target:notice_target,
					notice_title:$('#subject').val(),
					notice_comment:$('#ta').val(),
					file_path:"",
					file_name:"",
					file_org_name:""
			};
		}else{
			param = {
					notice_seq:'${notice_detail.notice_seq}',
					notice_target:notice_target,
					notice_title:$('#subject').val(),
					notice_comment:$('#ta').val(),
					notice_file:""
			};
		}

		console.log("url ? " + url);
		console.log("param ? " + param.notice_target);
		console.log("param ? " + param.notice_title);
		console.log("param ? " + param.notice_comment);

		$.post(url, param
		, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/notice_list.do";
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
<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
	<c:param name="index" value="3" />
</c:import>

<div id="container" >

	<div class="page_guide page_guide_03">
		가맹점ㆍ손님을 위한 <strong>공지사항 등록</strong> 페이지입니다.<br />해당 정보를 <span>등록</span> 해주세요.
	</div>


	<div class="board_write">
		<ul>
			<li class="type">
				<span class="tit">공지대상</span>

					<span class="sitem_list" onclick="select_target('A')">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li01" class="iRadio" type="radio" name="sex" value="전체" />
						<label for="li01" class="sitem_text">전체</label>
					</span>
					<span class="sitem_list" onclick="select_target('S')">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li02" class="iRadio" type="radio" name="sex" value="가맹점" />
						<label for="li02" class="sitem_text">가맹점</label>
					</span>
					<span class="sitem_list" onclick="select_target('U')">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li02" class="iRadio" type="radio" name="sex" value="손님" />
						<label for="li02" class="sitem_text">손님</label>
					</span>

				<script type="text/javascript">
				$(document).ready(function(){
					var _designRadio = $('.designRadio');
					var _iLabel = $('.sitem_text');

					$(_iLabel).click(function(){

						var _thisRadio = $(this).parent().find('> .designRadio');
						var _value = $(this).parent().find('>input').val();

						$(_designRadio).children().removeClass('checked');
						$(_thisRadio).children().addClass('checked');
						$(_iLabel).removeClass('checked');
						$(this).addClass('checked');

						/*console.log(_value);*/
					});

					$(_designRadio).click(function(){
						index = $(_designRadio).index(this);

						$('.sitem_text').removeClass('checked');
						$('.radiocls').removeClass('checked');

						$('.sitem_text:eq('+index+')').addClass('checked');
						$('.radiocls:eq('+index+')').addClass('checked');
					});
				});

			$("#search_input").focus(function() {
				$(this).attr('class','topSearch_focus');
			});
			$("#search_input").blur(function() {
				$(this).attr('class','topSearch_blur');
			});
				</script>
			</li>


			<li class="subject"><input type="text" id="subject" class="write_input_blur" placeholder="제목을 입력해 주세요."  onClick="this.value=''"
				value="${notice_detail.notice_title}" ></li>
			<li class="content">
				<div class="board_w_textarea">
				<textarea id="ta" placeholder="내용을 입력해 주세요." style="height:28px;"  class="write_input_blur">${notice_detail.notice_comment}</textarea>
				<!--
				  <script type="text/javascript">
					$(document).ready(function() {
					  $('.board_w_textarea').on( 'keyup', 'textarea', function (e){
						$(this).css('height', 'auto' );
						$(this).height( this.scrollHeight );
					  });
					  $('.board_w_textarea').find( 'textarea' ).keyup();
					});
				  </script>
				  -->
				 </div>
			</li>
			<li class="file" style="center;">
				<span class="tit">첨부파일</span>
					<input type="text" id="fileName" class="file_input_textbox" readonly style="width:715px; padding-left:0px;">
						<div class="file_input_div">
						<input type="button"  class="file_input_button" />
						<input type="file" name="mb_icon" class="file_input_hidden" onchange="document.getElementById('fileName').value = this.value;fileUpload();"  />
						</div>
			</li>
		</ul>
	</div>



	<script type="text/javascript">

		function fileUpload(){
			console.log("fileUpload.... : " + $("#fileName").val());

		}
		$("div.board_write > ul  > li > input").focus(function() {
			$(this).attr('class','write_input_focus');
		});
		$("div.board_write > ul  > li > input").blur(function() {
			$(this).attr('class','write_input_blur');
		});
		$("div.board_write  textarea").focus(function() {
			$(this).attr('class','write_input_focus');
		});
		$("div.board_write  textarea").blur(function() {
			$(this).attr('class','write_input_blur');
		});
	</script>

	<div class="f_btn_area mt50 mb50">
		<a href="javascript:saveCall('/notice_update.json')"><img src="/src/admin/images/contents/btn_save_blur.png" /><!-- <img src="/src/admin/images/contents/btn_save_active.png" /> //--></a>
		<a href="/notice_detail.do"><img src="/src/admin/images/contents/btn_cancle_blur.png" /></a>
	</div>


</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>