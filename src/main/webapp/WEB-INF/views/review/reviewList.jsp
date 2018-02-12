<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Page</title>
</head>
<body>
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


</body>
</html>