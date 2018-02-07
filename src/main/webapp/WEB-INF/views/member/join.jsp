<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Select Page</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	}

.join_border_1 {
	width: 100%;
	height: 650px;
	background-color: lime;
	padding-top: 50px;
}

.join_border_2 {
	width: 1000px;
	height: 600px;
	background-color: yellow;
	margin: 0 auto;
}

img {
	width: 200px;
	height: 200px;
}

.p_border {
	width: 500px;
	height: 600px;
	background-color: gray;
}
.poto_b {
	width: 400px;
	height: 300px;
	background-color: fuchsia;
	margin: 0 auto;
}

</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>	

		<section class="join_border_1">
		<article class="join_border_2">
			<div class="p_border">
				<div class="poto_b">
					<img src="../resources/images/member/p_join.PNG">
				</div>
			</div>

		</article>

	</section>

	<a href="../person/personJoin">member</a>
	<a href="../company/companyJoin">company</a>
</body>
</html>