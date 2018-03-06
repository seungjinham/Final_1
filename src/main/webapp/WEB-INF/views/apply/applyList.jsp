<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/apply/applyList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var message = '${applyDelete}';
	if(message!="") {
		alert(message);
	}
	
	function select_All(obj, val) {
		if(obj!=undefined) {
			var count = obj.length;
			if(obj.length>0) {
				for(i=0; i<=obj.length-1; i++) {
					obj[i].checked=val;
				}
			}else {
				obj.checked=val;
			}
		}
		return true;
	}
	
	$("#select_all").on("click", function(){
		var obj = $("input:checkbox[name='select_ch']");
		var val = $("#select_all").prop("checked");
		select_All(obj, val);
	});
	
	$("#apply_del").click(function(){
		alert("선택한 공고를 지원 취소하시겠습니까?");
		//location.href="../scrap/scrapDelete";
	});

});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
		<%@ include file="../member/p_meun.jsp"%>
		<form id="form" name="frm" action="../apply/applyDelete">
		<input type="submit" value="지원취소" id="apply_del">
		<input type="hidden" name="page">
		<input type="hidden" name="id" value="${member.id}">
			<table id="apply_table">
				<tr id="firstrow">
					<th><input type="checkbox" id="select_all"></th>
					<th>지역</th>
					<th>채용공고</th>
					<th>급여</th>
					<th>마감기한</th>
				</tr>
				<c:forEach var="result" items="${applylist}" begin="0" step="1">
					<tr id="extrarow">
						<td><input type="checkbox" value="${result.num}" name="select_ch" class="sel"></td>
						<td>${result.addr}</td>
						<td><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${result.num}&id=<%=request.getSession().getId()%>">${result.c_name}</a><br><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${result.num}&id=<%=request.getSession().getId()%>">${result.title}</a></td>
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
				<a href="javascript:void(0);" data-name="퀵 메뉴 - TOP"> 
					<span>TOP</span>
					<img class="width-10px position-relative" style="top: -1px" src="/f1/resources/images/common/top.png" width="15px" height="15px;">
				</a>
			</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>	
</body>
</html>