<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Power Link</title>
</head>
<body>
<%@ include file="../temp/header1.jsp" %>	
	<section id="main">

		<h1>거래내역</h1>

		<table>
			<tr>
				<td>내역</td>
				<td>판매자</td>
				<td>구매자</td>
				<td>패키지 명</td>
				<td>가격</td>
			</tr>
			<tr>
				<c:if test="${not empty sell}">
				<c:forEach items="sell" var="sell">
					<tr>
						<td>판매</td>
						<td>#{sell.id}</td>
						<td>#{sell.buyer}</td>
						<td>#{sell.name}</td>
						<td>#{sell.price}</td>
					<tr>
				</c:forEach>
				</c:if>
			</tr>
			<tr>
				<c:if test="${not empty buy}">
				<c:forEach items="buy" var="buy">
					<tr>
						<td>구매</td>
						<td>#{buy.id}</td>
						<td>#{buy.seller}</td>
						<td>#{buy.name}</td>
						<td>#{buy.price}</td>
					</tr>
				</c:forEach>
				</c:if>
			</tr>
		</table>

	</section>
<%@ include file="../temp/footer.jsp" %>	
</body>
</html>