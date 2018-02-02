<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<p id="photo">프로필 사진 : <span id="del" title="photo">${seller.oname} 삭제</span></p>
		<input type="hidden" name="id" value="${member.id}">
		<p>이름 : <input type="text" name="name" value="${member.name}"></p>
		<p>이메일 : <input type="email" name="email" value="${member.email}"></p>
		<p>대표 전화번호 : <input type="text" name="phone" value="${member.phone}"></p>
		
		<p>제목 : <input type="text" name="phone" value="${seller.title}"></p>
		<p>내용 : <input type="text" name="phone" value="${member.phone}"></p>
		<p>제목 : <input type="text" name="phone" value="${member.phone}"></p>
		<p>제목 : <input type="text" name="phone" value="${member.phone}"></p>
		<p>제목 : <input type="text" name="phone" value="${member.phone}"></p>
		<p>제목 : <input type="text" name="phone" value="${member.phone}"></p>
</body>
</html>