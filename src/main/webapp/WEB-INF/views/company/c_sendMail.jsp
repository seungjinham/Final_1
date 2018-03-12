<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/css/company/c_sendMail.css"
	rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
   $("#ok_btn").click(function(){
      if(${number}==$("#code").val()){
         alert("인증이 완료 되었습니다.");
         frm.submit();
         window.opener.document.frm.email.value = "${email}";
         window.opener.document.frm.check.value = "t";
         window.self.close();
                  
      }else{
         $("#problem").slideDown();
      }
   });
});
</script>
<style type="text/css">
</style>
</head>
<body>
	<section id="main_border">
		<article id="tit_border">
			<div id="logo"></div>
			<div id="tit">P!CK ME</div>
			<div id="logo"></div>
		</article>

		<c:if test="${result eq 'ok'}">
			<article class="word_border">
				<div class="word">
					1. ${checkmsg} 으로 <span class="red">인증번호</span> 전송.
				</div>
				<div class="word">
					2. 전송된 메일에서<span class="red">인증번호</span>를 확인해주세요.
				</div>
				<div class="word">
					3. <span class="red">인증번호</span> 입력 후 확인 버튼을 눌러주세요.
				</div>
			</article>
		</c:if>

		<c:if test="${result eq 'no'}">
			<article class="word_border">
				<div class="word">
					1. ${checkmsg} 전송에 <span class="red">실패</span> 하였습니다.
				</div>
				<div class="word">
					2. <span class="red">회원가입 화면</span>으로 돌아가주세요.
				</div>
				<div class="word">
					3. 인증 <span class="red">메일을 다시 확인</span> 해주세요.
				</div>
			</article>
		</c:if>

		<form action="./companyJoin" id="frm">
			<article id="code_border">
				<input type="text" placeholder="인증번호 입력" id="code">
			</article>


			<div id="problem" style="display: none;">
				인증번호가 <span class="red">일치하지 않습니다.</span>
			</div>

			<input type="hidden" value="${email}" name="email"> <input
				type="hidden" value="t" name="check">

			<article id="btn_border">
				<input type="button" value="확인" id="ok_btn">
				<h5>${number}</h5>
			</article>
		</form>
	</section>
</body>
</html>