<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/faq/faq.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="container">
		<h1>FAQ</h1>
		<table>
			<tr>
				<th>NUM</th>
				<th>TITLE</th>
				<th>CONTENTS</th>
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.num}</td>
					<td class="title"><a href="faqView?num=${i.num}">${i.title}</a></td>
					<td>${i.contents}</td>
				</tr>
			</c:forEach>
		</table>

		<a href="./faqWrite">WRITE</a>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>