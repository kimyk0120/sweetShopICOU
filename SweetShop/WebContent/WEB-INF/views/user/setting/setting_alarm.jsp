<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<!-- ie조건부주석 Conditional Comment //-->
<!--[if lt IE 7]>      <html class="ie6"> <![endif]-->
<!--[if IE 7]>         <html class="ie7"> <![endif]-->
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="ko">
<!--<![endif]-->
<head>
<title>USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-density dpi=medium-dpi">
<meta name="apple-mobile-web-app-title" content="">
<meta property="og:title" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:site_name" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:image" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta property="og:description" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스"/>
<meta name="keywords" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Generator" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Author" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Keywords" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<meta name="Description" content="USER ▒ 소상공인을 위한 실시간 홍보 및 이벤트 제공 서비스">
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico">

<link rel="stylesheet" href="/src/user/css/import.css" type="text/css" />
<link rel="stylesheet" href="/src/user/css/toggle_switch.css" type="text/css" />
<script type="text/javascript" src="/src/user/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/src/user/js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="/src/user/js/default.js"></script>
<script type="text/javascript">
$(function(){		
	
	var alarmSetting =  '${alarmSetting}';
	if(alarmSetting!=null||!!alarmSetting){
		alarmSetting = $.parseJSON(alarmSetting);
		//console.log(alarmSetting);
	
		if(alarmSetting.ALAM=="1"){
			var value = $("#switch1 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch1",true);
			}
		} 
		
		if(alarmSetting.ALAM=="0"){
			for(var i=2;i<7;i++){
				cssChange("switch"+i,false)
				//$("#switch"+i).parent().fadeOut();
			}
			//$("div .review_send_check").css("background-color","inherit");
		}
		
		if(alarmSetting.EVENT=="1"){
			var value = $("#switch2 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch2",true);
			}
		}
		if(alarmSetting.PROMOTION=="1"){
			var value = $("#switch3 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch3",true);
			}
		}
		if(alarmSetting.SHOP_NEWS=="1"){
			var value = $("#switch4 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch4",true);
			}
		}
		if(alarmSetting.ONE_QNA=="1"){
			var value = $("#switch5 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch5",true);
			}
		}
		if(alarmSetting.NOTICE=="1"){
			var value = $("#switch6 .cmn-toggle").prop("checked");
			if(value==""||value==null||!value){
				cssChange("switch6",true);
			}
		}  
	}else{
		alert("error");
		
		// 리턴할 페이지
		
	}

	function CheckSwipeButton( obj ){
		this.checkSwipe = obj;
		this.cmn_toggle = this.checkSwipe.find(".cmn-toggle");
		this.cmn_toggle_before = this.checkSwipe.find(".cmn-toggle-before");
		this.cmn_toggle_after = this.checkSwipe.find(".cmn-toggle-after");				
		this.swipe();
		
	}
	
	CheckSwipeButton.prototype.swipe = function(){
		var thisObj = this;
		this.checkSwipe.swipe( {
			/* swipe:function(event, direction, distance, duration, fingerCount, fingerData) {		
				if( direction == "right" ){
					thisObj.checkEffect(true);
				}else if( direction == "left" ){
					thisObj.checkEffect(false);
				}	
			}, */
			tap:function(event, target) {
				if(thisObj.cmn_toggle.attr("checked")){
					thisObj.checkEffect(false);
				}else{
					thisObj.checkEffect(true);
				} 				
			},
		   threshold:1
		});		
	}
	
	CheckSwipeButton.prototype.checkEffect =  function( state ){
		this.cmn_toggle.attr("checked", state);
		var bgColor;
		var moveX;
		if( state ){
			bgColor = "#ff8b72";
			moveX = "28px";	
		}else{
			bgColor = "#f1f1f1";
			moveX = "0";	
		}			
		this.cmn_toggle_before.css({"background-color": bgColor});
		this.cmn_toggle_after.css({"left": moveX });
	}
	
	$(".switch").each( function( index, obj ){
		var checkSwipeButton = new CheckSwipeButton( $(obj) );
	});
	
});//endDom


//버튼 체인지 css func
function cssChange(name, state){
	$("#"+name+" .cmn-toggle").attr("checked", state);
	var bgColor;
	var moveX;
	if( state ){
		bgColor = "#ff8b72";
		moveX = "28px";	
	}else{
		bgColor = "#f1f1f1";
		moveX = "0";	
	}			
	$("#"+name+" .cmn-toggle-before").css({"background-color": bgColor});
	$("#"+name+" .cmn-toggle-after").css({"left": moveX });
}

//알람버튼 일괄 수정(알람허용)
function alarmYN(){
	var value = $("#switch1 .cmn-toggle").prop("checked");
	//console.log("value : " , value)
	
	//on
	 if(value==true){
		for(var i=2;i<7;i++){
				var valueOn = $("#switch"+i+" .cmn-toggle").prop("checked");
			if(valueOn==""||valueOn==null||!valueOn){
				cssChange("switch"+i,true)
			}
		}
		//$("div .review_send_check").css("background-color","#fff");
		
		//데이터 모두 알림허용(1)으로 
		  $.ajax({
			type: "POST",
			url: "/user/allAlarmToOne.do",
			dataType:"text",
		    cache: false,
		    success: function(result){ if(result=="false"){alert("failed");}  }
	 	 }); 
	}
	
	//off
	if(value==""||value==null||!value){
		for(var i=2;i<7;i++){
			var value = $("#switch"+i+" .cmn-toggle").prop("checked");
			if(value==true){
					cssChange("switch"+i,false)
			}
			//$("#switch"+i).parent().fadeOut();
		}
		//$("div .review_send_check").css("background-color","inherit");
		
		//데이터 모두 0으로 
		 $.ajax({
			type: "POST",
			url: "/user/allAlarmToZero.do",
			dataType:"text",
		    cache: false,
		    success: function(result){
		    	if(result=="false"){alert("failed");}
		    }
	 	 });
		
	}

}//end alarmYN


