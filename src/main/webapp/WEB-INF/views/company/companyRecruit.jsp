<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/resources/css/common/header.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/common.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/footer.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/member/c_meun.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/company/companyRecruit.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<div id="main_2">
			<%@ include file="../member/c_meun.jsp"%>

			<!-- 여기서부터 복사 -->
			<article id="tit_border">
				<div id="tit">공고 등록</div>
			</article>

			<article id="all_border">
				<form action="companyRecruit" method="post"
					enctype="multipart/form-data">
					<div id="insert_border">

						<nav id="re_tit_border">
							<nav class="sub_tit">공고제목</nav>
							<input type="text" name="title" id="re_title"
								placeholder="20자 이내 입력">
						</nav>

						<div id="adver_border">
							<nav class="sub_tit">모집조건</nav>
							<nav class="in_border1">
								<label for="re_deadline" class="subject">마감일</label> <input
									type="date" name="deadline" id="re_deadline">
							</nav>
							<nav class="in_border1">
								<label for="re_people" class="subject">채용 인원</label> <input
									type="text" name="people" id="re_people">
							</nav>
							<nav class="in_border2" id="re_gender_b">
								<label for="re_gender" class="subject">성별</label> <input
									type="text" name="gender" id="re_gender">
							</nav>
							<nav class="in_border2">
								<label for="re_age" class="subject">연령</label> <input
									type="text" name="age" id="re_age">
							</nav>
							<nav class="in_border1">
								<label for="re_school" class="subject">학력</label> <input
									type="text" name="school" id="re_school">
							</nav>
							<nav class="in_border3">
								<label for="re_special" class="subject">우대사항</label> <input
									type="text" name="special" id="re_special"
									placeholder="ex) 유사 업무 경험자, 업무에 적합한 자격증 소유, 군필자 등 ">
							</nav>
						</div>

						<div id="working_border">
							<nav class="sub_tit">근무조건</nav>
							<nav class="in_border1">
								<label for="re_salary" class="subject">급여</label> <input
									type="text" name="salary" id="re_salary">
							</nav>
							<nav class="in_border1">
								<label for="re_w_date" class="subject">근무 기간</label> <input
									type="text" name="w_date" id="re_w_date">
							</nav>
							<nav class="in_border1">
								<label for="re_w_day" class="subject">근무 요일</label> <input
									type="text" name="w_day" id="re_w_day">
							</nav>
							<nav class="in_border1">
								<label for="re_w_time" class="subject">근무 시간</label> <input
									type="text" name="w_time" id="re_w_time">
							</nav>
							<nav class="in_border1">
								<label for="re_job" class="subject">업직종</label> <input
									type="text" name="job" id="re_job"
									placeholder="ex) 레스토랑, 테마파크 등">
							</nav>
							<nav class="in_border1">
								<label for="re_work" class="subject">고용형태</label> <input
									type="text" name="work" id="re_work" placeholder="ex) 정규직, 계약직">
							</nav>
							<nav class="in_border3">
								<label for="re_benefit" class="subject">복리후생</label> <input
									type="text" name="benefit" id="re_benefit"
									placeholder="ex) 국민연금, 고용보험, 산재보험, 주휴수당 등">
							</nav>
						</div>

						<div id="info_border">
							<nav class="sub_tit">회사정보</nav>
							<nav class="in_border1">
								<label for="re_id" class="subject">아이디</label> <input
									type="text" name="id" id="re_id">
							</nav>
							<nav class="in_border1">
								<label for="re_file" class="subject">회사 로고</label> <input
									type="file" name="file" id="re_file">
							</nav>
							<nav class="in_border4">
								<label for="re_contents" class="subject">회사 소개</label>
								<textarea rows="" cols="" name="contents" id="re_contents"
									placeholder="회사를 소개 해주세요."></textarea>
							</nav>
						</div>

					</div>

					<div id="btn_border">
						<button id="insert_btn">등록</button>
					</div>
				</form>
			</article>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>



</body>
</html>