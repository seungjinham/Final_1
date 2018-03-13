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
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitSearchList.css" rel="stylesheet" type="text/css">
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
<style type="text/css">
#list_area{
	width: 740px;
	float: left;
}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
		<%@ include file="../member/c_meun.jsp"%>
		<h1 class="h1">게재중인 공고</h1>
		
		<div id="list_area">
			<c:if test="${not empty list}">
				<table id="list_table" class="table">
					<tr id="firstrow">
						<th class="f_th">지역</th>
						<th class="f_th">모집제목</th>
						<th class="f_th">급여</th>
						<th class="f_th">근무시간</th>
						<th class="f_th">마감기한</th>
					</tr>
					<c:forEach var="item" items="${list}">
						<tr id="extrarow">
							<td class="e_td">${item.addr}</td>
							<td class="e_td e_td2">
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.c_name}</a></p>
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.title}</a></p>
							</td>
							<td class="e_td e_td2">${item.salary}</td>
							<td class="e_td">${item.w_time}</td>
							<td class="e_td">${item.deadline}</td>
						</tr>
					</c:forEach>
				</table>
				
				<div id="page">
					<c:if test="${pagelist.curBlock>=1}">
						<span><input type="button" value="이전" class="btnshape prebtn prenext"></span>
					</c:if>
					<c:forEach begin="${pagelist.startNum}" end="${pagelist.lastNum}"
						var="i">
						<span><input type="button" value="${i}" class="pageclick btnshape"></span>
					</c:forEach>
					<c:if test="${pagelist.curBlock<=pagelist.totalBlock}">
						<span><input type="button" value="다음" class="btnshape prenext"></span>
					</c:if>
				</div>
			</c:if>
			<c:if test="${empty list}">
					현재 게재중인 공고가 없습니다
			</c:if>
			</div>
			
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
	
</body>
</html>