<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html lang="ko">
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!-->        <!--<![endif]-->
<head>
<title>리뷰등록</title>

<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/user/jsp/include.jsp" charEncoding="UTF-8" />

<link rel="stylesheet" href="/src/user/css/toggle_switch.css" type="text/css" />
<link rel="stylesheet" href="/src/user/css/libs/default.css">
<link rel="stylesheet" href="/src/user/css/libs/default.date.css">

<script type="text/javascript" src="/src/user/js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="/src/user/js/jquery.starCountWrite.js"></script>
<script type="text/javascript" src="/src/user/js/picker.js"></script>
<script type="text/javascript" src="/src/user/js/picker.date.js"></script>
<script type="text/javascript" src="/src/user/js/jquery.autosize.min.js"></script>

</head>

<body >

<script>
$(function(){		
		
		// popup func
		function pop_layer( show ){
			if( show ){
				$("#overlay_t").show();
				setTimeout(function(){
					show_pop($("#popup_layer_1"));		
				}, 100 );
				$("body").on("touchmove", function(e){e.preventDefault()});
			}else{
				$('#popup_layer_1, #overlay_t').hide(); 	
				$("body").off("touchmove");
			}
		}   	
	   
	   $('#overlay_t, .close').click(function(e){ 
		   e.preventDefault(); 
		   pop_layer(false);
		   var shopSeq = $("input[name=shopSeq]").val();
		   $(location).attr("href","/user/reviewList.do?shopSeq="+shopSeq+"&ord=rgDt");
	   }); 	
	   
		function show_pop( obj ){
			obj.show();				
			var popH = obj.innerHeight();
			var popW = obj.innerWidth();
			var winW = $(window).width();
			var winH = $(window).height();
			var posW = (winW-popW)/2;
			var posY = (winH-popH)/2;
			obj.css({"left":posW, "top":posY});	   
		}
	   
	   pop_layer(false);	
	
	
		var chk_review = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		
		//별 체크
		var starCount_top = $("#star_top").starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){
				var chk = starCount_top.returnCount();
				document.getElementById("totalJumsu").value = chk;
				( chk > 0 ?	chk_review[0] = 1 : chk_review[0] = 0 );
				total_check();
			}			
		});

		var starCount_bottom1 = $( "#star_b1" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom1.returnCount();		
				document.getElementById("serviceJumsu").value = chk;
				( chk > 0 ?	chk_review[5] = 1 : chk_review[5] = 0 );
				total_check();
			}			
		});
		var starCount_bottom2 = $( "#star_b2" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom2.returnCount();					
				document.getElementById("foodJumsu").value = chk;
				( chk > 0 ?	chk_review[6] = 1 : chk_review[6] = 0 );
				total_check();
			}			
		});
		var starCount_bottom3 = $( "#star_b3" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom3.returnCount();					
				document.getElementById("payJumsu").value = chk;
				( chk > 0 ?	chk_review[7] = 1 : chk_review[7] = 0 );
				total_check();
			}			
		});
		var starCount_bottom4 = $( "#star_b4" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom4.returnCount();					
				document.getElementById("cleanJumsu").value = chk;
				( chk > 0 ?	chk_review[8] = 1 : chk_review[8] = 0 );
				total_check();
			}			
		});
		var starCount_bottom5 = $( "#star_b5" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom5.returnCount();					
				document.getElementById("facilityJumsu").value = chk;
				( chk > 0 ?	chk_review[9] = 1 : chk_review[9] = 0 );
				total_check();
			}			
		});
		var starCount_bottom6 = $( "#star_b6" ).starCountWrite({initCount:0, useTouch:true, 		
			chkCount:function(e){					
				var chk = starCount_bottom6.returnCount();	
				document.getElementById("locationJumsu").value = chk;
				
				( chk > 0 ?	chk_review[10] = 1 : chk_review[10] = 0 );
				total_check();
			}			
		});
		

		//셀렉트박스(방문유형, 성별, 생년)
		$(".review_write_select").change(function(e) {		
			var thisObj = $(this);	
			var index = thisObj.attr("data-index");
			
			select_review(thisObj, index);			
		});
		
		function select_review(obj, num){
			var select_txt = obj.children("option:selected").text();
			var select_index = obj.children("option:selected").index(); 
			if( select_index == 0 ){ 
				obj.removeClass("on");
				obj.next("input").val("");
				chk_review[num] = 0;
			}else{
				obj.addClass("on");	
				obj.next("input").val(select_txt);
				chk_review[num] = 1;
				
			}

			if(num==1){
				document.getElementById("visitType").value = obj.children("option:selected").val();
			}else if(num==11){
				document.getElementById("gender").value = obj.children("option:selected").val();
			}else if(num==12){
				document.getElementById("birthDayH").value = obj.children("option:selected").val();
			}
			
			total_check();			
		}
		
		//방문시기
		var $input = $( '.datepicker' ).pickadate({
			monthsFull: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			monthsShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			format: 'yyyy-mm-d',
			formatSubmit: 'yyyy/mm/dd',
			today: '오늘',
			clear: '지우기',
			close: '닫기',
			onClose: function() {
				var date_txt = $('.datepicker').val();
				if(date_txt == ""){
					$('.datepicker').removeClass("on");
					chk_review[2] = 0;
				}else{
					$('.datepicker').addClass("on");
					chk_review[2] = 1;
					document.getElementById("visitDate").value =date_txt;
				}
				total_check();
			}
		});
		
		/*
		$(".review_write_date").change(function(e) {
			var select_date = $(this).val();
			$(this).addClass("on");		
			$(this).next("input").val(select_date);			
		})
		*/
		
		//리뷰 제목
		$(document).on('keyup','input[type="text"]',function(e){
			var $this = $(this);	
			if($this.val() !== $this.data('previousValue')){
				$this.trigger('change'); 
			}
			$this.data('previousValue',$this.val());		  
		});	
		
		$(document).on('keyup','textarea',function(e){
			var $this = $(this);	
			if($this.val() !== $this.data('previousValue')){
				$this.trigger('change'); 
			}
			$this.data('previousValue',$this.val());		  
		});		
		
		$("#review_subject").on('change', function(e) {
			( this.value == "" ? chk_review[3] = 0 : chk_review[3] = 1 );
			
			document.getElementById("reviewTitle").value = this.value;
				
			total_check();
		});
		
		//리뷰내용
		$("#review_cont").on('change', function(e) {
			( this.value == "" ? chk_review[4] = 0 : chk_review[4] = 1 );

			document.getElementById("reviewText").value = this.value;

			total_check();
		});
		$("#review_cont").autosize();
		/*
		$('.textarea_box').on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		});
		$('.textarea_box').find( 'textarea' ).keyup();
		*/
		
		//리뷰 전송동의
		var checkSwipe = $(".switch");
		checkSwipe.swipe( {
			swipe:function(event, direction, distance, duration, fingerCount, fingerData) {		
				console.log(direction)		
				if( direction == "right" ){
					$("#cmn-toggle-1").attr("checked", true);
					$(".cmn-toggle-before").css({"background-color": "#ff8b72"});
					$(".cmn-toggle-after").css({"left": "28px"});
					chk_review[13] = 1;
				}else if( direction == "left" ){
					$("#cmn-toggle-1").attr("checked", false);
					$(".cmn-toggle-before").css({"background-color": "#f1f1f1"});
					$(".cmn-toggle-after").css({"left": "0"});
					chk_review[13] = 0;
				}	
				total_check();
			},
			tap:function(event, target) {
				if($("#cmn-toggle-1").attr("checked")){
					$("#cmn-toggle-1").attr("checked", false);
					$(".cmn-toggle-before").css({"background-color": "#f1f1f1"});
					$(".cmn-toggle-after").css({"left": "0"});
					chk_review[13] = 0;
				}else{
					$("#cmn-toggle-1").attr("checked", true);
					$(".cmn-toggle-before").css({"background-color": "#ff8b72"});
					$(".cmn-toggle-after").css({"left": "28px"});
					chk_review[13] = 1;
				} 
				total_check();
			},
		   threshold:1
		});
		
		var total_num = 0;
		
		
		//글등록
		$(".btn_one").on("click", function(){
			var len = chk_review.length;
			
			if(total_num >= len) {
				
				//document.reviewForm.action="/user/reviewSave.do";
				//document.reviewForm.submit();
				
				var totalJumsu = $("input[name=totalJumsu]").val();
				var visitType = $("input[name=visitType]").val();
				var visitDate = $("input[name=visitDate]").val();
				var reviewTitle = $("input[name=reviewTitle]").val();
				var reviewText = $("input[name=reviewText]").val();
				var serviceJumsu = $("input[name=serviceJumsu]").val();
				var foodJumsu = $("input[name=foodJumsu]").val();
				var payJumsu = $("input[name=payJumsu]").val();
				var cleanJumsu = $("input[name=cleanJumsu]").val();
				var facilityJumsu = $("input[name=facilityJumsu]").val();
				var locationJumsu = $("input[name=locationJumsu]").val();
				var gender = $("input[name=gender]").val();
				var birthDayH = $("input[name=birthDayH]").val();
				var shopSeq = $("input[name=shopSeq]").val();
				var userSeq = $("input[name=userSeq]").val();
				
			/* 	console.log("totalJumsu : " , totalJumsu);
				console.log("visitType : " , visitType);
				console.log("visitDate : " , visitDate);
				console.log("reviewTitle : " , reviewTitle);
				console.log("reviewText : " , reviewText);
				console.log("serviceJumsu : " , serviceJumsu);
				console.log("foodJumsu : " , foodJumsu);
				console.log("payJumsu : " , payJumsu);
				console.log("cleanJumsu : " , cleanJumsu);
				console.log("facilityJumsu : " , facilityJumsu);
				console.log("locationJumsu : " , locationJumsu);
				console.log("gender : " , gender);
				console.log("birthDayH : " , birthDayH);
				console.log("shopSeq : " , shopSeq);
				console.log("userSeq : " , userSeq); */
				
				$.post(
					"/user/reviewSave.do",
					{
					"totalJumsu":totalJumsu,
					"visitType":visitType,
					"visitDate":visitDate,
					"reviewTitle":reviewTitle,
					"reviewText":reviewText,
					"serviceJumsu":serviceJumsu,
					"foodJumsu":foodJumsu,
					"payJumsu":payJumsu,
					"cleanJumsu":cleanJumsu,
					"facilityJumsu":facilityJumsu,
					"locationJumsu":locationJumsu,
					"gender":gender,
					"birthDayH":birthDayH,
					"shopSeq":shopSeq,
					"userSeq":userSeq
					},
				function(result){
					//console.log("result : ", result );
					pop_layer(true);	
				});
				
			} else {
				alert('항목을 모두 입력하세요') ;
			}
			
			//(total_num >= len ? alert('글등록 완료!') : alert('항목을 모두 입력하세요') );
		})
		
		//전체 입력 체크 확인 : 전체 체크 확인되면 확인버튼 주황색으로 활성화
		function total_check(){
			var len = chk_review.length;
			//console.log(len)
			var total = 0;
			for(var i=0; i<len; i++){
				total += chk_review	[i];
			}	
			total_num = total;
			
			//console.log("total=",total, " , ",chk_review);
			( total >= len ? $(".btn_one").addClass("on") : $(".btn_one").removeClass("on") );	
		}
})//endDomReady
</script>
</head>

