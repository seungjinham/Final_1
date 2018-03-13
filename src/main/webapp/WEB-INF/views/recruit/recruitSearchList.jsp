<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitSearchList.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#dcbtn").click(function(){
		location.href = "../recruit/recruitSearch"
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	
	<section id="main">
		<div class="container">
			
			<div id="btnwrap">
			<input type="button" value="다른 조건으로 검색하기" id="dcbtn">
			</div>

<!-- 			<div id="powerlink">
				<h2>파워링크</h2>
			</div> -->

			<%-- <div id="powerlinklist">
				<table id="powerlink_table" class="table">
					<tr id="firstrow">
						<th class="f_th">지역</th>
						<th class="f_th">모집제목</th>
						<th class="f_th">급여</th>
						<th class="f_th">근무시간</th>
						<th class="f_th">마감기한</th>
					</tr>
					<c:forEach var="item" items="${totallist}" end="4">
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

			</div> --%>

			<div id="list_area">
				<div>
					<h2>채용공고리스트</h2>
				</div>
				<table id="list_table" class="table">
					<tr id="firstrow">
						<th class="f_th">지역</th>
						<th class="f_th">모집제목</th>
						<th class="f_th">급여</th>
						<th class="f_th">근무시간</th>
						<th class="f_th">마감기한</th>
					</tr>
					<c:forEach var="item" items="${totallist}">
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
			</div>


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