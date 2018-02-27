<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerWrite.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//메뉴설정
		$("#m5").ready(function(){
			$(".m5").show("slow");
		});
		$("#m1").css("color", "black");
		$("#m1").css("background-color", "white");
		$("#m1").css("font-weight", "bold");
		
		$("#m5").css("color", "white");
		$("#m5").css("background-color", "#23A41A");
		$("#m5").css("font-weight", "normal");
		
		$("#s_m8").css("color", "#23A41A");
		$("#s_m8").css("font-weight", "bold");
		
		//================== 프로필 사진 등록/삭제 ==================
		$("#in").click(function() {
			$("#profile").append('<input type="file" name="profile">');
		});	
		$("#out").click(function() {
			$("#profile").remove();
		});

		/* $("#out").click(function() {
			var id = $(this).attr("title");
			$("#" + id).html('Photo : <input type="file" name="file" id="f">');
		});

		$("#btn").click(function() {
			var f = $("#f").val();
			if (f != '') {
				alert("ok");
				$("#frm").submit();
			}
			;
		}); */
	
	});

	//================== smart_editor ==================
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#save").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#frm").submit();
		});
	});
	
	
	
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>
	<section id="main">
		<div class="seller_menu">
			<%@ include file="../member/p_meun.jsp"%>
			<div id="tit_border">
				<div id="tit">판매자 등록</div>
			</div>
			<form id="frm" name="frm" action="sellerWrite" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">				
				<table class="seller_table">
					<tr>
						<th class="font">프로필</th>
						<td>
							<div id="photo">
								<div id="profile"></div>
							</div>
							<button id="in" type="button" class="btn btn-default">등록</button>
							<button id="out" type="button" class="btn btn-default">삭제</button>
						</td>
					</tr>
					<tr><td colspan="2" class="tline"><div></div></td></tr>
					
					<tr>
						<th class="font">이름</th>
						<td class="font">
							<input type="text" class="info" name="name" id="name" value="${member.name}">
						</td>
					</tr>
					<tr>
						<th class="font">전화번호</th>
						<td class="font"><input class="info" type="text" name="phone" value="${member.phone}"></td>
					</tr>
					<tr>
						<th class="font">이메일</th>
						<td class="font"><input class="info" type="email" name="email" value="${member.email}"></td>
					</tr>
					<tr><td colspan="2" class="tline"><div></div></td></tr>
					
					<tr>
						<th class="font">카테고리</th>
						<td class="font">
							<select class="info">
								<option class="info" value="design">디자인</option>
								<option class="info" value="it">IT & 프로그래밍</option>
								<option class="info" value="translate">번역 & 통역</option>
							</select>
						</td>
					</tr>
					<tr><td colspan="2" class="tline"><div></div></td></tr>
					<tr>
						<th class="font">제목</th>
						<td class="font"><input class="title" type="text" name="title"></td>
					</tr>
					<tr>
						<th class="font">서비스 설명</th>
						<td class="font"><textarea name="contents" id="contents"></textarea></td>
					</tr>
					<tr>
						<th class="font">가격정보</th>
						<td class="font"><textarea name="contents" id="contents"></textarea></td>
					</tr>
					
					<tr>
						<th class="font">A/S 및 환불</th>
						<td class="font"><textarea name="refund" id="refund" cols="95" rows="20" ></textarea></td>
					</tr>				
				</table>
				<div><button id="save" type="button" class="btn btn-default">등록하기</button></div>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>