<!-- popup -->
<div id="overlay_t"></div> 
<div id="popup_layer_1">
	<div class="layer_padding">
		<div class="pop_title">
			<p>리뷰 등록 완료</p>
			리뷰가 정상적으로 등록되었습니다.
		</div>
	
	</div><!--END layer_padding//-->

	<div class="pop_btm_btn_area">
		<a class="close">OK</a>
</div>
</div>
<!-- popup -->


<body>
<form name="reviewForm" method="post" id="reviewFormId">
<input type="hidden" name="totalJumsu" id="totalJumsu" value="" />
<input type="hidden" name="visitType" id="visitType" value="" />
<input type="hidden" name="visitDate" id="visitDate" value="" />
<input type="hidden" name="reviewTitle" id="reviewTitle" value="" />
<input type="hidden" name="reviewText" id="reviewText" value="" />
<input type="hidden" name="serviceJumsu" id="serviceJumsu" value="" />
<input type="hidden" name="foodJumsu" id="foodJumsu" value="" />
<input type="hidden" name="payJumsu" id="payJumsu" value="" />
<input type="hidden" name="cleanJumsu" id="cleanJumsu" value="" />
<input type="hidden" name="facilityJumsu" id="facilityJumsu" value="" />
<input type="hidden" name="locationJumsu" id="locationJumsu" value="" />
<input type="hidden" name="gender" id="gender" value="${userInfo.user_gender}" />
<input type="hidden" name="birthDayH" id="birthDayH" value="${userInfo.user_age}" />
<input type="hidden" name="shopSeq" id="shopSeq" value="${shopSeq}" />
<input type="hidden" name="userSeq" id="userSeq" value="${userSeq}" />


