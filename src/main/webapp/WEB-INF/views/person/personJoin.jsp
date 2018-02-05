<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Person Join</title>
<script type="text/javascript">
	$(function() {

		//ID 중복 확인
		$("#id").keyup(
				function() {
					var id = $(this).val();

					//id 생성 조건
					var patt1 = /[a-z]/g; //영어
					var lower = patt1.test(id);
					var patt2 = /[0-9]/g; //숫자
					var number = patt2.test(id);

					if (lower == true && number == true && id.length >= 6 && id.length <= 16) {
						$.ajax({
							url : "./personIdCheck",
							type : "GET",
							data : {
								id : id
							},
							success : function(data) {
								if ($.trim(data) == "사용 가능한 ID 입니다.") {
									$("#idCheck").css('color', 'blue');
									$("#idCheck").css('font-size', '12px');
								} else {
									$("#idCheck").css('color', 'red');
									$("#idCheck").css('font-size', '12px');
								}
								$("#idCheck").html(data);
							}
						});
					} else {
						$("#idCheck").html("ID는 6~16자의 영문, 숫자만 사용 가능합니다.");
						$("#idCheck").css('color', 'red');
						$("#idCheck").css('font-size', '12px');
					}
				});

		$("#id").blur(function() {
			var id = $(this).val();
			if (id == '') {
				$("#idCheck").html("ID를 입력해주세요.");
				$("#idCheck").css('color', 'red');
				$("#idCheck").css('font-size', '12px');
			}
		});

		//비밀번호 설정
		$("#pw").blur(
				function() {
					var pw = $(this).val();

					//PW 생성 조건
					var patt1 = /[A-Z]/g; //대문자
					var upper = patt1.test(pw);
					var patt2 = /[a-z]/g; //소문자
					var lower = patt2.test(pw);
					var patt3 = /[0-9]/g; //숫자
					var number = patt3.test(pw);
					var patt4 = /[~!@#$%^&*=+-_,.`]/g; //특수문자
					var special = patt4.test(pw);

					if (upper == true && lower == true && number == true && special == true && pw.length >= 6 && pw.length <= 16) {
						$("#pwCheck").html("사용 가능한 비밀번호 입니다.");
						$("#pwCheck").css('color', 'blue');
						$("#pwCheck").css('font-size', '12px');
						$("#pw2").attr('readonly', false);
					} else {
						if (pw == '') {
							$("#pwCheck").html("비밀번호를 입력해주세요.");
							$("#pwCheck").css('color', 'red');
							$("#pwCheck").css('font-size', '12px');
							$("#pw2").attr('readonly', true);
						} else {
							$("#pwCheck").html("비밀번호는 6~16자의 대/소문자, 숫자, 특수문자만 사용 가능합니다.");
							$("#pwCheck").css('color', 'red');
							$("#pwCheck").css('font-size', '12px');
							$("#pw2").attr('readonly', false);
						}
					}
				});



	//비밀번호 확인
		$("#pw2").blur(function() {
			var pw1 = $("#pw").val();
			var pw2 = $(this).val();
			if (pw1 == pw2 && pw2 != '') {
				$("#pwCheck2").html("비밀번호가 일치합니다.");
				$("#pwCheck2").css('color', 'blue');
				$("#pwCheck2").css('font-size', '12px');
			} else {
				if (pw2 == '') {
					$("#pwCheck2").html("비밀번호를 입력해주세요.");
					$("#pwCheck2").css('color', 'red');
					$("#pwCheck2").css('font-size', '12px');
				}else {
					$("#pwCheck2").html("비밀번호가 일치하지 않습니다.");
					$("#pwCheck2").css('color', 'red');
					$("#pwCheck2").css('font-size', '12px');
				}
			}
		});

	

	$("#name").blur(function() {
			var name = $(this).val();
			var patt1 = /[가-힇]/g;
			var korean = patt1.test(name);

			if (korean == true) {
				$("#nameCheck").html("사용 가능합니다.");
				$("#nameCheck").css('color', 'blue');
				$("#nameCheck").css('font-size', '12px');
			} else {
				if (name == '') {
					$("#nameCheck").html("이름을 입력해주세요.");
					$("#nameCheck").css('color', 'red');
					$("#nameCheck").css('font-size', '12px');
				} else {
					$("#nameCheck").html("잘못된 형식의 이름입니다.");
					$("#nameCheck").css('color', 'red');
					$("#nameCheck").css('font-size', '12px');
				}
			}
		});

	});
</script>
<style type="text/css">
#pw{
	font-size: 
}
</style>
</head>
<body>

<h1>Person Join</h1>

	<form action="./personJoin" method="post">
	<p>ID : <input type="text" name="id" id="id"></p>
	<div id="idCheck"></div>
	<p>PW : <input type="password" name="pw" id="pw"></p>
	<span id="pwCheck"></span>
	<p>PW : <input type="password" readonly="readonly" name="pw2" id="pw2"></p>
	<span id="pwCheck2"></span>
	<p>NAME : <input type="text" name="name" id="name"></p>
	<span id="nameCheck"></span>
	<p>PHONE : <input type="text" name="phone" id="phone"></p>
	<p>EMAIL : <input type="text" name="email" id="email"></p>
	<p>ADDR : <input type="text" name="addr"></p>
	<p>BIRTH : <input type="text" name="birth"></p>
	<p>GENDER : M<input type="radio" value="M" name="gender">
			    W<input type="radio" value="W" name="gender"> </p>
	<p><input type="hidden" name="job" value="P"></p>
	<p><button>JOIN</button></p>
	</form>
	
</body>
</html>