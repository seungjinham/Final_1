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
			<div class="inbox">
				<h1>sellerView</h1>
				<table>
					<c:forEach items="${list}" var="s">
						<tr>
							<td><a href=""><img src="" width="50px" height="50px"></a></td>
							<td><a href="./sellerView">${s.title}</a></td>
							<td>${s.category}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>