<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">

			<a href="../scrap/scrapDelete">ScrapDelete</a>
			<table border="1">
				<tr>
					<th>선택</th>
					<th>지역</th>
					<th>채용공고</th>
					<th>급여</th>
					<th>마감기한</th>
				</tr>
				<c:forEach var="result" items="${scrap_result}" begin="0" step="1">
					<tr>
						<td><input type="checkbox"></td>
						<td>${result.addr}</td>
						<td>${result.c_name}/${result.title}</td>
						<td>${result.salary}</td>
						<td>${result.deadline}</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div class="top">
				<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> <span>TOP</span>
					<img class="width-10px position-relative" style="top: -1px"
					src="/f1/resources/images/common/top.png" width="15px"
					height="15px;">
				</a>
			</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
	
</body>
</html>