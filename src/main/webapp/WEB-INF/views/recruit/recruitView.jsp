<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	
	<a href="../apply/applyInsert?recruit_num=${recruit.num}&id=${member.id}">Apply</a>
	<a href="../scrap/scrapInsert?recruit_num=${recruit.num}&id=${member.id}">Scrap</a>
	<h1>${company.addr}</h1>
	<h1>${recruit.id}</h1>
	<h1>${recruit.title}</h1>
	<h1>${recruit.people}</h1>
	<h1>${recruit.school}</h1>
	<h1>${recruit.special}</h1>
	<h1>${recruit.salary}</h1>
</body>
</html>