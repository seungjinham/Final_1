<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/css/common/header.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/common.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/footer.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Person Join</title>
<script type="text/javascript">
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

	$(function() {

		//약관 동의
		$("#all_check").click(function() {
			if ($(this).prop("checked")) {
				$(".box").prop("checked", true);
			} else {
				$(".box").prop("checked", false);
			}
		});
		$(".box").click(
				function() {
					if ($("#c1").prop("checked") && $("#c2").prop("checked")
							&& $("#c3").prop("checked")) {
						$("#all_check").prop("checked", true);
					} else {
						$("#all_check").prop("checked", false);
					}
				});

		//약관 동의서 보기
		var check = true;
		$("#ser_1").click(function() {
			if (check) {
				$("#ser_1").text("닫기▲");
				$(".see1").css("margin", "10px");
				check = false;
			} else {
				$("#ser_1").text("보기▼");
				check = true;
			}
			$(".see1").slideToggle("slow");
		});

		var check2 = true;
		$("#ser_2").click(function() {
			if (check2) {
				$("#ser_2").text("닫기▲");
				$(".see2").css("margin", "10px");
				check2 = false;
			} else {
				$("#ser_2").text("보기▼");
				check2 = true;
			}
			$(".see2").slideToggle("slow");
		});

		var joinCheck = false;

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
									$("#idCheck").css('font-size', '15px');
									joinCheck = true;
								} else {
									$("#idCheck").css('color', 'red');
									$("#idCheck").css('font-size', '15px');
								}
								$("#idCheck").html(data);
							}
						});
					} else {
						$("#idCheck").html("ID는 6~16자의 영문, 숫자만 사용 가능합니다.");
						$("#idCheck").css('color', 'red');
						$("#idCheck").css('font-size', '15px');
					}
				});

		$("#id").blur(function() {
			var id = $(this).val();
			if (id == '') {
				$("#idCheck").html("ID를 입력해주세요.");
				$("#idCheck").css('color', 'red');
				$("#idCheck").css('font-size', '15px');
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

					if (upper == true && lower == true && number == true
							&& special == true && pw.length >= 6
							&& pw.length <= 16) {
						$("#pwCheck").html("사용 가능한 비밀번호 입니다.");
						$("#pwCheck").css('color', 'blue');
						$("#pwCheck").css('font-size', '15px');
						$("#pw2").attr('readonly', false);
						joinCheck = true;
					} else {
						if (pw == '') {
							$("#pwCheck").html("비밀번호를 입력해주세요.");
							$("#pwCheck").css('color', 'red');
							$("#pwCheck").css('font-size', '15px');
							$("#pw2").attr('readonly', true);
						} else {
							$("#pwCheck").html(
									"비밀번호는 6~16자의 대/소문자, 숫자, 특수문자만 사용 가능합니다.");
							$("#pwCheck").css('color', 'red');
							$("#pwCheck").css('font-size', '15px');
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
				$("#pwCheck2").css('font-size', '15px');
				joinCheck = true;
			} else {
				if (pw2 == '') {
					$("#pwCheck2").html("비밀번호를 입력해주세요.");
					$("#pwCheck2").css('color', 'red');
					$("#pwCheck2").css('font-size', '15px');
				} else {
					$("#pwCheck2").html("비밀번호가 일치하지 않습니다.");
					$("#pwCheck2").css('color', 'red');
					$("#pwCheck2").css('font-size', '15px');
				}
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
				$("#nameCheck").css('font-size', '15px');
				joinCheck = true;
			} else {
				if (name == '') {
					$("#nameCheck").html("이름을 입력해주세요.");
					$("#nameCheck").css('color', 'red');
					$("#nameCheck").css('font-size', '15px');
				} else {
					$("#nameCheck").html("잘못된 형식의 이름입니다.");
					$("#nameCheck").css('color', 'red');
					$("#nameCheck").css('font-size', '15px');
				}
			}
		});

		//이메일
		var email = "";
		$("#code_btn").click(function() {
				email = $("#email").val();
				window.open("./p_sendMail?email=" + $("#email").val(),
							"", "top=300, left=750, width=370, height=370");
		});

		$("#j_btn").click(
				function() {
					if (email == $("#email").val()
							&& $("#check").val() == "t") {
						if ($("#id").val()
								&& ($("#pw").val() == $("#pw2").val())
								&& $("#name").val() && $(".phones").val()
								&& $(".addrs").val() && $(".birth").val()
								&& $(".gender").val() != null
								&& joinCheck == true) {
							if ($("#c1").prop("checked")
									&& $("#c2").prop("checked")) {
								frm.submit();
								alert("가입을 환영합니다.");
							} else {
								alert("약관 동의에 체크 해주세요.");
							}
						} else {
							alert("필수 사항을 확인 해주세요.");
						}
					} else {
						alert("이메일 인증 해주세요.")
					}
				});

	});
