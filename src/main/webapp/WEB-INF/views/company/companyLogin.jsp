<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company Login</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<h1>Company Login</h1>
	
	<form action="companyLogin" method="post">
	<p>ID : <input type="text" name="id"></p>
	<p>PW : <input type="password" name="pw"></p>
	<p><button>LOGIN</button></p>
	</form>
	
</body>
</html>