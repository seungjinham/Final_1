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
<style type="text/css">
td {
	padding-right : 60px;
}
</style>
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
			<div class="inbox">
<%-- 				<table>
					<c:forEach begin="0" end="${list.length}" var="i">
						<c:if test="i%3=0">
							<br>
						</c:if>
						<tr>
							<c:forEach items="${list}" var="s">
								<td>
									<a href="./sellerView"><img src="../resources/upload/${s.oname}" width="320px" height="220px"></a><br>
									<a href="./sellerView">${s.title}</a><br>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table> --%>
			</div>
			
			
			
			<!-- Container (Portfolio Section) -->
			<div id="portfolio" class="container-fluid text-center bg-grey">
				<br>
				<div class="row text-center slideanim">
					<div class="col-sm-4">
						<div class="thumbnail">
							<c:forEach items="${list}" var="s">
							<a><img src="../resources/upload/${s.oname}" alt="" width="300" height="220"></a>
							<p>
								<strong><a href="./sellerView">${s.title}</a></strong>
							</p>
							</c:forEach>
						</div>
					</div>
				</div>
				<br>


			</div></section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>