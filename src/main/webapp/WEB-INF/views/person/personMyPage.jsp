<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Person MyPage</title>
<script type="text/javascript">
</script>
</head>
<body>

<h1>Person MyPage</h1>

	<form action="pseronMyPage" method="post">
	<p>ID : <input type="text" name="id" value="${member.id}" readonly="readonly"></p>
	<p>PW : <input type="text" name="pw" value="${member.pw}"></p>
	<p>NAME : <input type="text" name="name" value="${member.name}"></p>
	<p>EMAIL : <input type="text" name="email" value="${member.email}"></p>
	<p>PHONE : <input type="text" name="phone" value="${member.phone}"></p>
	<p>ADDR : <input type="text" name="addr" value="${member.addr}"></p>
	<p>BIRTH : <input type="text" name="birth" value="${member.birth}"></p>
	<p>GENDER : 
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

	<hr>
	<h3>판매자</h3>
	<p><a href="../sell/sellerWrite">판매자 등록하기</a></p>
	<p><a href="../sell/sellerView">판매자 정보보기</a></p>
	<p><a href="./PersonUse">거래내역</a></p>
	
	<hr>
	<p><a href="../scrap/scrapSelectList">스크랩보기</a>
	
</body>
</html>