<div id="wrap_wide" >

<section class="sub_content_wrap_wide" style="padding-bottom:15px; background:linear-gradient(to bottom,  #ffffff 0%,#e8d4d0 100%);">

	<dl class="review_write_top">
		<dt>이 장소는 어떠셨나요?</dt>
		<dd>
			<ul class="check_area_star big" id="star_top">
				<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:30px; height:auto;" /></span></li>
				<li class="check_star_area">
                	<span class="icon_star st_1"></span>
                    <span class="icon_star st_2"></span>
                    <span class="icon_star st_3"></span>
                    <span class="icon_star st_4"></span>
                    <span class="icon_star st_5"></span>
				</li>
				<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:30px; height:auto;" /></span></li>
			</ul>
		</dd>
	</dl>


	<div class="review_write_check_list">
		<ul>
			<li>
				<label for="id" class="review_write_tit">방문유형</label>
				<select  id="review_write_select" class="review_write_select" data-index="1"><!-- 선택 완료시 화살표 색상 변경은 클래스 review_write_select_on 으로 변경 / 기본은 review_write_select  //-->
					 <option value="" selected>누구와 방문하셨나요?</option>
					 <option value="v01">가족</option>
					 <option value="v04">비즈니스</option>
					 <option value="v03">커플</option>
					 <option value="v02">친구</option>
					 <option value="v05">나홀로</option>
				</select>
                <input type="text" readonly class="review_write_txt" placeholder="누구와 방문하셨나요?">
			</li>
			<li>
				<label for="date" class="review_write_tit">방문시기</label>
				<!--<input type="date" id="date" class="review_write_input  placeholderclass"  onClick="$(this).removeClass('placeholderclass')" onfocus="$(this).removeClass('placeholderclass')">-->

                <!--<input type="date" id="date" class="review_write_date" >
                <input type="text" readonly class="review_write_txt" placeholder="언제 방문하셨나요?">-->
                
                <input type="text" readonly class="review_write_txt datepicker" placeholder="언제 방문하셨나요?">
                

			<!--
			<style>
				.dateclass{   text-align:right;}
				.placeholderclass::before{ position: absolute;right:35px;top: 8px; content: "언제 방문하셨나요?"; color: #777786;width: 100%;line-height: 45px; text-align:right; }
				.placeholderclass:hover::before{ display: none;}
			</style>
            -->
				
			</li>
			<li style="padding-top:40px">
				<label  for="review_subject" class="review_write_tit2">리뷰 제목</label>
				<input type="text" id="review_subject" class="review_write_input2" placeholder="리뷰 제목을 적어주세요." style="width:100%;" >
			</li>
			<li class="textarea_box" style="padding-top:40px">
				<label  for="review_cont" class="review_write_tit2">리뷰 내용</label>
				<textarea id="review_cont"  placeholder="답변을 입력해 주세요.&#13;&#10;마음에 들었던 점이나 부족하다고 생각되었던 점을 말해주세요!" class="review_write_textarea" style="width:100%;" ></textarea>	
			</li>
		</ul>
	</div>


	
	<div class="review_write_check_list2 mt20">
		<ul>

			<li>
				<p>서비스</p>
				<ul class="check_area_star small check_list_star" id="star_b1">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>

			<li>
				<p>맛</p>
				<ul class="check_area_star small check_list_star" id="star_b2">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>

			<li>
				<p>가격</p>
				<ul class="check_area_star small check_list_star" id="star_b3">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>

			<li>
				<p>청결도</p>
				<ul class="check_area_star small check_list_star" id="star_b4">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>

			<li>
				<p>시설</p>
				<ul class="check_area_star small check_list_star" id="star_b5">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>

			<li>
				<p>위치</p>
				<ul class="check_area_star small check_list_star" id="star_b6">
					<li><span class="btn_minus"><img src="/src/user/images/common/btn_minus.png" alt="마이너스" style="width:20px; height:auto;" /></span></li>
					<li class="check_star_area">
                        <span class="icon_star st_1"></span>
                        <span class="icon_star st_2"></span>
                        <span class="icon_star st_3"></span>
                        <span class="icon_star st_4"></span>
                        <span class="icon_star st_5"></span>
                    </li>
					<li><span class="btn_plus"><img src="/src/user/images/common/btn_plus.png" alt="플러스" style="width:20px; height:auto;" /></span ></li>
				</ul>	 
			</li>
		</ul>
	</div>


	<div class="review_write_check_list mt20">
		<ul>
			<li>
            	<label for="sex" class="review_write_tit">성별</label>
				<select  id="sex" class="review_write_select" data-index="11" >
					 <option value="" selected>성별을 선택해 주세요.</option>
					 <option value="1">남성</option>
					 <option value="0">여성</option>
				</select>
                <input type="text" readonly class="review_write_txt" placeholder="성별을 선택해 주세요.">
			</li>

			<li>
				<label for="birthday" class="review_write_tit">생년</label>
				<select  id="birthday" class="review_write_select" data-index="12">
					 <option value="" selected>생년을 선택해 주세요.</option>
					 <c:forEach var="i" begin="0" end="90" step="1">
					 <option value="${yyyy-i}">${yyyy-i}년</option>
					 </c:forEach>					 
				</select>
                <input type="text" readonly class="review_write_txt" placeholder="생년을 선택해 주세요.">
			</li>
		</ul>
	</div>
    
	<div class="review_send_check mt20">
		<ul>
			<li>
				<p>리뷰 전송 동의</p>
				<div class="switch" id="switch">
					<input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
		</ul>
	</div>
    <div>
    	<p class="btn_one" style="margin-top:30px; margin-bottom:30px;"><a>글등록</a></p>
    </div>
<!--
	<div class="btn_btm_box">
		<p class="btn_one"><a href="#">글등록</a></p>
	</div>-->
</section>




</div><!-- END wrap//-->
</form>
</body>
</html>
