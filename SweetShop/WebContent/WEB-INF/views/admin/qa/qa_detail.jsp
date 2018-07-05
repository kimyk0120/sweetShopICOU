<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<script>
	var edit = false;

	$(document).ready(function() {

		if('${qna_answer}' == ""){
			console.log("empty");
		}else{
			edit = true;
		}

	});

	function saveCall(url) {
		if(edit){
			url = "/qna_answer_update.json";
		}
		var param = {
				qna_writer:"${qna_detail.qna_writer}",
				qna_seq:"${param.qna_seq}",
				qna_comment:$("#textarea_answer").val()
		};

		console.log("param : " + param.qna_seq);
		console.log("param : " + param.qna_comment);
		$.post(url, param
		, function(data) {
			console.log("result : " + data);
			var obj = $.parseJSON(data);

			if(obj.result == "success"){
				var url = "/qa_detail.do?qna_seq=${param.qna_seq}";
				if(edit){
					alert("답변을 수정 하였습니다");
				}else{
					alert("답변을 등록하였습니다");
				}

				$(location).attr('href',url);
			}else{
				if(edit){
					alert("답변수정을 실패 하였습니다");
				}else{
					alert("답변등록을 실패 하였습니다");
				}
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("서버와의 연결을 실패하였습니다");
		});
	}

	function editMode(){

		$(".editmode").show();
		$(".viewmode").hide();

		$("#textarea_answer").css("height", 50);

	}
</script>
<body>
	<div id="wrap">

		<c:import url="/src/admin/jsp/header.jsp" charEncoding="UTF-8" />
		<c:import url="/src/admin/jsp/tab.jsp" charEncoding="UTF-8">
			<c:param name="index" value="1" />
		</c:import>



		<div id="container">

			<div class="page_guide page_guide_04">
				가맹점ㆍ손님의 문의를 위한 <strong>문의하기 관리 상세페이지</strong>입니다.<br />
				<span>조회ㆍ답변ㆍ수정</span>이 가능한 페이지입니다.
			</div>



			<!-- 상세보기 시작 //-->
			<div class="board_detail_top">
				<img src="/src/admin/images/contents/icon_q.png" />${qna_detail.code_name}
				<span></span> ${qna_detail.qna_title}
				<div class="detail_date">
					등록일 &nbsp;&nbsp;
					<fmt:formatDate value="${qna_detail.qna_reg_date}" />
					&nbsp;&nbsp; 문의자&nbsp;&nbsp;${qna_detail.qna_writer}
				</div>
			</div>

			<div class="board_cont">${qna_detail.qna_comment}</div>
			<div class="board_w_textarea editmode" style="display:none;">
				<p class="icon_a"><img src="/src/admin/images/contents/icon_a.png" /></p>
				<textarea id="textarea_answer" placeholder="답변을 입력해 주세요." class="write_input_blur" style="width:830px; height:28px; padding-left:61px;" >${qna_answer.qna_comment}</textarea>

				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('.board_w_textarea').on(
												'keyup',
												'textarea',
												function(e) {
													$(this).css('height',
															'auto');
													$(this).height(
															this.scrollHeight);
												});
										$('.board_w_textarea').find('textarea')
												.keyup();
									});
					$("div.board_w_textarea  textarea").focus(function() {
						$(this).attr('class', 'write_input_focus');
					});
					$("div.board_w_textarea  textarea").blur(function() {
						$(this).attr('class', 'write_input_blur');
					});
				</script>
			</div>
			<div class="board_cont viewmode" style="padding-left:61px;height:30px;">
				<p class="icon_a"><img src="/src/admin/images/contents/icon_a_active.png" /></p>
				<p class="board_w_date">등록일&nbsp;&nbsp;
				<fmt:formatDate value="${qna_answer.qna_reg_date}" />
				&nbsp;&nbsp; 관리자 &nbsp; <a href="javascript:editMode()"><img src="/src/admin/images/contents/btn_modify_mini.png" style="vertical-align:top" /></a></p>
				${qna_answer.qna_comment}
			</div>


			<div class="f_btn_area mt50 mb50">
				<a href="javascript:saveCall('/qna_answer_save.json')"><img
					src="/src/admin/images/contents/btn_replay_blur.png" /> <!-- 활성화 <img src="/src/admin/images/contents/btn_replay_focus.png" />//--></a>
				<a href="/qa_list.do"><img
					src="/src/admin/images/contents/btn_cancle_blur.png" /></a>
			</div>

			<div class="prevnext_area">
				<ul>
					<li class="prev"><a
						href="/qa_detail.do?qna_seq=${qna_pre.qna_seq}"><span>이전글</span>${qna_pre.qna_title}</a></li>
					<c:choose>
						<c:when test="${qna_next.qna_title eq null}">
							<li class="next"><a
								href="/qa_detail.do?qna_seq=${qna_next.qna_seq}"><span>다음글</span>
									<p>다음글이 없습니다.</p></a></li>
						</c:when>
						<c:otherwise>
							<li class="next"><a
								href="/qa_detail.do?qna_seq=${qna_next.qna_seq}"><span>다음글</span>${qna_next.qna_title}</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

		</div>
		<!-- END container//-->
	</div>
	<!-- END wrap//-->
</body>
</html>
</html>