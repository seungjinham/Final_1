<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/faq/faq.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(".faqTitle").each(function(){
			var num=$(this).attr("title");
			$("#title"+num).click(function(){
				$("#contents_view"+num).slideToggle("slow");
			});
		});
		
	});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="container">
		<h1>FAQ</h1>
		<table>
			<tr>
				<th>NUM</th>
				<th>TITLE</th>
				<th>CONTENTS</th>
			</tr>
			<c:forEach items="${list}" var="i" varStatus="j">
				<tr>
					<td>${i.num}</td>
					<td id="title${j.index}" class="faqTitle" title="${j.index}">
					<c:catch>
					<c:forEach begin="1" end="${i.depth}">--</c:forEach>
					</c:catch>
					<a href="faqView?num=${i.num}">${i.title}</a>
					<div id="contents_view${j.index}" class="div_view">
								<p class="toggle_contents">${i.contents}
								<div class="div_deletebutton">
								<c:if test="${member.id eq 'admin'}">
									<a href="faqDelete?num=${i.num}">DELETE</a>
									<a href="faqUpdate?num=${i.num}">UPDATE</a>
								</c:if>
								</div>
								</p>
							</div>
					</td>

					<td>${i.contents}</td>
				</tr>
			</c:forEach>
		</table>

		<a href="./faqWrite">WRITE</a>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>