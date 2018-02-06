<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Recruit</h1>
	<form action="companyRecruit" method="post" enctype="multipart/form-data">
		<p>id<input type="text" name="id"></p>
		<p>title<input type="text" name="title"></p>
		<p>deadLine<input type="date" name="deadline"></p>
		<p>people<input type="text" name="people"></p>
		<p>gender<input type="text" name="gender"></p>
		<p>age<input type="text" name="age"></p>
		<p>school<input type="text" name="school"></p>
		<p>special<input type="text" name="special"></p>
		<p>salary<input type="text" name="salary"></p>
		<p>w_date<input type="text" name="w_date"></p>
		<p>w_day<input type="text" name="w_day"></p>
		<p>w_time<input type="text" name="w_time"></p>
		<p>job<input type="text" name="job"></p>
		<p>work<input type="text" name="work"></p>
		<p>benefit<input type="text" name="benefit"></p>
		<p>contents<textarea rows="" cols="" name="contents"></textarea></p>
		<p><input type="file" name="file"></p>
		<button>등록</button>
	</form>
	

</body>
</html>