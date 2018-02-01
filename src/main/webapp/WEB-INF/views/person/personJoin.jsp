<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person Join</title>
</head>
<body>

<h1>Person Join</h1>

	<form action="./personJoin" method="post">
	<p>ID : <input type="text" name="id" id="id"></p>
	<div id="result"></div>
	<p>PW : <input type="password" name="pw"></p>
	<p>NAME : <input type="text" name="name"></p>
	<p>PHONE : <input type="text" name="phone"></p>
	<p>EMAIL : <input type="text" name="email"></p>
	<p>ADDR : <input type="text" name="addr"></p>
	<p>BIRTH : <input type="text" name="birth"></p>
	<p>GENDER : M<input type="radio" value="M" name="gender">
			    W<input type="radio" value="W" name="gender"> </p>
	<p><button>JOIN</button></p>
	</form>
	
</body>
</html>