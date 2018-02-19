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
<link href="<%=request.getContextPath()%>/resources/css/member/meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//================== 파일 삭제 ==================
		//위임이 필요하기때문에 on을 사용하여 위임해줌
		$("#result").on("click", ".remove", function() {
			$(this).prev().remove();
			$(this).remove();
		});
		/* 	$("#remove").click(function() {
				$(this).remove();
				$("#result").append('<p><input type="file" name="file"></p>');
			});		 */

		$("#out").click(function() {
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
		});
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
			<%@ include file="../member/meun.jsp"%>
			<h1 class="h1">판매자 등록</h1>
			<form id="frm" name="frm" action="sellerWrite" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">
				
				<div class="title">프로필 사진</div>
				<div id="photo"></div>
				<button id="in" type="button" class="btn btn-default">등록</button>
				<button id="out" type="button" class="btn btn-default">삭제</button>
				
				<div class="title">
					<span>이   름</span> 
					<input class="seller" type="text" name="name" value="${member.name}">
				</div>
				
				<div class="title">이메일
				<input class="seller" type="email" name="email" value="${member.email}">
				</div>
				
				<div class="title">전화번호
				<input class="seller" type="text" name="phone" value="${member.phone}">
				</div>
				
				<hr>
				
				<div class="title">카테고리</div>
				<select class="seller">
					<option class="category" value="design">디자인</option>
					<option class="category" value="it">IT & 프로그래밍</option>
					<option class="category" value="translate">번역 & 통역</option>
				</select>
				
				<div class="title">제목 </div>
				<input class="seller_input" type="text" name="title">
				
				<div class="title"> 서비스 설명 </div>
				<textarea name="contents" id="contents"></textarea>
				
				<div class="title"> A/S 및 환불 </div>
				<textarea name="refund" id="refund" cols="95" rows="20" ></textarea>
				
				<div><button id="save">등록하기</button></div>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>