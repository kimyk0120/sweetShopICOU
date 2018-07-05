<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<c:forEach items="${noticeList}" var="nl">
			<dl>
				<dt id="${nl.notice_seq}"><a href="noticeDetail.do?seq=${nl.notice_seq}">${nl.notice_title}</a></dt>
				<fmt:formatDate value="${nl.reg_date}" pattern="yyyy.MM.dd" var="dateParse"/>
				<dd><c:out value="${dateParse}"></c:out></dd>
			</dl>
		</c:forEach>

