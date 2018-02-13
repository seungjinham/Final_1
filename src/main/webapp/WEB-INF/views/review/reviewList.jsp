<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Page</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
			<h1>Review Page</h1>

			<table>
				<tr>
					<th>NUN</th>
					<th>ID</th>
					<th>SELLER</th>
					<th>CONTENTS</th>
					<th>POINT</th>
					<th>UP</th>
				</tr>

				<c:forEach var="i" items="${list}"></c:forEach>
				<tr>
					<td>${i.num}</td>
					<td>${i.id}</td>
					<td>${i.seller}</td>
					<td>${i.contents}</td>
					<td>${i.point}</td>
					<td>${i.up}</td>

					<c:if test="${member.id eq 'i.id'}">
						<a class="toggleBtn" href="reviewDelete?num=${i.num}">DELETE</a>
						<a class="toggleBtn" href="reviewUpdate?num=${i.num}">UPDATE</a>
					</c:if>

				</tr>

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