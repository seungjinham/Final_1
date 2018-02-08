<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerWirte.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>
	<section id="main">
		<div class="container">
			<h1>판매자 등록</h1>
			<form id="frm" name="frm" action="sellerWrite" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">
				<p class="menu">프로필 사진</p>
				<span id="del" title="photo">삭제</span>
				<p class="menu">이름 </p>
				<input type="text" name="name" value="${member.name}">
				<p class="menu">이메일</p>
				<input type="email" name="email" value="${member.email}">
				<p class="menu">전화번호</p>
				<input type="text" name="phone" value="${member.phone}">
				<p class="menu">카테고리</p>
				<select>
					<option class="category">디자인</option>
					<option class="category">IT & 프로그래밍</option>
					<option class="category">번역 & 통역</option>
				</select>
				<p class="menu">제목 <p>
				<input type="text" name="title">
				<p class="menu"> 서비스 설명 <p>
				<textarea name="contents"></textarea>
				<p class="menu"> A/S 및 환불 <p>
				<textarea name="refund"></textarea>
				<p><button class="btn btn-default">등록하기</button></p>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>