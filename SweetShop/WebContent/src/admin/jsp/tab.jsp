<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="selected_tab" value="${param.index}" />

<div id="gnb">
	<ul>
		<li class="gnb01">
			<a href="/owner_list.do" <c:if test="${selected_tab eq '1'}">class="on"</c:if>  ><span>사장님</span> 관리<div class="arrow"></div></a>
		</li>
		<li class="gnb02">
			<a href="#" <c:if test="${selected_tab eq '2'}">class="on"</c:if>  ><span>홈페이지</span> 관리<div class="arrow"></div></a>
			</li>
		<li class="gnb03">
			<a href="/notice_list.do" <c:if test="${selected_tab eq '3'}">class="on"</c:if>  ><span>공지사항</span> 관리<div class="arrow"></div></a>
		</li>
		<li class="gnb04">
			<p></p><a href="/qa_list.do" <c:if test="${selected_tab eq '4'}">class="on"</c:if>  ><span>문의하기</span> 관리<div class="arrow"></div></a>
		</li>
	</ul>
</div>