<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/scrap/scrapList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#m4").ready(function(){
			
			$("#m1").css("color", "black");
			$("#m1").css("background-color", "white");
			$("#m1").css("font-weight", "bold");
			
			$("#m4").css("color", "white");
			$("#m4").css("background-color", "#23A41A");
			$("#m4").css("font-weight", "normal");
			$("#m_m4").css("color", "white");
		});
		
		var list = new Array();
		
		function total(list){
			var truecount=0;
			var falsecount=0;
			 for(var i=0; i<list.length; i++) {
				 if(list[i].checked) {
					 list[i].checked=false;
					 falsecount++;
				 } else {
					 list[i].checked=true;
					 truecount++;
				 }
			 }
			 if(truecount == list.length) {
				 $("#total_btn").attr("value", "전체해제");
			 } else if(falsecount == list.length) {
				 $("#total_btn").attr("value", "전체선택");
			 } else {
				 
			 }
		};
		
		$("#total_btn").click(function(){
			total(document.frm.sel_ch);
		});
		
		$("#scrap_del").click(function(){
			location.href="../scrap/scrapDelete";
		});
		
	});
	
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
		<%@ include file="../member/p_meun.jsp"%>

<form id="form" name="frm">
			<a href="../scrap/scrapDelete">ScrapDelete</a>
			<input type="button" value="스크랩 삭제" id="scrap_del">
			<input type="button" value="전체선택" id="total_btn">
			<table id="scrap_table">
				<tr id="firstrow">
					<th>선택</th>
					<th>지역</th>
					<th>채용공고</th>
					<th>급여</th>
					<th>마감기한</th>
				</tr>
				<c:forEach var="result" items="${scrap_result}" begin="0" step="1">
					<tr id="extrarow">
						<td><input type="checkbox" value="${result.num}" name="sel_ch"></td>
						<td>${result.addr}</td>
						<td>${result.c_name}&nbsp;/&nbsp;${result.title}</td>
						<td>${result.salary}</td>
						<td>${result.deadline}</td>
					</tr>
				</c:forEach>
			</table>
			
				<div id="page">
					<c:if test="${pagelist.curBlock>1}">
						<span><input type="button" value="이전"></span>
					</c:if>
					<c:forEach begin="${pagelist.startNum}" end="${pagelist.lastNum}"
						var="i">
						<span><input type="button" value="${i}"></span>
					</c:forEach>
					<c:if test="${pagelist.curBlock<pagelist.totalBlock}">
						<span><input type="button" value="다음"></span>
					</c:if>
				</div>
			
</form>

		</div>
		<div class="top">
				<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> <span>TOP</span>
					<img class="width-10px position-relative" style="top: -1px"
					src="/f1/resources/images/common/top.png" width="15px"
					height="15px;">
				</a>
			</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
	
</body>
</html>