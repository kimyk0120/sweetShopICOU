<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->          <!--<![endif]-->
<head>
	<title>Super Admin ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
	<c:import url="/src/admin/jsp/meta.jsp" charEncoding="UTF-8" />
	<c:import url="/src/admin/jsp/include.jsp" charEncoding="UTF-8" />
</head>

<script>

	$(document).ready(function(){
		var obj = '${notice_detail}';
		var pre = '${notice_pre}';
		var next = '${notice_next}';
		console.log("============================");
		console.log(obj);
		console.log("============================");
		console.log(pre);
		console.log("============================");
		console.log(next);

		layoutSet();
	});

	function layoutSet(){
		var target = '${notice_detail.notice_target}';
		var index = 0;
		if(target=="U"){
			index = 2;
		}else if(target=="S"){
			index = 1;
		}else{
			index = 0;
		}

		$('.sitem_text').removeClass('checked');
		$('.radiocls').removeClass('checked');

		$('.sitem_text:eq('+index+')').addClass('checked');
		$('.radiocls:eq('+index+')').addClass('checked');
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
		가맹점ㆍ손님을 위한 <strong>공지사항 페이지</strong>입니다.<br />해당 정보의<span>수정</span>이 가능한 페이지입니다.
	</div>


	<div class="board_write">
		<ul>
			<li class="type">
				<span class="tit">공지대상</span>
					<span class="sitem_list">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li01" class="iRadio" type="radio" name="sex" value="전체" />
						<label for="li01" class="sitem_text">전체</label>
					</span>
					<span class="sitem_list">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li02" class="iRadio" type="radio" name="sex" value="가맹점" />
						<label for="li02" class="sitem_text">가맹점</label>
					</span>
					<span class="sitem_list">
						<span class="designRadio"><span class="radiocls radio"></span></span>
						<input id="li02" class="iRadio" type="radio" name="sex" value="손님" />
						<label for="li02" class="sitem_text">손님</label>
					</span>

				<script type="text/javascript">
					$(document).ready(function(){
						/* 선택된값의 value는 _value 에 있음 */

						var _designRadio = $('.designRadio');
						var _iLabel = $('.sitem_text');
						//$(_designRadio).children().removeClass('checked');

						$(_iLabel).click(function(){

							var _thisRadio = $(this).parent().find('> .designRadio');
							var _value = $(this).parent().find('>input').val();

							$(_designRadio).children().removeClass('checked');
							$(_thisRadio).children().addClass('checked');
							$(_iLabel).removeClass('checked');

							//$(this).removeClass('checked');
							//alert($(this).hasClass("checked"));
							$(this).addClass('checked');

							/*console.log(_value);*/
						});

						$(_designRadio).click(function(){
							var index = $(_designRadio).index(this);

							$('.sitem_text').removeClass('checked');
							$('.radiocls').removeClass('checked');

							$('.sitem_text:eq('+index+')').addClass('checked');
							$('.radiocls:eq('+index+')').addClass('checked');

							/*
							var _value = $(this).parent().find('>input').val();
							$(_designRadio).children().removeClass('checked');
							$(this).children().addClass('checked');
							*/
							/*console.log(_value);*/
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


			<li class="subject"><input type="text" id="" value="${notice_detail.notice_title}" class="write_input_blur board_mod"></li>
			<li class="content">
				<div class="board_w_textarea">
				<textarea class="write_input_blur board_mod">${notice_detail.notice_comment}</textarea>
				  <script type="text/javascript">
					$(document).ready(function() {
					  $('.board_w_textarea').on( 'keyup', 'textarea', function (e){
						$(this).css('height', 'auto' );
						$(this).height( this.scrollHeight );
					  });
					  $('.board_w_textarea').find( 'textarea' ).keyup();
					});
				  </script>
				 </div>
			</li>
			<li class="file">
				<span class="tit">첨부파일</span>


				<div class="file_item_area">
					<span class="file_item"><a href="${notice_detail.notice_path}" download="${notice_detail.notice_org_name}">${notice_detail.notice_org_name}</a></span>
				</div>

			</li>
		</ul>
	</div>

	<div class="f_btn_area mt50 mb50">
		<a href="#"><img src="/src/admin/images/contents/btn_save_blur.png" /><!-- <img src="./images/contents/btn_save_active.png" /> //--></a>
		<a href="#"><img src="/src/admin/images/contents/btn_cancle_blur.png" /></a>
	</div>



	<script type="text/javascript">
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


</div><!-- END container//-->
</div><!-- END wrap//-->
</body>
</html>