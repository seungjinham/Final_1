<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person MyPage</title>
</head>
<body>

<h1>Person MyPage</h1>

	<p>ID : ${member.id}</p>
	<p>NAME : ${member.name}</p>
	<p>PHONE : ${member.phone}</p>
	<p>EMAIL : ${member.email}</p>
	<p>ADDR : ${member.addr}</p>
	<p>BIRTH : ${member.birth}</p>
	<p>GENDER : ${member.gender}</p>

	<hr>
	<h3>판매자</h3>
	<p><a href="./sellerWrite">판매자 등록하기</a></p>
	<p><a href="./sellerView">판매자 정보보기</a></p>
	<p><a href="./seller">거래내역</a></p>
</body>
</html>