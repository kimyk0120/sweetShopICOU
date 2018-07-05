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

<script type="text/javascript">
var page = 0;
function lastPostFunc()
{
		//$("div#lastPostsLoader").html("<div id='plus_loading' class='hc vc'><img src='/src/user/images/common/img_loading.gif' /></div>");
};

$(window).scroll(function(){
		console.log($(window).scrollTop()+"//"+ ($(document).height() - $(window).height()));
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){
          	  lastPostFunc();
		}
});
</script>

<!-- 메인 및 스크롤로 콘텐츠 더 추가 구성시 백그라운드 그라데이션도 같이 조정 되게 하기 위해 아래 스타일이 적용 됨 //-->
<style>
	html { height:auto; }
</style>


</head>

<body >
<div id="wrap" >


	<div id="container"><!-- 판넬메뉴 오픈시 옆 이동을 위한 박스 공간 - 영역 없음 //-->


	<!-- 리스트 검색 필터링 영역 //-->

	<section class="list_top_filter">
		<ul>
			<li>
				<div class="location_filet_wrap">
					<select class="location_filter">
						 <option selected>전체지역</option>
						 <option>주변 100m</option>
						 <option>주변 500m</option>
					</select>
				</div>
			</li>
			<li>
				<select class="jr_filter">
					<option selected>거리순</option>
					<option>리뷰 평점순</option>
				</select>
				<!--<img src="/src/user/images/common/btn_filter_off.png" style="width:18px; height:auto;" />//-->
			</li>
		</ul>
	</section>



	<section class="list_main_wrap">
		<div id="main_list" class="">
			<ul id="main_list2" >

				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_cafe.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_off.png"  /></div>
					<div class="title"><a href="#" class="color_cafe"><span class="notcolor">카페</span><span>1Cafe Rosy</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_01.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->

				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_bakery.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_on.png"  /></div>
					<div class="title"><a href="#" class="color_bakery"><span class="notcolor">빵집</span><span>2Bake.B</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_02.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->

				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_food.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_on.png"  /></div>
					<div class="title"><a href="#" class="color_food"><span class="notcolor">음식점</span><span>3Tarony</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_03.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->


				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_beauty.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_off.png"  /></div>
					<div class="title"><a href="#" class="color_beauty"><span class="notcolor">미용/스파</span><span>4Sandals</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_04.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->


				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_cafe.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_off.png"  /></div>
					<div class="title"><a href="#" class="color_cafe"><span class="notcolor">카페</span><span>1Cafe Rosy</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_01.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->

				<!-- 섹션 시작 //-->
				<li class="wrdLatest">
					<div class="ribbon"><img src="/src/user/images/common/ribbon_bakery.png" /></div>
					<div class="favorite"><img src="/src/user/images/common/icon_favorite_on.png"  /></div>
					<div class="title"><a href="#" class="color_bakery"><span class="notcolor">빵집</span></span>2Bake.B</span></a></div>
					<div class="photo"><a href="#"><img src="/src/user/images/common/@photo_02.jpg"  /></a></div>
					<div class="infomation">
						<ul>
							<li><img src="/src/user/images/common/star_gray_min_right_5.png" /></li>
							<li>1.2km</li>
						</ul>
					</div>
				</li>
				<!-- 섹션 끝//-->

			</ul>
		</div>
		<!-- <div id="lastPostsLoader"></div> -->
	</section>

	</div><!-- END container//-->

		<div style="height:50px; width:100%;"></div> <!-- 스크롤 하단 찾기위한 여유공간 //-->
		<!-- 최하단 스크롤 마지막에 나오는 아이콘 부분 //-->
		<div id="btn_reflash"><img src="/src/user/images/common/btn_reflash.png" /></div>

</div><!-- END wrap//-->

</body>
</html>