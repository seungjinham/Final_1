<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>판매자 정보</h1>
	<h3>이름 : ${member.id}</h3>
	<input type="hidden" value="${member.id}">
	<a href="./sellerUpdate">수정하기</a>
	<a href="./sellerDelete">삭제하기</a>
</body>
</html>