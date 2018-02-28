<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/css/person/p_sendMailok.css"
	rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#ok").click(function() {
			opener.parent.location.href = "../";
			window.self.close();
		});
	});
</script>
</head>
<body>
	<section id="main_border">
		<article id="tit_border">
			<div id="logo"></div>
			<div id="tit">P!CK ME</div>
			<div id="logo"></div>
		</article>

		<article id="word_border">
			<div class="word">
				※ <label>${checkmsg}</label>님의 메일로 <span id="red">비밀번호</span>가 전송.
			</div>
			<div class="word">
				※ 메일에서 <span id="red">비밀번호</span>를 확인해주세요..
			</div>

		</article>

		<article id="btn_border">
			<button id="ok">확인</button>
		</article>
	</section>
</body>
</html>