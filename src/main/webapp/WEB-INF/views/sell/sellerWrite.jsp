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
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerWirte.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//================== 파일 삭제 ==================
		//위임이 필요하기때문에 on을 사용하여 위임해줌
		$("#result").on("click",".remove",function() {
			$(this).prev().remove();
			$(this).remove();
		});			
	});
	
	
	//================== smart_editor ==================
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "contents",
	        sSkinURI: "../resources/SE2/SmartEditor2Skin.html",
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
	    $("#save").click(function(){
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
		<div class="container">
			<h1 class="h1">판매자 등록</h1>
			<form id="frm" name="frm" action="sellerWrite" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">
				<p class="menu">프로필 사진</p>
				<span id="del" title="photo">삭제</span>
				<p class="menu">이름 </p>
				<input type="text" name="name" value="${member.name}">
				<p class="menu">이메일</p>
				<input type="email" name="email" value="${member.email}">
				<p class="menu">전화번호</p>
				<input type="text" name="phone" value="${member.phone}">
				<p class="menu">카테고리</p>
				<select>
					<option class="category">디자인</option>
					<option class="category">IT & 프로그래밍</option>
					<option class="category">번역 & 통역</option>
				</select>
				<p class="menu">제목 <p>
				<input type="text" name="title">
				<p class="menu"> 서비스 설명 <p>
				<textarea rows="50px" cols="100%" name="contents" id="contents"></textarea>
				<p class="menu"> A/S 및 환불 <p>
				<textarea name="refund"></textarea>
				<p><button id="save">등록하기</button></p>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>