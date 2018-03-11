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
<link href="<%=request.getContextPath()%>/resources/css/sell/favorList.css" rel="stylesheet">
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
					<h1 class="h1">판매자 즐겨찾기</h1>
					<c:if test="${not empty list}">
						<table class="table">
							<colgroup>
								<col width="45%">
								<col width="45%">
							</colgroup>
							<tr>
								<td class="h3">번호</td>
								<td class="h3">판매자 아이디</td>
							</tr>
							<c:forEach items="${list}" var="l">
								<tr>
									<td class="h3">${l.num}</td>
									<td class="h3"><a href="./sellerView?id=${l.seller}">${l.seller}</a><td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${empty list}">
						<div class="not">
							<img id="not-img" src="../resources/upload/not.png" width="100px" height="100px"><br>
							<span id="not-str">즐겨찾기한 판매자가 없습니다</span>
						</div>
					</c:if>					
				</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>