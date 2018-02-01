<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ WRITE</title>
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

<h1>FAQ WRITE</h1>

	<form id="frm" action="./faqWrite" method="post">
	<p>Title: <input type="text" name="title" placeholder="타이틀을 입력해 주세요!"></p>
	<p>Contents: <textarea name="contents" placeholder="글을 등록해주세요!"></textarea></p>
	
	<input type="button" value="등록" id="save">
	</form>

</body>
</html>