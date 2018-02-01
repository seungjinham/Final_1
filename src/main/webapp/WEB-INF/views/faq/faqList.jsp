<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
			<td>${i.title}</td>
			<td>${i.contents}</td>
		</tr>
		</c:forEach>	
	</table>
	
	<div>
		<a href="./faqWrite">WRITE</a>
	</div>
		
</body>
</html>