//알람버튼 일부 동작수정
function alarmChange(e){
		var partVal = $("#"+e.id+" .cmn-toggle").prop("checked");
		var cnt=0;		
	 	var category="";

	 	for(var i=2;i<7;i++){
			var value = $("#switch"+i+" .cmn-toggle").prop("checked");
			if(!value){
				cnt++;			
			}
		}
		
		if(e.id=="switch2"){category ="EVENT";}
		if(e.id=="switch3"){category ="PROMOTION";}
		if(e.id=="switch4"){category ="SHOP_NEWS";}
		if(e.id=="switch5"){category ="ONE_QNA";}
		if(e.id=="switch6"){category ="NOTICE";}
// 		console.log("category : " , category);
		
		// false or true 
		if(partVal==""||partVal==null||!partVal){
			// 해당 이벤트 푸시 데이터 0으로 
			 $.ajax({
				type: "POST",
				dataType:"text",
				url: "/user/alarmOneChange.do",
				data : {
					"category":category,
					"alarmValue":"0"
					},
			    cache: false,
			    success: function(result){
			    	if(result=="false"){alert("failed");cssChange(e.id,true);}
			    }
		 	 });
		}else if(partVal==true){
			// 해당 이벤트 푸시 데이터 1으로 
			cssChange("switch1",true);
			 $.ajax({
				type: "POST",
				dataType:"text",
				url: "/user/alarmOneChange.do",
				data : {
					"category":category,
					"alarmValue":"1"
					},
			    cache: false,
			    success: function(result){
			    	if(result=="false"){alert("failed");cssChange(e.id,false);}
			    }
		 	 });
		}
		
		// 사용자가 알람허용을 전부 false 시켰을때 
		if(cnt==5){
			//$("div .review_send_check").css("background-color","inherit");
			//데이터 모두 0으로 
	    	cssChange("switch1",false);
			 $.ajax({
				type: "POST",
				dataType:"text",
				url: "/user/allAlarmToZero.do",
			    cache: false,
			    success: function(result){
			    	if(result=="false"){alert("failed");cssChange("switch1",true);}
			    }
		 	 });
		}else if(cnt==0){
			//데이터 모두 알림허용(1)으로 
	    	cssChange("switch1",true);			    	
			  $.ajax({
				type: "POST",
				url: "/user/allAlarmToOne.do",
				dataType:"text",
			    cache: false,
			    success: function(result){
			    	if(result=="false"){alert("failed");cssChange("switch1",false);}
			    }
		 	 }); 
		}
		//console.log("cnt : " + cnt);

}//alarmChange end

</script>
</head>

<body class="addH">
<input type="hidden" value="${userSeq}" id="userSeq">
<div id="wrap_wide" >

	<!-- 서브 상단 //-->
	<!-- <header class="sub">
		<ul>
			<li><a href="javascript: var uAgent=navigator.userAgent; if(uAgent.match(/opr|u;/i)) location.href=document.referrer; else history.back();" class="menu-btn"><img src="./images/common/btn_arrow_back.png" style="width:16px; height:auto; margin-right:5px;" />Back</a></li>
			<li>설정</li>
			<li></li>
		</ul>
	</header> -->

<section class="sub_content_wrap_wide pb20">
	
	<div class="review_send_check">
		<ul>
			<li>
				<p>알림 허용</p>                
				<div class="switch a1" id="switch1" onchange="" onclick="alarmYN();" >
					<input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div id="test1_1" class="cmn-toggle-before"></div>
                        <div id="test1_2" class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
		</ul>
	</div>

	<div class="review_send_check mt20">
		<ul>
			<li>
				<p>이벤트</p>
				<div class="switch a2" id="switch2"  onclick="alarmChange(this);">
					<input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" type="checkbox" >
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
			<li>
				<p>홍보전단</p>
				<div class="switch a3" id="switch3" onclick="alarmChange(this);">
					<input id="cmn-toggle-3" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
			<li>
				<p>자주 찾는 가게 소식</p>
				<div class="switch a4" id="switch4" onclick="alarmChange(this);">
					<input id="cmn-toggle-4" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
			<li>
				<p>1:1 문의 답변</p>
				<div class="switch a5" id="switch5" onclick="alarmChange(this);">
					<input id="cmn-toggle-5" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>
			<li>
				<p>공지사항</p>
				<div class="switch a6" id="switch6" onclick="alarmChange(this);">
					<input id="cmn-toggle-6" class="cmn-toggle cmn-toggle-round" type="checkbox">
					<div class="input_label">
                        <div class="cmn-toggle-before"></div>
                        <div class="cmn-toggle-after"></div>
                    </div>
			  </div>
			</li>     
                  
		</ul>
         
	</div>



</section>




</div><!-- END wrap//-->
</body>
</html>