<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<h1>company MyPage</h1>
	
	<p>ID : ${member.id}</p>
	<p>NAME : ${member.name}</p>
	<p>PHONE : ${member.phone}</p>
	<p>EMAIL : ${member.email}</p>
	<p>ADDR : ${member.addr}</p>
	<p>C_NAME : ${member.c_name}</p>
	<p>C_NUM : ${member.c_num}</p>

</body>
</html>