<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header1.jsp" %>

<h1> 공고 List</h1>
<table border="1">
<tr><th>지역</th><th>모집제목</th><th>급여</th><th>근무시간</th><th>마감기한</th></tr>
<c:forEach var="item" items="${list}">
	<tr>
		<td>${item.addr}</td>
		<td>
		<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.c_name}</a></p>
		<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.title}</a></p>
		</td>
		<td>${item.salary}</td>
		<td>${item.w_time}</td>
		<td>${item.deadline}</td>
	</tr>
</c:forEach>

</table>
</body>
</html>