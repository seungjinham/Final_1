<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company Join</title>
</head>
<body>
	<h1>Company Join</h1>
	<form action="./companyJoin" method="post">
		<p>id<input type="text" name="id"></p>
		<p>pw<input type="text" name="pw"></p>
		<p>name<input type="text" name="name"></p>
		<p>phone<input type="text" name="phone"></p>
		<p>email<input type="text" name="email"></p>
		<p>addr<input type="text" name="addr"></p>
		<p>c_name<input type="text" name="c_name"></p>
		<p>c_num<input type="text" name="c_num"></p>
		<button>Join</button>
	</form>
</body>
</html>