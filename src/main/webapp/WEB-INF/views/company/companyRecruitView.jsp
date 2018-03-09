<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/c_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
			<%@ include file="../member/c_meun.jsp"%>
			<h1 class="h1">게재중인 공고</h1>
			공고보기
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
	
</body>
</html>