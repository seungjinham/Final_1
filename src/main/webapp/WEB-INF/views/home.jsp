<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Pick Me</title>
</head>
<body>
	<h1>PICK ME</h1>

	<c:if test="${empty member}">
		<a href="member/login">Login</a>
		<a href="member/join">join</a>
	</c:if>

	<c:if test="${not empty member}">
	<c:if test="${member.job eq 'P'}">
		<a href="./person/personMyPage">MyPage</a>
	</c:if>
	<c:if test="${member.job eq 'C'}">
		<a href="./company/companyMyPage">MyPage</a>
	</c:if>
		<a href="./member/memberLogOut">LogOut</a>
	</c:if>

	<hr>
	<a href="company/companyRecruit">Recruit</a>
	<hr>
	<a href="recruit/recruitList">공고 검색</a>
	<hr>
	<h3>재능검색</h3>
	<a href="sell/sellerList?category=design">디자인</a>
	<a href="sell/sellerList?category=it">IT & 프로그래밍</a>
	<a href="sell/sellerList?category=translate">번역 & 통역</a>

	<hr>
	<a href="faq/faqList">FAQ</a>
	


</body>
</html>
