<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/faq/faq.css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="container">
		<h1 class="h1">FAQ</h1>
		
		<table class="faqTable">
			<c:forEach items="${list}" var="i" varStatus="j">
				<tr>
					<td id="title${j.index}" class="faqTitle" title="${j.index}">
					<c:catch>
					<c:forEach begin="1" end="${i.depth}">--</c:forEach>
					</c:catch>
					<div class="tableTitle">${i.title}</div>
					<div id="contents_view${j.index}" class="div_view">
								<div class="toggle_contents">${i.contents}
								<div class="div_deletebutton">
								<c:if test="${member.id eq 'admin'}">
									<a class="toggleBtn" href="faqDelete?num=${i.num}">DELETE</a>
									<a class="toggleBtn" href="faqUpdate?num=${i.num}">UPDATE</a>
								</c:if>
								</div>
								</div>
							</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		
		
		
		
		
	<%-- 	<c:if test="${not empty page}">
				<input type="button" class="list_button" title="${page.startNum}"
					value="<<">
			</c:if>

			<c:if test="${not empty page}">
				<c:choose>
					<c:when test="${page.curBlock gt 1}">
						<input type="button" class="list_button"
							title="${page.curBlock-1}" value="<">
					</c:when>
					<c:otherwise>
						<input type="button" class="list_button" title="${page.curBlock}"
							value="<">
					</c:otherwise>
				</c:choose>
			</c:if>


			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<input type="button" class="list_button button_now" title="${i}"
					value="${i}">
			</c:forEach>


			<c:if test="${not empty page}">
				<input type="button" class="list_button" title="${page.curBlock+1}"
					value=">">
			</c:if>

			<c:if test="${not empty page}">
				<input type="button" class="list_button" title="${page.lastNum}"
					value=">>">
			</c:if>
		
		<c:if test="${member.id eq 'admin'}">
		<a href="./faqWrite" id="btnWrite">WRITE</a>
		</c:if> --%>
		
		
		
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>