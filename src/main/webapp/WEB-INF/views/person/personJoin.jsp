<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

					if (lower == true && number == true && id.length >= 6
							&& id.length <= 16) {
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
						$("#pwCheck").html(
								"비밀번호는 6~16자의 대/소문자, 숫자, 특수문자만 사용 가능합니다.");
						$("#pwCheck").css('color', 'red');
						$("#pwCheck").css('font-size', '12px');
						$("#pw2").attr('readonly', false);
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
				$("#pwCheck2").html("비밀번호가 일치하지 않습니다.");
				$("#pwCheck2").css('color', 'red');
				$("#pwCheck2").css('font-size', '12px');
			}

		});

		//이름
		$("#name").blur(function() {
			var name = $(this).val();
			var patt1 = /[가-힇]/g;
			var korean = patt1.test(name);

			if (korean == true) {
				$("#nameCheck").html("사용 가능합니다.");
				$("#nameCheck").css('color', 'blue');
				$("#nameCheck").css('font-size', '12px');
			} else {
				$("#nameCheck").html("잘못된 형식의 이름입니다.");
				$("#nameCheck").css('color', 'red');
				$("#nameCheck").css('font-size', '12px');
			}

		});

	});

	//주소
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	};
</script>
<style type="text/css">
#pw {
	font-size:
}
</style>
</head>
<body>

	<h1>Person Join</h1>

	<form action="./personJoin" method="post">
		<p>
			ID : <input type="text" name="id" id="id" placeholder="ID를 입력하세요.">
		</p>
		<div id="idCheck"></div>
		<p>
			PW : <input type="password" name="pw" id="pw"
				placeholder="비밀번호를 입력하세요.">
		</p>
		<span id="pwCheck"></span>
		<p>
			PW : <input type="password" name="pw2" readonly="readonly">
		</p>
		<span id="pwCheck2"></span>
		<p>
			NAME : <input type="text" name="name" placeholder="이름을 입력하세요.">
		</p>
		<span id="nameCheck"></span>
		<p>
			PHONE : <select>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> <input type="text" name="phone"> - <input type="text"
				name="phone">
		</p>
		<p>
			EMAIL : <input type="text" name="email">
		</p>
		<p>
			ADDR <input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()"
				value="우편번호 찾기"><br> <input type="text"
				id="sample6_address" placeholder="주소"> <input type="text"
				id="sample6_address2" placeholder="상세주소">
		</p>
		<p>
			BIRTH : <input type="date" name="birth">
		</p>
		<p>
			GENDER : M<input type="radio" value="M" name="gender"> W<input
				type="radio" value="W" name="gender">
		</p>
		<p>
			<input type="hidden" name="job" value="P">
		</p>
		<p>
			<button>JOIN</button>
		</p>
	</form>

</body>
</html>