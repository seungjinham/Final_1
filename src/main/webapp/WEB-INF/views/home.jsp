<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pick Me</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
	<script type="text/javascript">
	</script>
	<style type="text/css">
	.top {
	position: absolute;
	right: 20px;
	top: 400px;
}
	</style>
</head>
<body>
	<%@ include file="./temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
			<img src="./resources/upload/zw2.jpg" width="1080px" height="720px">			
		</div>
	</section>
	<%@ include file="./temp/footer.jsp" %>	
</body>
</html>
