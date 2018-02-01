<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>FAQ VIEW</h1>

	<h1>Title : ${view.title}</h1>
	<h1>Contents : ${view.contents}</h1>
	
	
	<a href="faqUpdate?num=${view.num}">Update</a>
	<a href="faqDelete?num=${view.num}">Delete</a>



</body>
</html>