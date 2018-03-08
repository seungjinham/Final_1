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
<link href="<%=request.getContextPath()%>/resources/css/paper/paperUpdate.css" rel="stylesheet">
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
		
		$("#s_m5").css("color", "#23A41A");
		$("#s_m5").css("font-weight", "bold");
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
				enctype="multipart/form-data" id="paper_frm">
				<input type="hidden" name="id" value="${member.id}">
				<section id="paper_border">
					<div id="p_tit_border">
						<div id="p_tit_border_2">이력서 제목</div>
						<div id="p_tit_border_3">
							<input type="text" name="title" id="p_tit" value="${paper.title}"
								placeholder="이력서 제목을 입력하세요. (50자 이내)">
						</div>
					</div>

					<article id="info_borders">
						<div class="p_meun_border">
							<div class="p_meun_border_2">기본 정보</div>
						</div>

						<div id="border_1">

							<div id="photo_border">
								<div id="img_border">
									<img id="blah" src="#" alt="your image" style="display: none;">
								</div>
								<label for="file" id="file_label">사진 등록</label> <input
									type='file' id="file" name="file">
							</div>

							<div class="name">
								<label for="p_name" class="p_tit">이름</label> <input type="text"
									id="p_name" value="${member.name}" name="name">
							</div>
							<div class="radio">
								<input type="button" class="working" value="구직준비중" id="work_1">
								<input type="button" class="working" value="구직중" id="work_2">
								<input type="button" class="working" value="재직중" id="work_3">
								<input type="hidden" name="working" value="" id="work_hidden">
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
										type="button" class="p_army" value="미" id="army_1"> <input
										type="button" class="p_army" value="필" id="army_2"> <input
										type="hidden" name="army" value="" id="army_hidden">
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
								type="button" class="p_marry" value="미혼" id="marry_1"> <input
								type="button" class="p_marry" value="기혼" id="marry_2"> <input
								type="hidden" name="marry" value="" id="marry_hidden">
						</div>
						<div class="Decision_border">
							<label for="p_hobby" class="p_tit">취미</label> <input type="text"
								id="p_hobby" name="hobby" class="Decision" value="${paper.hobby}">
						</div>
						<div class="Decision_border">
							<label for="p_phone" class="p_tit">휴대폰</label> <input type="text"
								id="p_phone" value="" name="phone" class="Decision">

						</div>
						<div class="Decision_border">
							<label for="p_email" class="p_tit">이메일</label> <input type="text"
								id="p_email" value="${member.email}" name="email" class="Decision">
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
								id="s_name" name="s_name" class="Decision" value="${paper.s_name}">
						</div>
						<div class="Decision_border">
							<label for="major" class="p_tit">전공 계열</label> <input type="text"
								id="major" name="major" class="Decision" value="${paper.major}">
						</div>
						<div class="Decision_border">
							<label for="entrance" class="p_tit">입학년월</label> <input
								type="text" id="entrance" name="entrance"
								placeholder="ex) 200802" class="Decision" value="${paper.entrance}">
						</div>
						<div class="Decision_border">
							<label for="graduation" class="p_tit">졸업년월</label> <input
								type="text" id="graduation" name="graduation"
								placeholder="ex) 201103" class="Decision" value="${paper.graduation}">
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

					<article class="box_border">
						<div class="Decision_border">
							<label for="h_job" class="p_tit">직종</label> <input type="text"
								id="h_job" name="h_job" class="Decision" value="${paper.h_job}">
						</div>
						<div class="Decision_border">
							<label for="h_work" class="p_tit">업종</label> <input type="text"
								id="h_work" name="h_work" class="Decision" value="${paper.h_work}">
						</div>
						<div class="Decision_border">
							<label for="location" class="p_tit">근무지역</label> <input
								type="text" id="location" name="location" class="Decision" value="${paper.location}">
						</div>
						<div class="Decision_border">
							<label for="salary" class="p_tit">연봉</label> <input type="text"
								id="salary" name="salary" class="Decision"
								placeholder="ex) 1400만 ~ 1600만  or  회사내에규따름" value="${paper.salary}">
						</div>
					</article>

					<!-- 경력 사항 -->
					<div id="box_tit_border_2">
						<div class="p_meun_border f_left">
							<div class="p_meun_border_2">경력 사항</div>
						</div>

						<div class="sub_box">
							<input type="button" class="cr_kind" value="신입" id="newcomer">
							<input type="button" class="cr_kind" value="경력" id="careers">
							<input type="hidden" name="career_kind" value=""
								id="cr_kind_hidden">
						</div>
					</div>

					<article id="carrer_border">
						<div class="Decision_border">
							<label for="company_n" class="p_tit">회사명</label> <input
								type="text" id="company_n" name="company_n"
								class="Decision carr_input" value="${paper.company_n}">
						</div>
						<div class="period">
							<label for="joined" class="p_tit">입사년월</label> <input type="text"
								id="joined" placeholder="ex) 200802" name="joined"
								class="carr_input" value="${paper.joined}">
						</div>
						<div class="period" id="resign_box">
							<label for="resign" class="p_tit">퇴사년월</label> <input type="text"
								id="resign" placeholder="ex) 201206" name="resign"
								class="carr_input" value="${paper.resign}">
						</div>
						<div id="w_kind_border">
							<select name="w_kind" id="w_kind" class="carr_input">
								<option value="">선택</option>
								<option value="퇴사">퇴사</option>
								<option value="재직">재직</option>
							</select>
						</div>
						<div class="Decision_border">
							<label for="rank" class="p_tit">직책</label> <input type="text"
								id="rank" name="rank" class="Decision carr_input" value="${paper.rank}">
						</div>
						<div class="Decision_border">
							<label for="fess" class="p_tit">직종</label> <input type="text"
								id="fess" name="fess" class="Decision carr_input" value="${paper.fess}">
						</div>
						<div class="Decision_border">
							<label for="cr_work" class="p_tit">담당업무</label> <input
								type="text" id="cr_work" name="career_work" class="Decision carr_input" value="${paper.career_work}">
						</div>
						<div class="Decision_border">
							<label for="cr_sal" class="p_tit">연봉</label> <input type="text"
								id="cr_sal" name="career_sal" placeholder="ex) 2100만"
								class="Decision carr_input" value="${paper.career_sal}">
						</div>
					</article>

					<!-- 자격증 -->
					<div id="box_tit_border">
						<div class="p_meun_border f_left" id="license_tit">
							<div class="p_meun_border_2">자격증</div>
						</div>

						<div class="append_border">
							<div id="add_box"></div>
						</div>
					</div>

					<article class="box_border" id="licences_boxs">
						<div class="Decision_border">
							<label for="l_kind" class="p_tit">항목</label> <select
								name="l_kinds" class="Decision license_input" id="l_kind">
								<option value="">항목선택</option>
								<option value="자격증/면허증">자격증/면허증</option>
								<option value="어학시험">어학시험</option>
								<option value="수상내역/공모전">수상내역/공모전</option>
							</select>
						</div>
						<div class="Decision_border">
							<label for="l_name" class="p_tit">자격증명</label> <input type="text"
								id="l_name" name="l_names" class="Decision license_input" value="${license.l_names}">
						</div>
						<div class="Decision_border">
							<label for="issue" class="p_tit">발행처</label> <input type="text"
								id="issue" name="l_issue" class="Decision license_input" value="${license.l_issue}">
						</div>
						<div class="Decision_border_3">
							<label for="l_date" class="p_tit">취득일</label> <input type="text"
								id="l_date" name="l_date" placeholder="ex) 200802"
								class="Decision_3 license_input" value="${license.l_date}">
						</div>
						<div id="x_box"></div>
					</article>

					<!-- 포트폴리오 -->
					<div id="box_tit_border_3">
						<div class="p_meun_border f_left">
							<div class="p_meun_border_2">포트폴리오</div>
						</div>

						<div class="append_border">
							<div id="port_add"></div>
						</div>
					</div>

					<article class="box_border" id="port_info">
						<div class="Decision_border">
							<label for="prot_name" class="p_tit">파일</label> <input
								type="text" name="port_file" class="Decision port_input" value="${port.oname}">
						</div>
						<div class="port_box_2">
							<label for="port_date" class="p_tit">작업 기간</label> <input
								type="text" id="port_date" name="p_date" placeholder="ex) 3일"
								class="port_input" value="${port.p_date}">
						</div>
						<div class="port_box_2">
							<label for="people" class="p_tit">작업 인원</label> <input
								type="text" id="people" name="people" placeholder="ex) 3명"
								class="port_input" value="${port.people}">
						</div>
						<div class="port_box_3">
							<label for="contents" class="p_tit">작품 소개</label> <input
								type="text" id="contents" name="contents" placeholder="20자 이내"
								class="port_input" value="${port.contents}">
						</div>
						<div id="port_x"></div>
					</article>
				</section>

				<article id="insert_btn_border">
					<div id="insert_btn">
						<input type="button" value="확인" id="insert">
					</div>
				</article>
			</form>

		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>