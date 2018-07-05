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
<c:import url="/src/user/jsp/meta.jsp" charEncoding="UTF-8" />
<c:import url="/src/user/jsp/include.jsp" charEncoding="UTF-8" />
<!-- jquery UI -->
<link rel="stylesheet" href="/src/user/css/jquery-ui.min.css" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<style>
	.lastSearchText{cursor:pointer;}
	div.photo img{height:7em;}
</style>
<script type="text/javascript">
$(function(){
	
	//initialize
	$("#searchBarActive, #btn_reflash").hide(); // 활성 검색창 , 스크롤로딩 이미지 
	var oldItems = JSON.parse(localStorage.getItem('lastSearchObject')) || [];  // 최근검색어 리스트
	if(oldItems.length>0){
		//최근검색어 리스트 만들기
		makeLastSearchList(oldItems);
	}
	//console.log("oldItems : " , oldItems);
	//localStorage.clear();
	
	// 디폴트인 서치바를 선택했을때 - 활성변환 
	$("#searchBarDefault").on("click",function(e){
		$(this).remove();
		$("#searchBarActive").show("fast",function(){
			$("input[name=search3]").focus();
		});
	})
	
	// 최근 검색 리스트 우측 x 버튼 선택시 - 최근 검색어 삭제 (화면 ,localStorege );
	$(".btn_del").on("click",function(e){
				
		// 화면에서 삭제
		$(this).parent().hide("fast",function(){
			
			var selectedDelText = $(this).find(".lastSearchText").text();
			$(this).remove();
			
			// localStorege에서 삭제
			//console.log("oldItems : " , oldItems);
			for(var i=0;i<oldItems.length;i++){
				//console.log(" i: ", i , " , oldItems[i].searchText : " ,oldItems[i].searchText);
				if(oldItems[i].searchText==selectedDelText){
					oldItems.splice(i,1);					
				}
			}
			//localStorege에 재등록
			localStorage.setItem('lastSearchObject', JSON.stringify(oldItems));
		})
	});
	
	// 검색창 - 검색할때 (엔터, and= ? , ios = 13);
	$("input[name=search3]").on("keydown",function(event){
		//console.log(event);
		var keyCode = event.keyCode;
		
		// 키패드 버튼으로 검색
		if(keyCode=="13"){
			
			var searchText = $(this).val();
			if(searchText==""){
				alert("검색어를 입력해주세요.");
				return false;
			}else{
				var todayDate = getToday();
				//console.log("searchText : " , searchText);
				// localstorage 저장
				var oldItems = JSON.parse(localStorage.getItem('lastSearchObject')) || [];
				var newItem = {"searchText":searchText,"searchDate":todayDate};
	 			oldItems.unshift(newItem);
				localStorage.setItem('lastSearchObject', JSON.stringify(oldItems));
				
				seartTitleChange(searchText);
				getSearchStoreList(searchText);
			}
		}
	});
	
	// 최근 검색어 중 검색어 선택시  
	$(".lastSearchText").on("click",function(){
		var lastSearchText = $(this).text();
		//console.log("lastSearchText : " , lastSearchText);
		$("#searchBarDefault").trigger("click");
		$("input[name=search3]").val(lastSearchText);
		
		seartTitleChange(lastSearchText);
		getSearchStoreList(lastSearchText);
	});
	
	
	// 스크롤 로드
	$(window).scroll(function(){
 		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if($(window).scrollTop() == $(document).height() - $(window).height()){
        	
			var btn_reflash_height = $("#btn_reflash").height();
			var document_height =  $(document).height();
			
			// 로딩 이미지 위치
			var position_y = document_height - 80;
			
        	$("#btn_reflash").css({"top":position_y,"position":"absolute"});
        	$("#btn_reflash").fadeIn("fast");
        	page++;
        	lastPostFunc(page);
		}
	}); 
	
	//좋아요 버튼 클릭시 
	$(document).on("click","div.favorite",function(){
		var chgDiv = $(this).find("img");	
		var targetElmt = $(this).find("img");
		var favoriteYN = $(this).find("img").attr("name");
		var shopSeq = $(this).next().val();
		
		//console.log(favoriteYN);
		if(favoriteYN=="Y"){
			
			$(chgDiv).toggle("puff",250,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_off.png").show();	
			});
			$(targetElmt).prop("name","N");									  

			$.ajax({
				  method: "POST",
				  url: "/user/common/delFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});			
		}else if(favoriteYN=="N"){

			$(chgDiv).toggle("puff",300,function(){
				$(chgDiv).attr("src","/src/user/images/common/icon_favorite_on.png").show();	
			});
			$(targetElmt).attr("name","Y");				
			
			$.ajax({
				  method: "POST",
				  url: "/user/common/addFavorite.do",
				  data: { "shopSeq": shopSeq}
			}).done(function(msg){
			});			
		};
	});
	
})//endDomReady


// 검색 데이터 출력
function getSearchStoreList(searchText){
	var url = "/user/search_result.ajax";
	$.post(url,{"searchText":searchText},function(result){
		//console.log("result : ", result);
		$(".search_last_list").remove();
		$("#searchResult").html(result);
	});
};

//최근검색어 리스트 만들기
function makeLastSearchList(oldItems){
	// 화면에 보여질 개수를 정해서 반복문으로 동적 생성 if localstorege가 4개 인데 for문은 5 개로 설정하면 oldItems[i].searchText 오류발생
	// 그러면 oldItems.length 값으로 분기처리 하여야함
	for(var i=0;i<oldItems.length;i++){
		var str="";
		str +=	"<li class=\"last\">";
		str +=		"<a class=\"lastSearchText\">"+oldItems[i].searchText+"</a>";
		str +=		"<p class=\"date\">"+oldItems[i].searchDate+"</p>";
		str +=	 	"<p class=\"btn_del\">";
		str +=			"<a>";
		str	+=	 			"<img src=\"/src/user/images/common/btn_delete.png\" />";
		str +=			"</a>";
		str +=		"</p>";
		str += 	"</li>";
		$(".search_last_list ul").append(str); 
	}
};

//검색창 바로 하단 ui 변경( 최근검색 - xxx검색결과입니다....) 
function seartTitleChange(searchText){
	var str="";
	str += "<img src=\"/src/user/images/common/icon_search.png\" style=\"width:16px; height:auto; margin-right:3px; \" />"; 
	str += "<span>'"+searchText+"'</span>에 대한 스토어 검색 결과입니다.";
	$(".search_title").empty().html(str);
}

//오늘 날짜 가져오기
function getToday(){
  var today = new Date();
  var yesterday = new Date(today.valueOf());
  var year = yesterday.getFullYear();
  var month = yesterday.getMonth() + 1;
  var day = yesterday.getDate();
  var monthParse = parseInt(month);
  var dayParse = parseInt(day);
  if(dayParse<10){
	  day = "0"+day;
  }
  if(monthParse<10){
	  month = "0"+month;
  }
  return month+"."+day;
  //return year+"-"+month+"-"+day;
}

</script>
</head>
<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>
<body >
<input type="hidden" value="${userSeq}" id="userSeq">
<div id="wrap_wide" >

	<section class="sub_content_wrap">
		
		<!-- 검색창 -->
		<div class="search_top_area">
			<div class="search_step01">
				<a id="searchBarDefault">
					<img src="/src/user/images/common/btn_search_off.png" alt="" />Search
				</a>
				<div id="searchBarActive">
					<!-- <p class="btn_search_reset"><a href="#"><img src="/src/user/images/common/btn_delete_on.png" class="btn_delete_img" /></a></p> -->
					<input type='search' name="search3"  class="search_box on"  value=""  /> 
				</div>
			</div>
		</div>


		<!--  검색리스트 상단 상태 표시 -->
		<div class="search_title">
			
			<img src="/src/user/images/common/icon_time.png" class="btn_delete_img" style="width:16px; height:auto; margin-right:3px; " /> 최근검색 
			
			<!-- <img src="/src/user/images/common/icon_search.png" style="width:16px; height:auto; margin-right:3px; " /> 
			<span>'스노우치킨'</span>에 대한 스토어 검색 결과입니다. -->
			
		</div>
		
		<!--  최근검색리스트 -->		
		<div class="search_last_list">
			<ul>
				<!-- list -->
				<!-- <li class="last">
					 <a class="lastSearchText">부암동 치맥</a>
					 <p class="date">07.13</p>
					 <p class="btn_del">
						 <a>
						 	<img src="/src/user/images/common/btn_delete.png" />
						 </a>
					 </p>
				 </li> -->
				<!-- list -->
			</ul>
		</div>
		
		 <!-- 검색결과 -->
		<div id="searchResult"></div>
	</section>
</div><!-- END wrap//-->
</body>
</html>