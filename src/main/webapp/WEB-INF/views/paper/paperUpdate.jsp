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
	href="<%=request.getContextPath()%>/resources/css/member/p_meun.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/paper/paperUpdate.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Paper Update</title>
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

		//사진 변경
		$("#change_photo").click(function() {
			$("#photo_border_2").css("display", "none");
			$("#photo_border").show();

		});

		var birth = '${member.birth}';
		var birthArr = birth.split(',');
		$("#p_birth").attr("value",
				birthArr[0] + " / " + birthArr[1] + " / " + birthArr[2]);

		var phone = '${member.phone}';
		var phoneArr = phone.split(',');
		$("#p_phone").attr("value",
				phoneArr[0] + " - " + phoneArr[1] + " - " + phoneArr[2]);

		var addr = '${member.addr}';
		var addrArr = addr.split(',');
		$("#p_addr").attr("value", addrArr[1] + addrArr[2]);
		$("#p_addr_2").attr("value", addrArr[3]);

		//구직 구분 버튼
		var working = $("#work_hidden").val();
		if (working == '구직준비중') {
			$("#work_1").css("border", "2px solid #23A41A");
			$("#work_1").css("color", "#23A41A");
			$("#work_1").css("font-weight", "bold");
		}
		if (working == '구직중') {
			$("#work_2").css("border", "2px solid #23A41A");
			$("#work_2").css("color", "#23A41A");
			$("#work_2").css("font-weight", "bold");
		}
		if (working == '재직중') {
			$("#work_3").css("border", "2px solid #23A41A");
			$("#work_3").css("color", "#23A41A");
			$("#work_3").css("font-weight", "bold");
		}

		$(".working").click(function() {
			var working = $(this).val();
			$("#work_hidden").val(working);
			var r = $("#work_hidden").val();
		});
		$("#work_1").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#work_2").css("color", "#A9A9A9");
			$("#work_2").css("border", "1px solid #A9A9A9");
			$("#work_2").css("font-weight", "normal");
			$("#work_3").css("color", "#A9A9A9");
			$("#work_3").css("border", "1px solid #A9A9A9");
			$("#work_3").css("font-weight", "normal");
		});
		$("#work_2").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#work_1").css("color", "#A9A9A9");
			$("#work_1").css("border", "1px solid #A9A9A9");
			$("#work_1").css("font-weight", "normal");
			$("#work_3").css("color", "#A9A9A9");
			$("#work_3").css("border", "1px solid #A9A9A9");
			$("#work_3").css("font-weight", "normal");
		});
		$("#work_3").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#work_1").css("color", "#A9A9A9");
			$("#work_1").css("border", "1px solid #A9A9A9");
			$("#work_1").css("font-weight", "normal");
			$("#work_2").css("color", "#A9A9A9");
			$("#work_2").css("border", "1px solid #A9A9A9");
			$("#work_2").css("font-weight", "normal");
		});

		//병역 버튼
		var army = $("#army_hidden").val();
		if (army == '미') {
			$("#army_1").css("border", "2px solid #23A41A");
			$("#army_1").css("color", "#23A41A");
			$("#army_1").css("font-weight", "bold");
		}
		if (army == '필') {
			$("#army_2").css("border", "2px solid #23A41A");
			$("#army_2").css("color", "#23A41A");
			$("#army_2").css("font-weight", "bold");
		}

		$(".p_army").click(function() {
			var p_army = $(this).val();
			$("#army_hidden").val(p_army);
			$("#army_hidden").val();
		});
		$("#army_1").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#army_2").css("color", "#A9A9A9");
			$("#army_2").css("border", "1px solid #A9A9A9");
			$("#army_2").css("font-weight", "normal");
		});
		$("#army_2").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#army_1").css("color", "#A9A9A9");
			$("#army_1").css("border", "1px solid #A9A9A9");
			$("#army_1").css("font-weight", "normal");
		});

		//결혼 여부 버튼
		var marry = $("#marry_hidden").val();
		if (marry == '미혼') {
			$("#marry_1").css("border", "2px solid #23A41A");
			$("#marry_1").css("color", "#23A41A");
			$("#marry_1").css("font-weight", "bold");
		}
		if (marry == '기혼') {
			$("#marry_2").css("border", "2px solid #23A41A");
			$("#marry_2").css("color", "#23A41A");
			$("#marry_2").css("font-weight", "bold");
		}
		$(".p_marry").click(function() {
			var p_marry = $(this).val();
			$("#marry_hidden").val(p_marry);
			$("#marry_hidden").val();
		});
		$("#marry_1").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#marry_2").css("color", "#A9A9A9");
			$("#marry_2").css("border", "1px solid #A9A9A9");
			$("#marry_2").css("font-weight", "normal");
		});
		$("#marry_2").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#marry_1").css("color", "#A9A9A9");
			$("#marry_1").css("border", "1px solid #A9A9A9");
			$("#marry_1").css("font-weight", "normal");
		});

		//학력
		var s_kind = '${paper.s_kind}';
		$("#s_kind").val(s_kind);

		//희망근무
		var h_kind = '${paper.h_kind}';
		$("#h_kind").val(h_kind);

		//경력
		var w_kind = '${paper.w_kind}';
		$("#w_kind").val(w_kind);

		var cr = $("#cr_kind_hidden").val();
		if (cr == '신입') {
			$("#carrer_border").css("display", "none");
			$("#newcomer").css("border", "2px solid #23A41A");
			$("#newcomer").css("color", "#23A41A");
			$("#newcomer").css("font-weight", "bold");
			$(".carr_input").val("");
		} else {
			$("#box_tit_border_2").css("border", "none");
			$("#careers").css("border", "2px solid #23A41A");
			$("#careers").css("color", "#23A41A");
			$("#careers").css("font-weight", "bold");
		}

		$(".cr_kind").click(function() {
			var cr_kind = $(this).val();
			$("#cr_kind_hidden").val(cr_kind);
			var career = $("#cr_kind_hidden").val();

			if (career == "경력") {
				$("#carrer_border").slideDown("slow");
				$(this).css("border", "2px solid #23A41A");
				$(this).css("color", "#23A41A");
				$(this).css("font-weight", "bold");
				$("#newcomer").css("color", "#A9A9A9");
				$("#newcomer").css("border", "1px solid #A9A9A9");
				$("#newcomer").css("font-weight", "normal");
				$("#box_tit_border_2").css("border-bottom", "none");

			} else {
				$("#carrer_border").hide();
				$("#box_tit_border_2").css("border-bottom", "1px dotted gray");
				$(this).css("border", "2px solid #23A41A");
				$(this).css("color", "#23A41A");
				$(this).css("font-weight", "bold");
				$("#careers").css("color", "#A9A9A9");
				$("#careers").css("border", "1px solid #A9A9A9");
				$("#careers").css("font-weight", "normal");
				$(".carr_input").val("");
			}
		});

		//자격증
		var l_kinds = '${license.l_kinds}';
		$("#l_kinds").val(l_kinds);

		var issue = $("#issue").val();
		if (issue != "") {
			$("#licences_boxs").show();
			$("#box_tit_border").css("border", "none");
		}
		$(".add_box").click(function() {
			$("#licences_boxs").slideDown("slow");
			$("#box_tit_border").css("border-bottom", "none");
		});
		$(".x_box").click(function() {
			$("#licences_boxs").hide();
			$(".license_input").val("");
			$("#box_tit_border").css("border-bottom", "1px dotted gray");
		});

		//포트폴리오
		var con = $("#contents").val();
		if (con != "") {
			$("#port_info").show();
			$("#box_tit_border_3").css("border", "none");
		}

		$("#chan_btn").click(function() {
			$("#oname").css("display", "none");
			$(this).css("display", "none");
			$("#changeFile").show();
		});

		$(".port_add").click(function() {
			$("#port_info").slideDown("slow");
			$("#box_tit_border_3").css("border-bottom", "none");
		});

		$(".port_x").click(function() {
			$("#port_info").hide();
			$(".port_input").val("");
			$("#box_tit_border_3").css("border-bottom", "1px dotted gray");
		});

		//수정버튼
		$("#up").click(function() {
			if($("#p_tit").val()&&
					$("#work_hidden").val() &&
					$("#army_hidden").val()&&
					$("#marry_hidden").val()&&
					$("#p_hobby").val()&&
					$("#s_kind").val()&&
					$("#s_name").val()&&
					$("#major").val()&&
					$("#entrance").val()&&
					$("#graduation").val()&&
					$("#h_kind").val()&&
					$("#h_job").val()&&
					$("#h_work").val()&&
					$("#location").val()&&
					$("#salary").val()&&
					$("#cr_kind_hidden").val() != null){
			paper_frm.submit();
			}else{
				alert("필수 정보를 입력해주세요.");
			}
		});

	});

	//이력서 사진
	$(function() {
		$("#file").on('change', function() {
			readURL(this);
			$("#blah").show();
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
		;
	};
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
				<div id="tit">이력서 수정</div>
			</div>

			<form action="./paperUpdate" method="post"
				enctype="multipart/form-data" id="paper_frm">
				<input type="hidden" name="paper_num" value="${paper.paper_num}">
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

							<div id="photo_border_2">
								<div id="img_border2_">
									<img src="../resources/upload/${paper.fname}" id="img_photo"
										name="file">
								</div>
								<input type="button" value="사진변경" id="change_photo">
							</div>

							<div id="photo_border" style="display: none">
								<div id="img_border">
									<img id="blah" src="#" alt="your image" style="display: none;">
								</div>
								<label for="file" id="file_label">사진 변경</label> <input
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
								<input type="hidden" name="working" value="${paper.working}"
									id="work_hidden">
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
										type="hidden" name="army" value="${paper.army}"
										id="army_hidden">
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
								type="hidden" name="marry" value="${paper.marry}"
								id="marry_hidden">
						</div>
						<div class="Decision_border">
							<label for="p_hobby" class="p_tit">취미</label> <input type="text"
								id="p_hobby" name="hobby" class="Decision"
								value="${paper.hobby}">
						</div>
						<div class="Decision_border">
							<label for="p_phone" class="p_tit">휴대폰</label> <input type="text"
								id="p_phone" value="" name="phone" class="Decision">

						</div>
						<div class="Decision_border">
							<label for="p_email" class="p_tit">이메일</label> <input type="text"
								id="p_email" value="${member.email}" name="email"
								class="Decision">
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
						<select name="s_kind" class="options" id="s_kind">
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
								id="s_name" name="s_name" class="Decision"
								value="${paper.s_name}">
						</div>
						<div class="Decision_border">
							<label for="major" class="p_tit">전공 계열</label> <input type="text"
								id="major" name="major" class="Decision" value="${paper.major}">
						</div>
						<div class="Decision_border">
							<label for="entrance" class="p_tit">입학년월</label> <input
								type="text" id="entrance" name="entrance"
								placeholder="ex) 200802" class="Decision"
								value="${paper.entrance}">
						</div>
						<div class="Decision_border">
							<label for="graduation" class="p_tit">졸업년월</label> <input
								type="text" id="graduation" name="graduation"
								placeholder="ex) 201103" class="Decision"
								value="${paper.graduation}">
						</div>
					</article>

					<!-- 희망 근무조건 -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">희망 근무조건</div>
					</div>

					<div class="select_border_2">
						<select name="h_kind" class="options" id="h_kind">
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
								id="h_work" name="h_work" class="Decision"
								value="${paper.h_work}">
						</div>
						<div class="Decision_border">
							<label for="location" class="p_tit">근무지역</label> <input
								type="text" id="location" name="location" class="Decision"
								value="${paper.location}">
						</div>
						<div class="Decision_border">
							<label for="salary" class="p_tit">연봉</label> <input type="text"
								id="salary" name="salary" class="Decision"
								placeholder="ex) 1400만 ~ 1600만  or  회사내에규따름"
								value="${paper.salary}">
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
							<input type="hidden" name="career_kind"
								value="${paper.career_kind}" id="cr_kind_hidden">
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
								id="rank" name="rank" class="Decision carr_input"
								value="${paper.rank}">
						</div>
						<div class="Decision_border">
							<label for="fess" class="p_tit">직종</label> <input type="text"
								id="fess" name="fess" class="Decision carr_input"
								value="${paper.fess}">
						</div>
						<div class="Decision_border">
							<label for="cr_work" class="p_tit">담당업무</label> <input
								type="text" id="cr_work" name="career_work"
								class="Decision carr_input" value="${paper.career_work}">
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
							<div class="add_box"></div>
						</div>
					</div>

					<article class="box_border" id="licences_boxs"
						style="display: none;">
						<div class="Decision_border">
							<label for="l_kind" class="p_tit">항목</label> <select
								name="l_kinds" class="Decision license_input" id="l_kinds">
								<option value="">항목선택</option>
								<option value="자격증/면허증">자격증/면허증</option>
								<option value="어학시험">어학시험</option>
								<option value="수상내역/공모전">수상내역/공모전</option>
							</select>
						</div>
						<div class="Decision_border">
							<label for="l_name" class="p_tit">자격증명</label> <input type="text"
								id="l_name" name="l_names" class="Decision license_input"
								value="${license.l_names}">
						</div>
						<div class="Decision_border">
							<label for="issue" class="p_tit">발행처</label> <input type="text"
								id="issue" name="l_issue" class="Decision license_input"
								value="${license.l_issue}">
						</div>
						<div class="Decision_border_3">
							<label for="l_date" class="p_tit">취득일</label> <input type="text"
								id="l_date" name="l_date" placeholder="ex) 200802"
								class="Decision_3 license_input" value="${license.l_date}">
						</div>
						<div class="x_box"></div>
					</article>

					<!-- 포트폴리오 -->
					<div id="box_tit_border_3">
						<div class="p_meun_border f_left">
							<div class="p_meun_border_2">포트폴리오</div>
						</div>

						<div class="append_border">
							<div class="port_add"></div>
						</div>
					</div>

					<article class="box_border" id="port_info" style="display: none;">
						<div class="Decision_border" id="onames">
							<label for="prot_name" class="p_tit">파일</label> <input
								type="text" name="port_file" class="Decision port_input"
								value="${port.oname}" id="oname"> <input type="file"
								name="port_file" class="Decision port_input"
								style="display: none;" id="changeFile">
						</div>
						<div id="change_btn">
							<input type="text" value="변경" id="chan_btn">
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
						<div class="port_x"></div>
					</article>
				</section>

				<article id="up_btn_border">
					<div id="up_btn">
						<input type="button" value="확인" id="up">
					</div>
				</article>
			</form>

		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>