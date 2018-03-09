<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change PW</title>
<link
	href="<%=request.getContextPath()%>/resources/css/common/header.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/common.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/footer.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/member/p_meun.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/person/personChangePw.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#m1").ready(function() {
			$(".m1").show("slow");
		});
		$("#m1").css("color", "white");
		$("#m1").css("background-color", "#23A41A");
		$("#m1").css("font-weight", "normal");
		$("#s_m3").css("color", "#23A41A");
		$("#s_m3").css("font-weight", "bold");

		$("#new_btn").click(function() {
			var pw = $("#pw").val();
			var new_pw = $("#new_pw").val();
			var new_pw2 = $("#new_pw2").val();
			var member_pw = '${member.pw}';
			if (member_pw != pw) {
				alert("현재 비밀번호가 일치하지 않습니다.");
			}

			if (pw != "") {
				if (new_pw == new_pw2 && (new_pw && new_pw2) != "") {
					frm.submit();
				}
				if (new_pw != new_pw2) {
					alert("새 비밀번호가 일치하지 않습니다.");
				}
				if ((new_pw && new_pw2) == "") {
					alert("새로운 비밀번호를 입력해주세요.");
				}
			} else {
				alert("비밀번호를 입력해 주세요.");
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
			<%@ include file="../member/p_meun.jsp"%>

			<div id="tit_border">
				<div id="tit">비밀번호 변경</div>
			</div>

			<article class="change_border">
				<div class="phrase_border">
					<ul>
						<li>1. 현재 사용중인 비밀번호를 입력하신 후 <span class="reds">새로 사용하실
								비밀번호</span>를 입력하세요.
						</li>
						<li>2. 비밀번호는 <span class="reds">6 ~ 16자의 영문, 숫자, 특수문자</span>를
							사용할 수 있습니다.
						</li>
						<li>3. 비밀번호 입력시 타인에게 <span class="reds">노출되지 않도록 주의</span>
							해주세요.
						</li>
						<li></li>
					</ul>
				</div>

				<form action="./personChangePw" id="frm" method="post">
					<input type="hidden" name="id" value="${member.id}">
					<div class="change_b">
						<div class="change_b_2">
							<div class="pass">현재 비밀번호</div>
							<input type="password" placeholder="현재 비밀번호" id="pw">
						</div>
						<div class="change_b_2">
							<div class="pass">새 비밀번호</div>
							<input type="password" placeholder="6 ~ 16자 영문, 숫자, 특수문자"
								id="new_pw" name="pw">
						</div>
						<div class="change_b_2">
							<div class="pass">새 비밀번호 확인</div>
							<input type="password" id="new_pw2">
						</div>
					</div>

					<div id="btn_border">
						<input type="button" value="확인" id="new_btn">
					</div>
				</form>
			</article>
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>