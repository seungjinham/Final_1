<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>
	<section id="main">
		<div class="container">
			<h1 class="h1">
			<c:choose>
				<c:when test="${category == 'design'}">
  					디자인
				</c:when>
				<c:when test="${category == 'it'}">
  					IT & 프로그래밍
				</c:when>
				<c:otherwise>
   					번역 & 통역
				</c:otherwise>
				</c:choose>
			</h1>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>