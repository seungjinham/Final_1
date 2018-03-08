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
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerList.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="container">
			<div id="sell">
				<h1 class="text-center">
					<c:choose>
						<c:when test="${category == 'design'}">디 자 인</c:when>
						<c:when test="${category == 'it'}">I T & 프 로 그 래 밍</c:when>
						<c:otherwise>번 역 & 통 역</c:otherwise>
					</c:choose>
				</h1>

				<div class="row">
					<c:forEach items="${list}" var="s">
						<div class="col-sm-4">
							<div class="thumbnail">
								<a href="./sellerView?id=${s.id}"><img src="../resources/upload/${s.oname}" class="seller_img"></a>
								<p><strong>${s.id}</strong></p>
								<p><a href="./sellerView?id=${s.id}">${s.title}</a></p>
								
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>