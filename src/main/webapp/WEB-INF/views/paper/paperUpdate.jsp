<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Paper Update</title>
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
		
		$("#s_m4").css("color", "#23A41A");
		$("#s_m4").css("font-weight", "bold");
	});
});
</script>
<style type="text/css">
#main2 {
	width: 1080px;
	height: 550px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
		<%@ include file="../member/p_meun.jsp"%>
		</div>
		
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>