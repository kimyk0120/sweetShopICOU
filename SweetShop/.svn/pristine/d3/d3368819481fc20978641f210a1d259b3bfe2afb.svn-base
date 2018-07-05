<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<fmt:parseDate value="${todayDate}" pattern="yyyy-MM-dd" var="curDate"/>
	<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${curDate}" var="curDate2" />

	<c:forEach items="${promotionList}" var="pl">
	
	<fmt:parseDate value="${pl.promotion_end_day}" pattern="yyyy-MM-dd" var="endDate"/>
	<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${endDate}" var="endDate2" />
	
	<c:choose>
		<c:when test="${ curDate2 > endDate2}">
			<c:set var="endYN" value="wrdLatest alpha30per" />
		</c:when>
		<c:when test="${ curDate2 <= endDate2}">
			<c:set var="endYN" value="wrdLatest" />
		</c:when>
	</c:choose>
	<li class="${endYN}">
	<c:choose>
	<c:when test="${pl.shop_kind eq '000'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_beauty.png" />
		<c:set var="shopKind" value="미용/스파" />
	</c:when>
	<c:when test="${pl.shop_kind eq '001'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_hair.png" />
		<c:set var="shopKind" value="헤어/메이크업" />
	</c:when>
	<c:when test="${pl.shop_kind eq '002'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_realty.png" />
		<c:set var="shopKind" value="부동산" />
	</c:when>
	<c:when test="${pl.shop_kind eq '003'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_bakery.png" />
		<c:set var="shopKind" value="빵집" />
	</c:when>
	<c:when test="${pl.shop_kind eq '004'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_stay.png" />
		<c:set var="shopKind" value="숙박" />
	</c:when>
	<c:when test="${pl.shop_kind eq '005'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_super.png" />
		<c:set var="shopKind" value="슈퍼/마트" />
	</c:when>
	<c:when test="${pl.shop_kind eq '006'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_pharmacy.png" />
		<c:set var="shopKind" value="약국" />
	</c:when>
	<c:when test="${pl.shop_kind eq '007'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_food.png" />
		<c:set var="shopKind" value="음식점" />
	</c:when>
	<c:when test="${pl.shop_kind eq '008'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_cafe.png" />
		<c:set var="shopKind" value="카페" />
	</c:when>
	<c:when test="${pl.shop_kind eq '009'}">
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_interier.png" />
		<c:set var="shopKind" value="인테리어" />
	</c:when>
	<c:when test="${pl.shop_kind eq '010'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_clean.png" />
		<c:set var="shopKind" value="청소" />
	</c:when>
	<c:when test="${pl.shop_kind eq '011'}"> 
		<c:set var="shopKindImg" value="/src/user/images/common/ribbon_sports.png" />
		<c:set var="shopKind" value="스포츠" />
	</c:when>
 	</c:choose>
		<div class="ribbon"><img src="${shopKindImg}" /></div>

	<c:choose>
		<c:when test="${pl.favoriteYN == 'Y' }">
			<div class="favorite" onclick="favoritChange(this);"><img src="/src/user/images/common/icon_favorite_on.png" name="Y" /></div>
		</c:when>
		<c:otherwise>
				<div class="favorite" onclick="favoritChange(this);"><img src="/src/user/images/common/icon_favorite_off.png" name="N" /></div>
		</c:otherwise>
	</c:choose>
		<input type="hidden" value="${pl.shop_seq}" id="shopSeq">
		<div class="title"><a href="#" class="color_cafe"><span class="notcolor">${shopKind}</span>${pl.shop_name}</a></div>
		
		<div class="photo"><a href="/user/adDetail.do?promotionSeq=${pl.promotion_seq}"><img src="${pl.img_path}"  /></a></div>
		
		<div class="infomation">
			<ul>
				<li>							
				<c:set var="value" value="${pl.reviewAvgFloor}" />
				<c:choose>
					<c:when test="${value == 0 }">
						<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;">별점 없음</span>
					</c:when>
					<c:otherwise>
						<img src="/src/user/images/common/star_gray_min_right_${value}.png" />
					</c:otherwise>								
				</c:choose>
				</li>
				<li>
				<c:choose>
					<c:when test="${pl.distanceMeter<1000}">
						${pl.distanceMeter}m
					</c:when>
					<c:otherwise>
						${pl.distanceKmeter}km 
					</c:otherwise>								
				</c:choose>
				</li>
			</ul>
		</div>	
		
		<!-- 추가 영역 //-->
		<div class="day_guide">
			<c:choose>
				<c:when test="${pl.dateDiff > 0}">
					<p class="use_day">${pl.dateDiff}일 남음</p>
				</c:when>
				<c:when test="${pl.dateDiff < 0}">
					<p class="use_day_end">아이쿠! 종료 되었습니다.</p>
				</c:when>
				<c:otherwise>
					<p class="use_day">오늘까지!</p>
				</c:otherwise>
			</c:choose>
			<p class="discount color_cafe" style="overflow:hidden; text-overflow:ellipsis; height: 25px; margin-left: 32%; margin-right: 32%;  white-space: nowrap;">
					${pl.promotion_detail_desc}</p>
		</div>
		<div class="evcoupon_btn_wrap mb10" style="margin-left: 5%;">
			<p class="btn_pr_deatil"><a href="/user/adDetail.do?promotionSeq=${pl.promotion_seq}">자세히</a></p>
			<p class="btn_pr_deatil"><a href="/user/adWhere.do?promotionSeq=${pl.promotion_seq}">어디야</a></p>
			<p class="btn_pr_del" style="display: none;" onclick="adDelBtn(this);"><a href="#this"><img src="/src/user/images/common/btn_minus_del.png" style="width:18px; height:auto; margin-bottom:3px;" alt="삭제하기" /></a></p>
			<input type="hidden" value="${pl.down_seq}" id="downSeq">
		</div>
	</li>
	</c:forEach>
