<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" name="frm" action="sellerWrite" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${member.id}">
		<p>NAME : <input type="text" name="name" value="${member.name}"></p>
		<p>EMAIL : <input type="email" name="email" value="${member.email}"></p>
		<p>PHONE : <input type="text" name="phone" value="${member.phone}"></p>
		<p>AGE : <input type="text" name="age" value="${member.age}"></p>
		<p id="photo">Photo : <span id="del" title="photo">${member.oname} X</span></p>
		<input type="button" value="Update" id="btn">
	</form>
</body>
</html>