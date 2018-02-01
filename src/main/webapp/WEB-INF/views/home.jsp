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
		<a href="./member/memberMyPage?id=${member.id}&job=${member.job}">MyPage</a>
		<a href="./member/memberLogOut">LogOut</a>
	</c:if>

	<a href="faq/faqList">FAQ</a>

</body>
</html>
