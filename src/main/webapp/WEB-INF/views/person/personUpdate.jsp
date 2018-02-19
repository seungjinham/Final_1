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
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/person/personUpdate.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Person Update</title>
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
		$("#m1").ready(function(){
			$(".m1").show("slow");
		});
		$("#m1").css("color", "white");
		$("#m1").css("background-color", "#23A41A");
		$("#m1").css("font-weight", "normal");
		$("#s_m1").css("color", "#23A41A");
		$("#s_m1").css("font-weight", "bold");
		
		var phone = '${member.phone}';
		var phoneArr = phone.split(',');
		$("#p2").attr("value", phoneArr[1]);
		$("#p3").attr("value", phoneArr[2]);
		
		var birth = '${member.birth}';
		var birthArr = birth.split(',');
		$("#b1").attr("value", birthArr[0]);
		$("#b2").attr("value", birthArr[1]);
		$("#b3").attr("value", birthArr[2]);
		
		var addr = '${member.addr}';
		var addrArr = addr.split(',');
		$("#sample6_postcode").attr("value", addrArr[0]);
		$("#sample6_address").attr("value", addrArr[1]+addrArr[2]);
		$("#sample6_address2").attr("value", addrArr[3]);
		
		var email = '${member.email}';
		var emailArr = email.split(',');
		$("#doma").attr("value", emailArr[0]);
		$("#domain").attr("value", emailArr[1]);
		
		$("#btn").click(function() {
			frm.submit();
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div id="main2">
			<%@ include file="../member/p_meun.jsp"%>

			<div id="tit_border">
				<div id="tit">회원정보 수정</div>
			</div>
			<form action="./personUpdate" method="post" id="frm">
			<input type="hidden" name="job" value="P">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font"><span id="p_id">${member.id}</span>
						<input type="hidden" name="id" value="${member.id}">
						<input type="hidden" name="pw" value="${member.pw}"></td>
					</tr>
					<tr>
						<th class="font">이름</th>
						<td class="font"><input type="text" name="name" id="name"
							class="inupt_f" value="${member.name}"><br> <span id="nameCheck"></span></td>
					</tr>
					<tr>
						<th class="font">휴대폰</th>
						<td class="font"><select name="phone" id="p_select">
								<option value="010" class="o">010</option>
								<option value="011" class="o">011</option>
								<option value="016" class="o">016</option>
								<option value="017" class="o">017</option>
								<option value="018" class="o">018</option>
								<option value="019" class="o">019</option>
						</select> ─ <input type="text" name="phone" class="phone" id="p2"> ─ <input
							type="text" name="phone" class="phone" id="p3"></td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">주소</th>
						<td class="font"><input type="text" id="sample6_postcode"
							placeholder="우편번호" name="addr" class="addr"> <input
							type="button" onclick="sample6_execDaumPostcode()"
							value="새 주소 설정" id="addr_btn"><br> <input
							type="text" id="sample6_address" placeholder="주소" name="addr"
							class="addr2"> <input type="text" id="sample6_address2"
							placeholder="상세주소" name="addr" class="addr2"></td>
					</tr>
					<tr>
						<th class="font">생년월일</th>
						<td class="font">
						<input type="text" class="birth" name="birth" id="b1"> 년 
						<input type="text" class="birth" name="birth" id="b2"> 월 
						<input type="text" class="birth" name="birth" id="b3"> 일
						</td>
					</tr>
					<tr>
						<th class="font">성별</th>
						<td class="font">
							<c:if test="${member.gender eq 'M'}"> 
								남자 <input type="radio" value="M" name="gender" checked="checked"> 
								여자 <input type="radio" value="W" name="gender">
							</c:if>
							<c:if test="${member.gender eq 'W'}">
								남자 <input type="radio" value="M" name="gender"> 
								여자 <input type="radio" value="W" name="gender" checked="checked">
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">이메일</th>
						<td class="font"><input type="text" name="email"
							class="email" id="doma"> @ <input type="text" name="email"
							class="email" id="domain"> <select id="e_select">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="zum.com">zum.com</option>
								<option value="yahoo.com">yahoo.com</option>
						</select><br>
							<button id="code_btn">인증번호 받기</button></td>
					</tr>
				</table>
				<div id="btn_border">
					<div id="btn_border_2">
						<input type="button" value="회원수정" id="btn">
					</div>
				</div>
			</form>
		</div>

	</section>
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>