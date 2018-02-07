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
<a href="../scrap/scrapDelete">ScrapDelete</a>
<table border="1">
<tr><th>선택</th><th>지역</th><th>채용공고</th><th>급여</th><th>마감기한</th></tr>
<c:forEach var="result" items="${scrap_result}" begin="0" step="1">
<tr>
<td><input type="checkbox"></td>
<td>${result.addr}</td>
<td>${result.c_name} / ${result.title}</td>
<td>${result.salary}</td>
<td>${result.deadline}</td>
</tr>
</c:forEach>
</table>
</body>
</html>