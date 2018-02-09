<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 문의</title>
<link rel="stylesheet" type="text/css" href="../resources/css/talk/talkForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
	
	<h1 id="talkH1">문의하기</h1>

	<form action="talkForm" method="post">
	<input type="hidden" name="id" >
		<div>
		<label for="id">ID </label>
		<input type="text" name="id" readonly="readonly" value="${member.id}"></div>
		
		<div>
		<label for="type">Type </label>
		<input type="checkbox" name="type"></div>
		
		<div>
		<label for="contents">Contents </label>
		<textarea name="contents"></textarea></div>
		
		<div>
		<label for="email">Email</label>
		<input type="text" name="email" placeholder="답변 받을 이메일 주소를 입력해 주세요."></div>
		
		<div>
		<label for="file">첨부파일</label>
		<input type="file" name="fname">*첨부 파일은 최대 3개까지 가능합니다.</div>
		
		<div>
		<div id="personalCheck">
		<p class="border">개인정보수집 및 이용안내</p>
		<p></p>
		<span class="border">문의에 대한 처리 및 답변을 위해 이메일, 계정정보, 전화번호(선택), 첨부사진(선택), IP주소, 브라우저 및 OS 정보</span>가 수집되며,
		수집된 정보는 <span class="border">3년간 보관</span>합니다. 이에 동의하지 않을 경우 문의/제안 등록이 불가하며, 선택항목은 입력하지 않더라도
		서비스이용에 제한을 두지 않습니다.
		</div>
		<input type="checkbox">개인정보수집 및 이용안내에 동의합니다.</div>
		
		<input type="submit" value="전송하기" >
	</form>
	
	</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>