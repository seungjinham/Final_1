<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/resources/css/common/header.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/common.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/footer.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/member/p_meun.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/paper/paperList.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#m2").ready(function() {
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
		$(".view").mouseleave(function() {
			$(this).text("보기");
		});
		$(".up").mouseleave(function() {
			$(this).text("수정");
		});
		$(".del").mouseleave(function() {
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
				<div id="tit">나의 이력서 관리</div>
			</div>

			<article class="all_List_border">
				<c:forEach items="${list}" var="list">
					<div class="list_border">
						<div class="tit_border">${list.title}</div>
						<div class="date_border">${list.paper_date}수정</div>
						<div class="info_border">
							<nav class="kind_border">${list.career_kind}</nav>
							<nav class="sal_border">${list.salary}</nav>
							<nav class="job_border">${list.h_kind}</nav>
						</div>
						<div class="btns_broder">
							<a href="./paperView?paper_num=${list.paper_num}"><button class="btns view" id="view">보기</button></a>
							<a href="./paperUpdate?paper_num=${list.paper_num}"><button class="btns up" id="up">수정</button></a> 
							<a href="./paperDelete?paper_num=${list.paper_num}"><button class="btns del" id="del">삭제</button></a>
						</div>
					</div>
				</c:forEach>
				<c:if test="${p_count < 3}">
				<div id="plus_border">
					<a href="./paperInsert"><button id="plus">새 이력서 등록</button></a>
				</div>
				</c:if>
			</article>
			
		</div>

	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>