<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	href="<%=request.getContextPath()%>/resources/css/member/findPw.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Find PW</title>
<script type="text/javascript">
	$(function() {

		$("#c_btn").click(function() {
			$("#p_input_border").hide();
			$("#c_input_border").show();
			$(this).css("border", "2px solid #23A41A");
			$(this).css("border-bottom", "none");
			$("#p_btn").css("border", "none");
			$("#p_btn").css("border-bottom", "2px solid #23A41A");
		});

		$("#p_btn").click(function() {
			$("#p_input_border").show();
			$("#c_input_border").hide();
			$(this).css("border", "2px solid #23A41A");
			$(this).css("border-bottom", "none");
			$("#c_btn").css("border", "none");
			$("#c_btn").css("border-bottom", "2px solid #23A41A");
		});
		
		$("#p_findPw_btn").click(function() {
			var id = $("#id").val();
			var name = $("#name").val();
			if(id == "" || name == ""){
				alert("정보를 입력해주세요.");
			}else{
				window.open("../person/p_sendMailPw?id="+$("#id").val()+"&name="+$("#name").val(),
						"", "top=300, left=750, width=300, height=260");
			}
		});
		
		$("#c_findPw_btn").click(function() {
			c_num = $("#c_num").val();
			window.open("../company/c_sendMailPw?c_num="+$("#c_num").val()+"&c_name="+$("#c_name").val(),
					"", "top=300, left=750, width=300, height=260");
		});
			
	});
</script>
</head>
<body>
	<!-- Header 시작 -->
	<%@ include file="../temp/header1.jsp"%>
	<!-- Header 끝 -->

	<!-- main 시작 -->
	<div id="select_border">
		<div id="id_border">
			<a href="./findId"><button id="find_id_btn">아이디 찾기</button></a>
		</div>
		<div id="pw_border">
			<a href="./findPw"><button id="find_pw_btn">비밀번호 찾기</button></a>
		</div>
	</div>
	<section id="main">
		<article id="find_border">
			<div id="kind_border">
				<div class="kind_btn" id="p_btn">
					<input type="button" value="개인회원">
				</div>
				<div class="kind_btn" id="c_btn">
					<input type="button" value="기업회원">
				</div>
			</div>

			<div id="sentence_border">
				<span id="emph">회원 가입시</span> 등록한 정보를 입력해주세요.
			</div>

			<article id="p_input_border">
				<div class="input_border_2">
					<div class="info_border">
						<div class="info_b">아이디</div>
						<input type="text" placeholder="아이디 입력" id="id" name="id">
					</div>
					<div class="info_border">
						<div class="info_b">이름</div>
						<input type="text" placeholder="이름 입력" id="name" name="name">
					</div>
					<div class="info_border">
						<div class="info_b">이메일</div>
						<input type="text" placeholder="이메일 입력" id="p_email" name="email">
					</div>
				</div>

				<div class="btn_border">
					<input type="button" value="확인" id="p_findPw_btn">
				</div>
			</article>

			<article id="c_input_border" style="display: none;">
				<div class="input_border_2">
					<div class="info_border">
						<div class="info_b">사업자 번호</div>
						<input type="text" placeholder=" ' - ' 포함 입력" id="c_num" name="c_num">
					</div>
					<div class="info_border">
						<div class="info_b">담당자</div>
						<input type="text" placeholder="담당자 이름 입력" id="c_name" name="c_name">
					</div>
					<div class="info_border">
						<div class="info_b">이메일</div>
						<input type="text" placeholder="이메일 입력" id="c_email" name="email">
					</div>
				</div>

				<div class="btn_border">
					<input type="button" value="확인" id="c_findPw_btn">
				</div>
			</article>

		</article>
	</section>
	<!-- main 끝 -->

	<!-- footer-->
	<%@ include file="../temp/footer.jsp"%>


</body>
</html>