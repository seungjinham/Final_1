<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/c_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
		<%@ include file="../member/c_meun.jsp"%>
			
			<article id="tit_border">
				<div id="tit">공고 등록하기</div>
			</article>
			<form action="companyRecruit" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${company.id}">
				<p>title<input type="text" name="title"></p>
				<p>deadLine<input type="date" name="deadline"></p>
				<p>people<input type="text" name="people"></p>
				<p>gender<input type="text" name="gender"></p>
				<p>age<input type="text" name="age"></p>
				<p>school<input type="text" name="school"></p>
				<p>special<input type="text" name="special"></p>
				<p>salary<input type="text" name="salary"></p>
				<p>w_date<input type="text" name="w_date"></p>
				<p>w_day<input type="text" name="w_day"></p>
				<p>w_time<input type="text" name="w_time"></p>
				<p>job<input type="text" name="job"></p>
				<p>work<input type="text" name="work"></p>
				<p>benefit<input type="text" name="benefit"></p>
				<p>contents<textarea name="contents"></textarea></p>
				<p><input type="file" name="file"></p>
				<button>등록</button>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>