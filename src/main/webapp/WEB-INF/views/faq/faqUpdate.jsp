<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ UPDATE</title>
<link rel="stylesheet" type="text/css" href="../resources/css/faq/faqUpdate.css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">

			<h1 id="h1">FAQ UPDATE</h1>

			<form id="frm" action="faqUpdate" method="post">
				<input type="hidden" name="num" value="${view.num}">
				<div>
					<label for="title">Title: </label> <input id="updateTitle"
						type="text" name="title" value="${view.title}">
				</div>

				<div>
					<label for="contents">Contents: </label>
					<textarea id="updateContents" name="contents">${view.contents}</textarea>
				</div>

				<input id="save" type="submit" value="update">
			</form>



		</div>
		<div class="top">
				<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> <span>TOP</span>
					<img class="width-10px position-relative" style="top: -1px"
					src="/f1/resources/images/common/top.png" width="15px"
					height="15px;">
				</a>
			</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>