<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/paper/paperList.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$("#m2").ready(function(){
		$(".m2").show("slow");
		
		$("#m1").css("color", "black");
		$("#m1").css("background-color", "white");
		$("#m1").css("font-weight", "bold");
		
		$("#m2").css("color", "white");
		$("#m2").css("background-color", "#23A41A");
		$("#m2").css("font-weight", "normal");
		
		$("#s_m5").css("color", "#23A41A");
		$("#s_m5").css("font-weight", "bold");
	});
	
	$(".btns").mouseenter(function() {
		$(this).text("");
	});
	$("#view").mouseleave(function() {
		$(this).text("보기");
	});
	$("#up").mouseleave(function() {
		$(this).text("수정");
	});
	$("#del").mouseleave(function() {
		$(this).text("삭제");
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
		<%@ include file="../member/p_meun.jsp"%>
		
		<div id="tit_border">
				<div id="tit">이력서 관리</div>
		</div>
		
		
		<article class="all_List_border">
			<div class="list_border">
				<div class="tit_border">적극적인 신입!!</div>
				<div class="date_border">2019.12.02 수정</div>
				<div class="info_border">
					<nav class="kind_border">신입</nav>
					<nav class="sal_border">회사내규에따름</nav>
					<nav class="job_border">정규직</nav>
				</div>
				<div class="btns_broder">
					<a href="./paperView"><button class="btns" id="view">보기</button></a> <a
						href="#"><button class="btns" id="up">
							<span>수정</span>
						</button></a> <a href="#"><button class="btns" id="del">삭제</button></a>
				</div>
			</div>

			<div id="plus_border">
				<a href="#"><button id="plus">새 이력서 등록</button></a>
			</div>
		</article>
		</div>
		
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>