<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<form id="frm" name="frm" action="sellerUpdate" method="post" enctype="multipart/form-data">
		<p id="photo">프로필 사진 : <span id="del" title="photo">삭제</span></p>
		<input type="hidden" name="id" value="${member.id}">
		<p>이름 : <input type="text" name="name" value="${member.name}"></p>
		<p>이메일 : <input type="email" name="email" value="${member.email}"></p>
		<p>전화번호 : <input type="text" name="phone" value="${member.phone}"></p>
		
		<p>
			카테고리 : 
			<select>
				<option class="category">디자인</option>
				<option class="category">IT & 프로그래밍</option>
				<option class="category">번역 & 통역</option>
			</select>
		</p>


		<input type="button" value="Write" id="btn">
	</form>
</body>
</html>