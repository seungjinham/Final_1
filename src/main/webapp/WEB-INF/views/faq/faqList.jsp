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
		<h1 id="faqH1">FAQ</h1>
		
		
		<table class="faqTable">
			<c:forEach items="${list}" var="i" varStatus="j">
				<tr>
					<td id="title${j.index}" class="faqTitle" title="${j.index}">
					<c:catch>
					<c:forEach begin="1" end="${i.depth}">--</c:forEach>
					</c:catch>
					<div class="tableTitle">${i.title}</div>
					<div id="contents_view${j.index}" class="div_view">
								<div class="toggle_contents">${i.contents}
								<div class="div_deletebutton">
								<c:if test="${member.id eq 'admin'}">
									<a class="toggleBtn" href="faqDelete?num=${i.num}">DELETE</a>
									<a class="toggleBtn" href="faqUpdate?num=${i.num}">UPDATE</a>
								</c:if>
								</div>
								</div>
							</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test="${member.id eq 'admin'}">
		<a href="./faqWrite" id="btnWrite">WRITE</a>
		</c:if>
		
		</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>

</body>
</html>