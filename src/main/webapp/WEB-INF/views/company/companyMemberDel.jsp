<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/c_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/company/companyMyPage.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/company/companyMemberDel.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#m1").ready(function() {
			$(".m1").show("slow");
		});
		$("#m1").css("color", "white");
		$("#m1").css("background-color", "#23A41A");
		$("#m1").css("font-weight", "normal");
		$("#s_m2").css("color", "#23A41A");
		$("#s_m2").css("font-weight", "bold");

		$("#s_m1").mouseenter(function() {
			$("#s_m1").css("font-weight", "bold");
		});
		$("#s_m1").mouseleave(function() {
			$("#s_m1").css("font-weight", "normal");
		});

		$("#pw").blur(function() {
			var pw = $("#pw").val();
			var pw2 = '${member.pw}';
			if (pw == pw2) {
				$("#ok").click(function() {
					$("#login_border").css("display", "none");
					$("#tit").text("회원탈퇴");
					$("#del_border").show();
				});
			} else {
				$("#ok").click(function() {
					alert("비밀번호가 일치하지 않습니다.");
					$("#pw").val("");
				});
			}
			;
		});
		
		
		$(".c").click(function() {
			var id = $(this).attr('id');
			if(id == 'other'){
				$("#other_text").attr("readonly", false);
			}else{
				$("#other_text").attr("readonly", true);
			}
		});
		
		$("#d_btn").click(function(){
			var text = $("#other_text").val();
			if($("#spill").prop("checked") || 
					$("#o_use").prop("checked") || 
					$("#Unusualness").prop("checked") || 
					$("#Insecurity").prop("checked") || 
					$("#no_find").prop("checked") ||
					$("#other").prop("checked")){
				frm.submit();
			}else{
				alert("탈퇴 사유를 선택 해주세요.");
			}
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

			<article id="tit_border">
				<div id="tit">회원정보</div>
			</article>
			<article id="login_border">
				<div id="word_border">
					<div class="word" id="word_1">
						회원님의 정보를 안전하게 보호하기 위해 <b>비밀번호를 다시 한번</b> 입력해 주시기 바랍니다.
					</div>
					<div class="word" id="word_2">※타인에게 노출되지 않도록 주의해 주세요.</div>
				</div>
				<input type="hidden" name="job" value="P">
				<table>
					<tr>
						<th class="font">아이디</th>
						<td class="font" id="p_id">${member.id}</td>
					</tr>
					<tr>
						<td colspan="2" class="tline"><div></div></td>
					</tr>
					<tr>
						<th class="font">비밀번호</th>
						<td class="font"><input type="password" name="pw" id="pw"
							placeholder="비밀번호 입력"></td>
					</tr>
				</table>
				<div id="btn_border">
					<div id="btn_border_2">
						<div class="btn">
							<a class="btn1" id="ok">확인</a>
						</div>
						<div class="btn">
							<a href="../" class="btn1">취소</a>
						</div>
					</div>
				</div>
			</article>
			
			<!-- 탈퇴 하는 곳 -->
			<article id="del_border" style="display: none;">
				<form action="./personDelete" method="post" id="frm">
				<div id="del_border_2">
					<div id="guide_border">
						<div id="guide">탈퇴 안내및 유의사항</div>
					</div>
					<ul>
						<li>1. 탈퇴 후 삭제된 회원의 데이터는 <span class="red">복구가 불가능</span> 합니다.</li>
						<li>2. 회원의 경우 이력서 정보, 구직 활동내역, 재능 마켓 <span class="red">데이터가 모두 삭제</span> 됩니다.</li>
						<li>3. 기업의 경우 기업 정보, 파워 링크, 재능 마켓 <span class="red">데이터가 모두 삭제</span> 됩니다.</li>
					</ul>
					<div id="guide_border">
						<div id="guide">탈퇴 사유</div>
					</div>
					<div id="choice">
						<p><input type="radio" name="del" class="c" id="spill"> 개인정보 유출 우려</p>
						<p><input type="radio" name="del" class="c" id="o_use"> 타 사이트 이용</p>
						<p><input type="radio" name="del" class="c" id="Unusualness"> 자주 이용하지 않음</p>
						<p><input type="radio" name="del" class="c" id="Insecurity"> 사이트의 불안정</p>
						<p><input type="radio" name="del" class="c" id="no_find"> 찾고자 하는 정보가 없음</p>
						<p><input type="radio" name="del" class="c" id="other"> 기타 사항</p> 
						<p><input type="text" placeholder="50자 이내" readonly="readonly" id="other_text"></p>
					</div>
				</div>
				<div id="d_btn_border">
					<div id="d_btn_border_2">
						<input type="button" value="회원탈퇴" id="d_btn">
					</div>
				</div>
				</form>
			</article>
			
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>