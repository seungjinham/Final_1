<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="<%=request.getContextPath()%>/resources/css/member/p_meun.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/paper/paperView.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#m2").ready(function() {
			$(".m2").show("slow");

			$("#m1").css("color", "black");
			$("#m1").css("background-color", "white");
			$("#m1").css("font-weight", "bold");

			$("#m2").css("color", "white");
			$("#m2").css("background-color", "#23A41A");
			$("#m2").css("font-weight", "normal");

			$("#s_m5").css("color", "#23A41A");
			$("#s_m5").css("font-weight", "bold");
		});

		var birth = '${member.birth}';
		var birthArr = birth.split(',');
		$(".birth").text(birthArr[0] + "." + birthArr[1] + "." + birthArr[2]);

		var phone = '${member.phone}';
		var phoneArr = phone.split(',');
		$("#phone_text").text(
				phoneArr[0] + " - " + phoneArr[1] + " - " + phoneArr[2]);

		var addr = '${member.addr}';
		var addrArr = addr.split(',');
		$("#addr_text").text(addrArr[1] + " " + addrArr[2] + " " + addrArr[3]);
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
			<%@ include file="../member/p_meun.jsp"%>

			<div id="tit_border">
				<div id="tit">이력서 보기</div>
			</div>
			<input type="hidden" name="paper_num">

			<article class="view_border">
				<div id="paper_tit_border">${view.title}</div>
				<div class="info_border">
					<nav class="name">${member.name}</nav>
					<nav class="birth"></nav>
					<div class="line"></div>
					<nav class="info_kind">
						<span class="reds">구직중</span>
					</nav>
					<nav id="email">
						<div class="img_b">
							<img
								src="<%=request.getContextPath()%>/resources/images/paper/email.png"
								class="imgs">
						</div>
						<div id="email_text" class="text_box">${member.email}</div>
					</nav>
					<nav id="phone">
						<div class="img_b">
							<img
								src="<%=request.getContextPath()%>/resources/images/paper/phone.png"
								class="imgs">
						</div>
						<div id="phone_text" class="text_box"></div>
					</nav>
					<nav id="marry">
						<div class="img_b">
							<img
								src="<%=request.getContextPath()%>/resources/images/paper/marry.png"
								class="imgs">
						</div>
						미혼
					</nav>
					<c:if test="${member.gender eq 'W'}">
						<nav id="gender">
							<div class="img_b">
								<img
									src="<%=request.getContextPath()%>/resources/images/paper/gender.png"
									class="imgs">
							</div>
							여
						</nav>
					</c:if>
					<c:if test="${member.gender eq 'M'}">
						<nav id="gender">
							<div class="img_b">
								<img
									src="<%=request.getContextPath()%>/resources/images/paper/gender.png"
									class="imgs">
							</div>
							남
						</nav>
						<nav id="army">
							<div class="img_b">
								<img
									src="<%=request.getContextPath()%>/resources/images/paper/amry.png"
									class="imgs">
							</div>
							필
						</nav>
					</c:if>
					<nav id="addr">
						<div class="img_b">
							<img
								src="<%=request.getContextPath()%>/resources/images/paper/addr.png"
								class="imgs">
						</div>
						<div id="addr_text"></div>
					</nav>
				</div>

				<div class="box_border">
					<nav id="school">학력</nav>
					<nav id="last">최종학력</nav>
					<div class="line"></div>
					<nav class="stage">
						<span class="reds">고등학교</span> ${view.s_kind}
					</nav>
					<nav class="box">
						<span class="emph">학교명</span> ${view.s_name}
					</nav>
					<nav class="box box_2">
						<span class="emph">전공 계열</span> ${view.major}
					</nav>
					<nav class="box">
						<span class="emph">재학 기간</span> ${view.entrance} ~
						${paper.graduation}
					</nav>
					<nav class="box box_2">
						<span class="emph">구분</span> ${view.s_kind} 졸업
					</nav>
				</div>

				<div class="box_border">
					<nav id="hope">희망 근무조건</nav>
					<nav id="area">근무 지역</nav>
					<div class="line"></div>
					<nav class="stage">
						<span class="reds">${view.location}</span>
					</nav>
					<nav class="box">
						<span class="emph">직종</span> ${view.h_job}
					</nav>
					<nav class="box box_2">
						<span class="emph">업종 </span> ${view.h_work}
					</nav>
					<nav class="box">
						<span class="emph">근무 형태</span> ${view.h_kind}
					</nav>
					<nav class="box box_2">
						<span class="emph">연봉 </span> ${view.salary}
					</nav>
				</div>

				<c:if test="${paper.career_kind eq '신입'}">
					<div class="box_border" id="newspace">
						<nav id="career">경력 사항</nav>
						<nav id="category">구분</nav>
						<div class="line"></div>
						<nav class="stage">
							<span class="reds">${view.career_kind}</span>
						</nav>
					</div>
				</c:if>

				<c:if test="${view.career_kind eq '경력'}">
					<div class="box_border">
						<nav id="career">경력 사항</nav>
						<nav id="category">구분</nav>
						<div class="line"></div>
						<nav class="stage">
							<span class="reds">${view.career_kind}</span>
						</nav>
						<nav class="box">
							<span class="emph">회사명 </span> ${view.company_n}
						</nav>
						<nav class="box box_2">
							<span class="emph">직책 </span> ${view.rank}
						</nav>
						<nav class="box">
							<span class="emph">직종 </span> ${view.fess}
						</nav>
						<nav class="box box_2">
							<span class="emph">연봉 </span> ${view.career_sal}
						</nav>
					</div>
				</c:if>

				<div class="box_border">
					<nav id="license">자격증</nav>
					<nav id="category">항목</nav>
					<div class="line"></div>
					<nav class="stage">
						<span class="reds">자격/면허증</span>
					</nav>
					<nav class="box">
						<span class="emph">자격/면허증</span> 1종보통 운전면허증
					</nav>
					<nav class="box box_2">
						<span class="emph">발행처 </span> 서울지방경찰법원
					</nav>
					<nav class="box">
						<span class="emph">취득일</span> 2008.03
					</nav>
					<nav class="box box_2">
						<span class="emph">합격 여부</span> 합격
					</nav>
				</div>
				
				<div class="box_border">
					<nav id="port">포트폴리오</nav>
					<nav id="category">소개</nav>
					<div class="line"></div>
					<nav class="stage">
						<span class="reds">포트폴리오다</span>
					</nav>
					<nav class="box">
						<span class="emph">파일 </span> 1종보통 운전면허증
					</nav>
					<nav class="box box_2">
						<span class="emph">작업 기간 </span> 서울지방경찰법원
					</nav>
					<nav class="box">
						<span class="emph">작업 인원 </span> 2008.03
					</nav>
					<nav class="box box_2">
						<span class="emph">작품 소개 </span> 합격
					</nav>
				</div>
			</article>
			
			<div id="btn_border">
			<div id="list_btn_border">
				<a href="./paperList"><button id="list_btn" class="btns">목록</button></a>
				</div>
				<div id="other_btn_border">
				<a href="./paperUpdate"><button class="btns" id="up_btn">수정</button></a>
				<a href="./paperDelete"><button class="btns" id="del_btn">삭제</button></a>
				</div>
			</div>

		</div>

	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>