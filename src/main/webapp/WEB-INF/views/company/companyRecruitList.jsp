<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/c_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//메뉴 설정
	$("#m2").ready(function(){
		$(".m2").show("slow");
	});
	$("#m2").css("color", "white");
	$("#m2").css("background-color", "#23A41A");
	$("#m2").css("font-weight", "normal");
	$("#s_m5").css("color", "#23A41A");
	$("#s_m5").css("font-weight", "bold");
});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
		<%@ include file="../member/c_meun.jsp"%>
		<h1 class="h1">게재중인 공고</h1>
			<table>
				<c:forEach items="${list}" var="r">
					<tr>
						<td><a href="companyRecruitView?num=${r.num}">${r.title}</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					현재 게재중인 공고가 없습니다
				</c:if>
			</table>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
	
</body>
</html>