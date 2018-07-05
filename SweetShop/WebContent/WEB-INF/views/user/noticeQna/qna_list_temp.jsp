<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${qnaList}" var="ql">
<dl>
	<dt><a href="/user/qnaDetail.do?seq=${ql.qna_seq}">
	<c:if test="${ql.qna_status=='0' or ql.qna_status==null or ql.qna_status=='' }">
		<span class="ing">[처리중]</span>
	</c:if>			
	<c:if test="${ql.qna_status=='1'}">
		<span class="end">[완료]</span>
	</c:if>			
	${ql.qna_title}</a></dt>
	<fmt:formatDate value="${ql.qna_reg_date}" pattern="yyyy.MM.dd" var="dateParse"/>
	<dd><c:out value="${dateParse}"></c:out></dd>
</dl>
</c:forEach>
