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
	href="<%=request.getContextPath()%>/resources/css/paper/paperWrite.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Paper Write</title>
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

			$("#s_m4").css("color", "#23A41A");
			$("#s_m4").css("font-weight", "bold");
		});

		var birth = '${member.birth}';
		var birthArr = birth.split(',');
		$("#p_birth").attr("value",
				birthArr[0] + " / " + birthArr[1] + " / " + birthArr[2]);

		var phone = '${member.phone}';
		var phoneArr = phone.split(',');
		$("#p_phone").attr("value", phoneArr[0] + " - " + phoneArr[1] + " - " + phoneArr[2]);

		var email = '${member.email}';
		var emailArr = email.split(',');
		$("#p_email").attr("value", emailArr[0] + " @ " + emailArr[1]);

		var addr = '${member.addr}';
		var addrArr = addr.split(',');
		$("#p_addr").attr("value", addrArr[1]+addrArr[2]);
		$("#p_addr_2").attr("value", addrArr[3]);

		//경력사항
		$("#careers").click(function() {
			$("#carrer_border").slideDown("slow");
		});
		$("#newcomer").click(function() {
			$("#carrer_border").slideUp("slow");
		});

		var i = 0;
		$("#add_box").click(function() {
			if (i < 5) {
				var ex = $("#licences_boxs").html();
				$("#licences_boxs").append(ex);
				i++;
			} else {
				alert("그만해! 5개까지야")
			}
		});

		$("#x_box").click(function() {
			$("#licences_boxs").remove();
			i--;
		});
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
				<div id="tit">이력서 등록</div>
			</div>

			<form action="./paperInsert" method="post"
				enctype="multipart/form-data">
				<section id="paper_border">

					<!-- 제목 -->
					<div id="p_tit_border">
						<div id="p_tit_border_2">이력서 제목</div>
						<div id="p_tit_border_3">
							<input type="text" name="title" id="p_tit"
								placeholder="이력서 제목을 입력하세요. (50자 이내)">
						</div>
					</div>

					<!-- 기본정보 -->
					<div class="p_meun_border">
						<div class="p_meun_border_2">기본 정보</div>
					</div>

					<article id="info_borders">
						<div id="border_1">
							<div id="p_photo">
								<button>file</button>
							</div>
							<div class="name">
								<label for="p_name" class="p_tit">이름</label> <input type="text"
									id="p_name" value="${member.name}" name="name">
							</div>
							<div class="radio">
								<input type="button" class="working" value="구직준비중"> <input
									type="button" class="working" value="구직중"> <input
									type="button" class="working" value="재직중"> <input
									type="hidden" name="working" value="">
							</div>
							<div class="birth">
								<label for="p_birth" class="p_tit">생년월일</label> <input
									type="text" id="p_birth" value="" name="birth">
							</div>
							<c:if test="${member.gender eq 'M'}">
								<div class="gender">
									<label for="p_gender" class="p_tit">성별</label> <input
										type="text" id="p_gender" value="남">
								</div>
								<div class="army">
									<label for="p_army" class="p_tit">병역</label> <input
										type="button" class="p_army" value="미"> <input
										type="button" class="p_army" value="필"> <input
										type="hidden" name="army" value="">
								</div>
							</c:if>

							<c:if test="${member.gender eq 'W'}">
								<div class="gender" style="width: 240px;">
									<label for="p_gender" class="p_tit">성별</label> <input
										type="text" id="p_gender" value="여" style="width: 230px;">
								</div>
							</c:if>
						</div>
						<div class="Decision_border">
							<label for="p_marry" class="p_tit">결혼 여부</label> <input
								type="button" class="p_marry" value="미혼"> <input
								type="button" class="p_marry" value="기혼"> <input
								type="hidden" name="marry" value="">
						</div>
						<div class="Decision_border">
							<label for="hobby" class="p_tit">취미</label> <input type="text"
								id="hobby" name="hobby" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="p_phone" class="p_tit">휴대폰</label> <input type="text"
								id="p_phone" value="" name="phone" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="p_email" class="p_tit">이메일</label> <input type="text"
								id="p_email" value="" name="email" class="Decision">
						</div>
						<div class="Decision_border_2">
							<label for="p_addr" class="p_tit">주소</label> <input type="text"
								id="p_addr" value="" class="Decision_2">
						</div>
						<div class="Decision_border_3">
							<label for="p_addr_2" class="p_tit">상세주소</label> <input
								type="text" id="p_addr_2" value="" class="Decision_3">
						</div>
					</article>


					<!-- 학력사항 -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">학력 사항</div>
					</div>

					<div class="select_border_2">
						<select name="s_kind" class="options">
							<option>최종학력 선택</option>
							<option value="대학교이상">대학교이상</option>
							<option value="고등학교">고등학교</option>
							<option value="중학교">중학교</option>
							<option value="초등학교">초등학교</option>
						</select>
					</div>

					<article class="box_border">
						<div class="Decision_border">
							<label for="s_name" class="p_tit">학교명</label> <input type="text"
								id="s_name" name="s_name" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="major" class="p_tit">전공 계열</label> <input type="text"
								id="major" name="major" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="entrance" class="p_tit">입학년월</label> <input
								type="text" id="entrance" name="entrance"
								placeholder="ex) 200802" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="graduation" class="p_tit">졸업년월</label> <input
								type="text" id="graduation" name="graduation"
								placeholder="ex) 201103" class="Decision">
						</div>
					</article>

					<!-- 자격증 -->
					<div id="bborder">
						<div class="p_meun_border f_left" id="license_tit">
							<div class="p_meun_border_2">자격증</div>
						</div>

						<div id="append_border">
							<div id="x_box"></div>
							<div id="add_box"></div>
						</div>
					</div>

					<article class="box_border" id="licences_boxs">
						<div class="Decision_border">
							<label for="l_name" class="p_tit">자격증명</label> <select
								name="l_kind" class="Decision">
								<option>항목선택</option>
								<option value="자격증/면허증">자격증/면허증</option>
								<option value="어학시험">어학시험</option>
								<option value="수상내역/공모전">수상내역/공모전</option>
							</select>
						</div>
						<div class="Decision_border">
							<label for="l_name" class="p_tit">자격증명</label> <input type="text"
								id="l_name" name="l_name" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="l_date" class="p_tit">취득일</label> <input type="text"
								id="l_date" name="l_date" placeholder="ex) 200802"
								class="Decision">
						</div>
						<div class="Decision_border">
							<label for="issue" class="p_tit">발행처</label> <input type="text"
								id="issue" name="issue" class="Decision">
						</div>
					</article>

					<!-- 희망 근무조건 -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">희망 근무조건</div>
					</div>

					<div class="select_border_2">
						<select name="h_kind" class="options">
							<option>근무형태</option>
							<option value="정규직">정규직</option>
							<option value="교육생">교육생</option>
							<option value="파트">파트</option>
							<option value="계약직">계약직</option>
							<option value="인턴직">인턴직</option>
							<option value="아르바이트">아르바이트</option>
							<option value="프리랜서">프리랜서</option>
						</select>
					</div>

					<div id="ex">
						<article class="box_border">
							<div class="Decision_border">
								<label for="h_job" class="p_tit">직종</label> <input type="text"
									id="h_job" name="h_job" class="Decision">
							</div>
							<div class="Decision_border">
								<label for="h_work" class="p_tit">업종</label> <input type="text"
									id="h_work" name="h_work" class="Decision">
							</div>
							<div class="Decision_border">
								<label for="location" class="p_tit">근무지역</label> <input
									type="text" id="location" name="location" class="Decision">
							</div>
							<div class="Decision_border">
								<label for="salary" class="p_tit">연봉</label> <input type="text"
									id="salary" name="salary" class="Decision"
									placeholder="ex) 1400만 ~ 1600만  or  회사내에규따름">
							</div>
						</article>
					</div>

					<!-- 경력 사항 -->
					<div class="p_meun_border f_left" id="carrer_tit">
						<div class="p_meun_border_2">경력 사항</div>
					</div>

					<div class="sub_box">
						<input type="button" class="cr_kind" value="신입" id="newcomer">
						<input type="button" class="cr_kind" value="경력" id="careers">
						<input type="hidden" name="cr_kind" value="">
					</div>

					<article id="carrer_border" style="display: none;">
						<div class="Decision_border">
							<label for="company_n" class="p_tit">회사명</label> <input
								type="text" id="company_n" value="" name="company_n"
								class="Decision">
						</div>
						<div class="period">
							<label for="joined" class="p_tit">입사년월</label> <input type="text"
								id="joined" placeholder="ex) 200802" name="joined">
						</div>
						<div class="period">
							<label for="resign" class="p_tit">퇴사년월</label> <input type="text"
								id="resign" placeholder="ex) 201206" name="resign">
						</div>
						<div id="w_kind_border">
							<select name="w_kind" id="w_kind">
								<option value="퇴사">퇴사</option>
								<option value="재직">재직</option>
							</select>
						</div>
						<div class="Decision_border">
							<label for="rank" class="p_tit">직책</label> <input type="text"
								id="rank" name="rank" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="fess" class="p_tit">직종</label> <input type="text"
								id="fess" name="fess" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="cr_work" class="p_tit">담당업무</label> <input
								type="text" id="cr_work" name="cr_work" class="Decision">
						</div>
						<div class="Decision_border">
							<label for="cr_sal" class="p_tit">연봉</label> <input type="text"
								id="cr_sal" name="cr_sal" placeholder="ex) 2100만"
								class="Decision">
						</div>
					</article>


				</section>
			</form>

		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>