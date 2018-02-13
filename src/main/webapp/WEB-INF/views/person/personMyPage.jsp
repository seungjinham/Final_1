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
<link href="<%=request.getContextPath()%>/resources/css/member/meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/person/personMyPage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Person MyPage</title>
<style type="text/css">
#btn_border{
	width: 500px;
	height: 80px;
	float:left;
	padding-top: 20px;
}
#btn_border_2{
	width: 260px;
	height: 50px;
	margin: 0 auto;
}
.btn {
	width: 100px;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #23A41A;
	float: left;
	margin-left: 20px;
	padding-top: 10px;
	text-align: center;
}
.btn a{
	color: white;
	font-size: 15px;
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic', sans-serif, "돋움", Dotum, "굴림", Gulim;
}
.btn a:hover{
	font-weight: bold;
	font-size: 17px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
		<%@ include file="../member/meun.jsp"%>
		
		<div id="tit_border">
			<div id="tit">회원정보</div>
		</div>
			<input type="hidden" name="job" value="P">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font">${member.id}</td>
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
					<div class="btn"><a href="./personUpdate" class="btn1">확인</a></div>
					<div class="btn"><a href="../" class="btn1">취소</a></div>
				</div>
			</div>
	</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
	

</body>
</html>