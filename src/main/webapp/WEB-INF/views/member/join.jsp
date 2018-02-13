<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Select Page</title>
<link href="<%=request.getContextPath()%>/resources/css/member/join.css" rel="stylesheet">

</head>
<body>
	<!-- Header 시작 -->
	<%@ include file="../temp/header1.jsp"%>
	<!-- Header 끝 -->

	<!-- main 시작 -->
	<section id="main">
		<article class="title_border">
			<div class="title_border2">
				<img src="../resources/images/common/footer_logo.png" width="55px" height="50px"> <b>회원가입</b>
			</div>
		</article>

		<article class="join_border">

			<div class="p_border" id="p_border2">
				<div class="poto_b">
					<img src="../resources/images/member/person.PNG" class="photo">
					<div class="j_write">
						<b>구직활동 & 재능 판매/구매</b>
					</div>
					<div class="j_write2">이력서 등록 / 재능 판매+구매 하시는 분</div>
				</div>
				<a href="../person/personJoin" class="btn" id="p_btn">개인 회원가입</a>
				<div class="j_write3">SNS계정으로 쉽고 빠르게 회원가입</div>
				<div class="kakao">
					<button>
						<img src="../resources/images/member/kaka.PNG" id="kakao_p">
					</button>
				</div>
			</div>

			<div class="line"></div>

			<div class="p_border">
				<div class="poto_b">
					<img src="../resources/images/member/company.PNG" class="photo">
					<div class="j_write">
						<b>인재 찾기 & 재능 구매</b>
					</div>
					<div class="j_write2">공고 등록 / 인재 찾기 하시는 분</div>
				</div>
				<a href="../company/companyJoin" class="btn" id="c_btn">기업 회원가입</a>
				<div class="j_write3">※ 법인 및 개인사업자는 기업회원으로 가입해주세요.</div>
			</div>

		</article>


	</section>
	<!-- main 끝 -->

	<!-- footer-->
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>