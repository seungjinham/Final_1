<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerView.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		
	$("#s_m9").css("color", "#23A41A");
	$("#s_m9").css("font-weight", "bold");
});
</script>
<body>	
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<%@ include file="../member/p_meun.jsp"%>
		<div class="container">
				<div>
					<h1 class="menu_h1">판매자 정보</h1>
					<h3>이름 : ${seller.id}</h3>
					<h3>카테고리 : ${seller.category}</h3>

					<a href="./sellerUpdate">수정하기</a>
					<a href="./sellerDelete">삭제하기</a>
				</div>
		</div>
		<div class="top">
			<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> <span>TOP</span>
				<img class="width-10px position-relative" style="top: -1px" src="/f1/resources/images/common/top.png" width="15px" height="15px;">
			</a>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>