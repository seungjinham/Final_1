<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/mypage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Person MyPage</title>
<style type="text/css">
	#main2{
		width: 1080px;
		height: 900px;
	}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
		<%@ include file="../member/mypage.jsp"%>
		
		<h1 class="h1">회원 정보</h1>
		<form action="pseronMyPage" method="post">
			<p>ID : <input type="text" name="id" value="${member.id}" readonly="readonly"></p>
			<p>PW : <input type="text" name="pw" value="${member.pw}"></p>
			<p>NAME : <input type="text" name="name" value="${member.name}"></p>
			<p>EMAIL : <input type="text" name="email" value="${member.email}"></p>
			<p>PHONE : <input type="text" name="phone" value="${member.phone}"></p>
			<p>ADDR : <input type="text" name="addr" value="${member.addr}"></p>
			<p>BIRTH : <input type="text" name="birth" value="${member.birth}"></p>
			<p>
				GENDER :
				<c:if test="${member.gender eq 'M'}">
					M<input type="radio" checked="checked" value="M" name="gender">
					W<input type="radio" value="W" name="gender">
				</c:if>
				<c:if test="${member.gender eq 'W'}">
					M<input type="radio" value="M" name="gender">
					W<input type="radio" checked="checked" value="W" name="gender">
				</c:if>
			</p>
			<button>UPDATE</button>
		</form>
	</div>
	</section>
	<!-- footer-->
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>