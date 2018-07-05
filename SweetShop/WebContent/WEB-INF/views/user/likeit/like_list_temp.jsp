<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${likeList}" var="pl">
<!-- 섹션 시작 //-->
<li class="wrdLatest">
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
		
	<div class="title"><a href="/user/shopInfo.do?userSeq=${pl.user_seq}&shopSeq=${pl.shop_seq}&userLat=${userLat}&userLong=${userLong}" class="color_cafe"><span class="notcolor">${shopKind}</span><span>${pl.shop_name}</span></a></div>
	<div class="photo"><a href="/user/shopInfo.do?userSeq=${pl.user_seq}&shopSeq=${pl.shop_seq}&userLat=${userLat}&userLong=${userLong}"><img src="${pl.shop_img_path}"  /></a></div>
	<div class="infomation">
		<ul>
			<li>
			<c:set var="value" value="${pl.reviewAvgFloor}" />
				<c:choose>
					<c:when test="${value == 0 }">
						<span style="font-size: 12px;color:#a9a9b3;font-weight:normal;vertical-align:top;">별점 없음</span>
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
</li>
<!-- 섹션 끝//-->
</c:forEach>
