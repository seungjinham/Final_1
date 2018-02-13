<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Login</title>
<script type="text/javascript">
	$(function() {
		$("#company").click(function() {
			$("#frm").attr("action", "../company/companyLogin");
			$(".logo").attr("src", "../resources/images/common/c_logo.PNG");
			$("#login_btn").css("background-color", "#33adff");
			$("#j_btn").css("color", "#33adff");
			$("#title_border_2").css("border-bottom", "2px solid #33adff");
			$(".in").css("border", "2px solid #33adff");
		});
		$("#person").click(function() {
			$("#frm").attr("action", "../person/personLogin");
			$(".logo").attr("src", "../resources/images/common/footer_logo.png");
			$("#login_btn").css("background-color", "#23A41A");
			$("#j_btn").css("color", "#23A41A");
			$("#title_border_2").css("border-bottom", "2px solid #23A41A");
			$(".in").css("border", "2px solid #23A41A");
		});
			
		$("#login_btn").click(function() {
			$("#frm").submit();
		});
		
		$("#j_btn").click(function() {
			window.opener.top.location.href="<%=request.getContextPath()%>/member/join";
			window.close();
		});
	});
</script>
<style type="text/css">
</style>
<link href="<%=request.getContextPath()%>/resources/css/member/login.css" rel="stylesheet">

</head>
<body>

	<section class="title_border">
		<article id="title_border_2">
			<div class="logo_border">
				<img src="../resources/images/common/footer_logo.png" class="logo">
			</div>
			<div id="title">PICK ME</div>
			<div class="logo_border">
				<img src="../resources/images/common/footer_logo.png" class="logo">
			</div>
		</article>
	</section>

	<div class="s_border">
		<div class="s_border_2">
			<span class="s_text">개인회원s</span> <input type="radio"
				checked="checked" class="check" name="member" id="person" value="p"> <span class="s_text">기업회원</span>
			<input type="radio" class="check" name="member" id="company" value="c">
		</div>
	</div>

	<section class="l_border">
		<article class="l_border_2">
			<form action="../person/personLogin" method="post" id="frm">
				<p><input type="text" name="id" placeholder=" ID 입력" id="id" class="in"></p>
				<p><input type="password" name="pw" placeholder=" 비밀번호 입력" id="pw" class="in"></p>
				<p><input type="button" value="LOGIN" id="login_btn"></p>
			</form>
			<article class="find_border">
				<div class="find_border_2">
					<a href="#">아이디 찾기</a>┃<a href="#">비밀번호 찾기</a>
				</div>
			</article>
		</article>
	</section>
	
	<div class="j_border">
		<div class="j_border_2">
			회원이 아니시면 ☞ <a href="#" id="j_btn">회원가입</a>
		</div>
	</div>
	
	<!-- <form action="../company/companyLogin" method="post"> -->

</body>
</html>