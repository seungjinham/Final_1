<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
		$(".check").click(function(){
			if($(this).val()=='C'){
				$("#frm").attr("action", "../company/companyLogin");
			}else{
				$("#frm").attr("action", "../person/personLogin");
			}
		});
		$("#login_btn").click(function() {
			var id_1 = '${member.id}';
			var id_2 = $("#id").val();
			var pw_1 = '${member.pw}';
			var pw_2 = $("#pw").val();
			if(id_2 && pw_2 != null){
				$("#frm").submit();
			}else{
				$("#info_border").show();
			}
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
				<img src="../resources/images/member/p_icon.png" class="logo">
			</div>
			<div id="title">P!CK ME</div>
			<div class="logo_border">
				<img src="../resources/images/member/p_icon.png" class="logo">
			</div>
		</article>
	</section>

	<div class="s_border">
		<div class="s_border_2">
			<span class="s_text">개인회원</span> <input type="radio"
				checked="checked" class="check" name="member" id="person" value="P"> <span class="s_text">기업회원</span>
			<input type="radio" class="check" name="member" id="company" value="C">
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
	
	<c:if test="${result ne 'login'}">
		<div id="info_border" style="display: none;">
			<div id="info">
				ID 또는 비밀번호를 입력 해주세요.
			</div>
		</div>
	</c:if>
	
	<c:if test="${result eq 'p_login'}">
		<div id="info_border">
			<div id="info">
				ID 또는 비밀번호를 확인 해주세요.
			</div>
		</div>
	</c:if>
	
	<c:if test="${result eq 'c_login'}">
		<div id="info_border">
			<div id="info">
				ID 또는 비밀번호를 확인 해주세요.
			</div>
		</div>
	</c:if>
	
	<div class="j_border">
		<div class="j_border_2">
			회원이 아니시면 ☞ <a href="#" id="j_btn">회원가입</a>
		</div>
	</div>
	
</body>
</html>