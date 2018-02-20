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
<title>Paper Write</title>
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
		
		$("#s_m3").css("color", "#23A41A");
		$("#s_m3").css("font-weight", "bold");
	});
});
</script>
<style type="text/css">
#main2 {
	width: 1080px;
	height: 1000px;
	background-color: aqua;
}

#tit_border {
	width: 700px;
	height: 80px;
	float: left;
}

#tit {
	width: 600px;
	height: 80px;
	color: #23A41A;
	font-size: 37px;
	font-weight: bolder;
	letter-spacing: -1px;
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
	margin-left: 5px;
}

table {
	width: 650px;
	height: 600px;
	border-top: 2px solid #23A41A;
	border-bottom: 2px solid #23A41A;
}

th {
	width: 70px;
	text-align: left;
	border: 1px solid red;
}

td {
	width: 280px;
	border: 1px dotted yellow;
}

</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
		<%@ include file="../member/p_meun.jsp"%>
		
			<div id="tit_border">
				<div id="tit">이력서 등록</div>
			</div>
			
			<form action="./paperInsert" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>zz</th>
						<td>111</td>
					</tr>
					<tr>
						<th>dd</th>
						<td>222</td>
					</tr>
					<tr>
						<th>ff</th>
						<td>333</td>
					</tr>
					<tr>
						<th>gg</th>
						<td>444</td>
					</tr>
					<tr>
						<th>ee</th>
						<td>555</td>
					</tr>
				</table>
			</form>
			
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>