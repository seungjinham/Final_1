<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/c_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/company/companyMyPage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Person MyPage</title>
<script type="text/javascript">
	$(function() {
		$("#m1").ready(function(){
			$(".m1").show("slow");
		});
		$("#m1").css("color", "white");
		$("#m1").css("background-color", "#23A41A");
		$("#m1").css("font-weight", "normal");
		$("#s_m1").css("color", "#23A41A");
		$("#s_m1").css("font-weight", "bold");
		
		$("#pw").blur(function() {
			var pw = $("#pw").val();
			var pw2 = '${member.pw}';
			if(pw == pw2){
				$("#ok").click(function() {
					$(this).attr("href", "./companyUpdate");
				});
			}else{
				$("#ok").click(function() {
					alert("비밀번호가 일치하지 않습니다.");
					$("#pw").val("");
				});
			};
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
		<%@ include file="../member/c_meun.jsp"%>
		
		<div id="tit_border">
			<div id="tit">기업정보</div>
		</div>
		<div id="word_border">
			<div class="word" id="word_1">회원님의 정보를 안전하게 보호하기 위해 <b>비밀번호를 다시 한번</b> 입력해 주시기 바랍니다.</div>
			<div class="word" id="word_2">※타인에게 노출되지 않도록 주의해 주세요.</div>
		</div>
			<input type="hidden" name="job" value="C">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font" id="c_id">${member.id}</td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">비밀번호</th>
						<td class="font"><input type="password" name="pw" id="pw" placeholder="비밀번호 입력"></td>
					</tr>
				</table>
			<div id="btn_border">
				<div id="btn_border_2">
					<div class="btn"><a class="btn1" id="ok">확인</a></div>
					<div class="btn"><a href="../" class="btn1">취소</a></div>
				</div>
			</div>
	</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
	

</body>
</html>