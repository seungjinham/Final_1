<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ WRITE</title>
<link rel="stylesheet" type="text/css" href="../resources/css/faq/faqWrite.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		 $("#save").click(function(){
		        $("#frm").submit();
		    });
	});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<h1 id="writeH1">FAQ WRITE</h1>

		<form id="frm" action="./faqWrite" method="post">
		<div>
		 <label for="title">Title: </label>
		 <input type="text" id="writeTitle" name="title" placeholder="타이틀을 입력해 주세요!">
		</div>
		<div>
		 <label for="contents">Contents: </label>
		 <textarea id="writeContents" name="contents" placeholder="글을 등록해주세요!"></textarea>
		</div>
	
		<input type="button" value="등록" id="save">
		</form>
		
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>