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
<link href="<%=request.getContextPath()%>/resources/css/member/meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/person/personUpdate.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Person Update</title>
<script type="text/javascript">
	$(function() {
		var phone = '${member.phone}';
		var phoneArr = phone.split(',');
		$("#p2").attr("value", phoneArr[1]);
		$("#p3").attr("value", phoneArr[2]);
		
		
		$(".o").each(function() {
			var p1 = phoneArr[0];
			var i = $(this).val();
			if(i == p1){
				$(".o").attr("selected", "selected");
			}
		});
		
		var birth = '${member.birth}';
		var birthArr= birth.split(',');
		$("#b1").attr("value", birthArr[0]);
		$("#b2").attr("value", birthArr[1]);
		$("#b3").attr("value", birthArr[2]);
		
		
	});
</script>
<style type="text/css">
#main2{
	width: 1080px;
	height: 970px;
}
#tit_border{
	width: 700px;
	height: 80px;
	float:left;
}
#tit{
	width: 600px;
	height: 80px;
	color: #23A41A;
    font-size: 37px;
    font-weight: bolder;
    letter-spacing: -1px;
    font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic', sans-serif, "돋움", Dotum, "굴림", Gulim;
    margin-left: 5px;
 				
}

table {
	width: 650px;
	height: 800px;
	border-top: 2px solid #23A41A;
	border-bottom: 2px solid #23A41A;
}

th {
	width: 70px;
	text-align: left;
}

.font {
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

td {
	width: 280px;
}

.tline {
	width: 600px;
	height: 5px;
	border-top: 1px dotted #23A41A;
}

.inupt_f {
	width: 300px;
	height: 30px;
}

#p_select {
	width: 80px;
	height: 30px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

.phone {
	width: 80px;
	height: 25px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

.birth {
	width: 80px;
	height: 25px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

.addr {
	width: 150px;
	height: 25px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

#addr_btn {
	width: 120px;
	height: 30px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
	margin-top: 10px;
	border-radius: 5px;
	border: 1px solid gray;
	margin-bottom: 5px;
	cursor: pointer;
	background-color: white;
}

#addr_btn:hover {
	font-weight: bold;
	font-size: 15px;
	color: #23A41A;
	border: 2px solid #23A41A;
}

.addr2 {
	width: 200px;
	height: 25px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

.email {
	width: 150px;
	height: 25px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

#e_select {
	width: 100px;
	height: 30px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
}

#code_btn {
	width: 130px;
	height: 30px;
	font-size: 15px;
	font-family: "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
	margin-top: 10px;
	border-radius: 5px;
	border: 1px solid gray;
	background-color: white;
}

#code_btn:hover {
	font-weight: bold;
	font-size: 15px;
	color: #23A41A;
	border: 2px solid #23A41A;
	cursor: pointer;
}

#btn_border{
	width: 500px;
	height: 100px;
	float:left;
	padding-top: 40px;
	margin-left: 370px;
}
#btn_border_2{
	width: 260px;
	height: 80px;
	margin: 0 auto;
	text-align: center;
}
#btn{
	width: 130px;
	height: 60px;
	color: white;
	border: none;
	border-radius: 5px;
	background-color: #23A41A;
	font-size: 17px;
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic', sans-serif, "돋움", Dotum, "굴림", Gulim;
	padding-bottom: 3px;
	cursor: pointer;
}
#btn:HOVER {
	background-color: white;
	border: 2px solid #23A41A;
	color: #23A41A;
	font-size: 19px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div id="main2">
			<%@ include file="../member/meun.jsp"%>

			<div id="tit_border">
				<div id="tit">회원정보 수정</div>
			</div>
			<form action="./personUpdate" method="post">
			<input type="hidden" name="job" value="P">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font"><input type="text" name="id" id="id"
							class="inupt_f" value="${member.id}" readonly="readonly"><br> <span
							id="idCheck"></span></td>
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
						</select> ─ <input type="text" name="phone" class="phone" id="p2" value=""> ─ <input
							type="text" name="phone" class="phone" id="p3" value=""></td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">주소</th>
						<td class="font"><input type="text" id="sample6_postcode"
							placeholder="우편번호" name="addr" class="addr"> <input
							type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" id="addr_btn"><br> <input
							type="text" id="sample6_address" placeholder="주소" name="addr"
							class="addr2"> <input type="text" id="sample6_address2"
							placeholder="상세주소" name="addr" class="addr2"></td>
					</tr>
					<tr>
						<th class="font">생년월일</th>
						<td class="font">
						<input type="text" class="birth" name="birth" id="b1">년 
						<input type="text" class="birth" name="birth" id="b2">월 
						<input type="text" class="birth" name="birth" id="b3">일
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
							class="email"> @ <input type="text" name="email"
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
						<button id="btn">회원수정</button>
					</div>
				</div>
			</form>
		</div>

		<!-- <div class="top">
			<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> <span>TOP</span>
				<img class="width-10px position-relative" style="top: -1px"
				src="/f1/resources/images/common/top.png" width="15px"
				height="15px;">
			</a>
		</div> -->
	</section>
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>