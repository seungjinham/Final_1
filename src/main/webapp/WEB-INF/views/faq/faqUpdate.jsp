<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<h1>FAQ UPDATE</h1>
	
	<form action="faqUpdate" method="post">
		<input type="hidden" name="num" value="${view.num}">
		<p>TITLE: <input type="text" value="${view.title}" placeholder="제목을 수정해주세요!"></p>
		<p>CONTENTS: <textarea name="contents" placeholder="내용을 수정해주세요!" >${view.contents}</textarea></p>
	
		<input type="submit" value="update">
	</form>
	
</body>
</html>