</script>
<style type="text/css">
</style>
<link
	href="<%=request.getContextPath()%>/resources/css/person/personJoin.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<!-- main 시작 -->
	<section id="main">
		<article class="title_border">
			<div class="title_border2">
				<b><span id="solo">개인</span> 회원가입</b>
			</div>
		</article>

		<div class="terms_border">
			<div class="terms_border2">
				<div class="all">
					<input type="checkbox" id="all_check"> 가입 전체약관 및 수신에 동의합니다.
				</div>
				<div class="tline"></div>
				<div class="agree">
					<input type="checkbox" class="box feel" id="c1"> <span
						class="point">[필수]</span> 서비스 이용약관 동의
					<button class="see" id="ser_1">보기▼</button>
					<div class="see1">
						<%@include file="./service_1.jsp"%>
					</div>
				</div>
				<div class="agree">
					<input type="checkbox" class="box feel" id="c2"> <span
						class="point">[필수]</span> 개인정보 수집 및 이용 동의
					<button class="see" id="ser_2">보기▼</button>
					<div class="see2">
						<%@include file="./service_2.jsp"%>
					</div>
				</div>
				<div class="agree">
					<input type="checkbox" class="box" id="c3"> <span
						id="choice">[선택]</span> 개인정보 수집 및 이용 동의 <br> <span id="sub">(공고
						소식 및 광고메일, 휴대폰 알림)</span>
				</div>
			</div>
		</div>


		<div id="table_border">
			<form action="./personJoin" method="post" id="frm" name="frm">
				<input type="hidden" name="job" value="P">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font"><input type="text" name="id" id="id"
							placeholder="6~16자 영문,숫자" class="inupt_f"><br> <span
							id="idCheck"></span></td>
					</tr>
					<tr>
						<th class="font">비밀번호</th>
						<td class="font"><input type="password" name="pw" id="pw"
							placeholder="6~16자 대/소문자,숫자,특수문자" class="inupt_f"><br>
							<span id="pwCheck"></span></td>
					</tr>
					<tr>
						<th class="font">비밀번호 확인</th>
						<td class="font"><input type="password" name="pw2" id="pw2"
							class="inupt_f"><br> <span id="pwCheck2"></span></td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">이름</th>
						<td class="font"><input type="text" name="name" id="name"
							class="inupt_f" placeholder="한글 입력"><br> <span id="nameCheck"></span></td>
					</tr>
					<tr>
						<th class="font">휴대폰</th>
						<td class="font"><select name="phone" id="p_select"
							class="phones">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> ─ <input type="text" name="phone" class="phone phones"> ─
							<input type="text" name="phone" class="phone phones"></td>
					</tr>
					<tr>
						<th class="font">주소</th>
						<td class="font"><input type="text" id="sample6_postcode"
							placeholder="우편번호" name="addr" class="addr addrs"> <input
							type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" id="addr_btn"><br> <input
							type="text" id="sample6_address" placeholder="주소" name="addr"
							class="addr2 addrs"> <input type="text"
							id="sample6_address2" placeholder="상세주소" name="addr"
							class="addr2 addrs"></td>
					</tr>
					<tr>
						<th class="font">생년월일</th>
						<td class="font"><input type="text" class="birth"
							name="birth">년 <input type="text" class="birth"
							name="birth">월 <input type="text" class="birth"
							name="birth">일</td>
					</tr>
					<tr>
						<th class="font">성별</th>
						<td class="font">남자 <input type="radio" value="M"
							name="gender" class="gender"> 여자 <input type="radio"
							value="W" name="gender" class="gender">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">이메일</th>
						<td class="font">
							<input type="text" name="email" class="email" id="email"
							placeholder="'@' 포함 입력">
							 
							<input type="button" id="code_btn" value="인증">
						
							<input type="hidden" name="check" id="check" value="f">
						</td>
					</tr>
				</table>
				<div class="j_btn_b">
					<input type="button" id="j_btn" value="가입하기">
				</div>
			</form>
		</div>
	</section>

	<!-- main 끝 -->

	<%@ include file="../temp/footer.jsp"%>

</body>
</html>