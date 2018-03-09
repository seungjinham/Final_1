<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitSearch.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var area = new Array(2);
		var presivalue = "";
		var sivalue = "";
		var sicode = "";
		var subsivalue = "";
		var guvalue = "";
		var gucode = "";
		var subguvalue = "";
		var dongvalue = new Array(2);
		var dongcount = 0;
		var gucount = 0;

		$("#woodae").click(function() {
			$("#speckind").css('display', 'block');
		});

		$("#area_a").click(function() {
			$("#districtcode").css('display', 'block');
			$("#si_box").css('display', 'block');
		});

		$(".si_a").click(function() {
					sivalue = $(this).attr("title");
					sicode = $(this).attr("media");
					subsivalue = sivalue;
					presivalue = sivalue;

					if (presivalue != "" || presivalue != sivalue) {
						$("#dong_box").css('display', 'none');
					}
					$.get("../recruit/recruitSearch?si_value=" + sivalue + "&si_code=" + sicode, function(data) {
						$("#gu").html(data);
					});
					$("#gu_box").css('display', 'block');
				});

		$("#gu").on("click", ".gu_a", function() {
					guvalue = "";
					gucode = "";
					guvalue = $(this).attr("title");
					gucode = $(this).attr("media");
					subguvalue = guvalue;
					if (guvalue != "" && guvalue != '전체') {
						guvalue = guvalue.split(" ");
						if (guvalue.length == 1) {
							guvalue = guvalue[0];
						} else {
							guvalue = guvalue[1];
						}
					}

					if (gucode != "" && gucode != '00000') {
						gucode = gucode.split(" ");
						if (gucode.length == 1) {
							gucode = gucode[0];
						} else {
							gucode = gucode[1];
						}
					}

					if (guvalue != '전체' && gucode != '00000') {
						$.get("../recruit/recruitSearch?si_value=" + sivalue + "&si_code=" + sicode + "&gu_value=" + guvalue + "&gu_code=" + gucode, function(data) {
							$("#dong").html(data);
						});
						$("#dong_box").css('display', 'block');
					} else {
						if (gucount < 2) {
							area[gucount] = sivalue;
							gucount++;
						} else {
							alert("최대 2개까지 선택가능합니다.");
						}
					}
				});

		$("#dong").on("click", ".dongkey", function() {
			var ch = $(this);
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					if (dongcount < 2) {
						if (ch[i].value == '전체') {
							area[dongcount] = subsivalue + " " + subguvalue;
							dongcount++;
						} else {
							area[dongcount] = subsivalue + " " + subguvalue + ch[i].value;
							dongcount++;
						}
					} else {
						ch[i].checked = false;
						alert("최대 2개까지만 선택할 수 있습니다.");
					}
				} else if (ch[i].checked == true) {
					ch[i].checked = false;
					dongcount--;
				} else {

				}
			}
		});

		$("#default").click(function() {
			location.reload();
		});

		$("#jk").click(function() {
			$("#jobkind").css('display', 'block');
		});
		//나이
		$("#mu").click(function(){
			if($(this).prop("checked")){
				$("#age").val($(this).val());
			}else{
				$("#age").val("");
			}
		});
		$("#search").click(function() {
			var job = new Array();
			var w_date = new Array();
			var w_day;
			var w_time = new Array();
			var salary;
			var gender;
			var age;
			var school = new Array();
			var special = new Array();
			var title;
			var c_name;
			var etc = new Array();

			//지역
			$("#zone1").attr("value", area[0]);
			$("#zone2").attr("value", area[1]);

			//업종
			var ch = $(".jobk");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					job[i] = ch[i].value;
				}
			}

			//근무기간
			var ch = $(".term");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					w_date[i] = ch[i].value;
				}
			}

			//근무요일
			if ($(':radio[name="w_day"]:checked').prop("checked")) {
				w_day = $(':radio[name="w_day"]:checked').val();
			}

			//근무시간
			var ch = $(".time");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					w_time[i] = ch[i].value;
				}
			}

			//급여
			if ($(':radio[name="salary"]:checked').prop("checked")) {
				salary = $(':radio[name="salary"]:checked').val();
			}


			//성별
			if ($(':radio[name="gender"]:checked').val() == '남자') {
				gender = $(':radio[name="gender"]:checked').val();
			} else if ($(':radio[name="gender"]:checked').val() == '여자') {
				gender = $(':radio[name="gender"]:checked').val();
			} else if ($('input:checkbox[name="gender"]').prop("checked")) {
				gender = $('input:checkbox[name="gender"]').val();
			} else {
				gender = $('input:checkbox[name="gender"]').val();
			}

			//학력
			var ch = $(".spec");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					school[i] = ch[i].value;
				}
			}

			//검색어
			var ch = $(".key");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					etc[i] = ch[i].value;
				}
			}

			if (etc[0] == '회사명') {
				title = $("#keyword").val();
			} else if (etc[1] == '채용제목') {
				title = $("#keyword").val();
			} else {
				title = $("#keyword").val();
				title = $("#keyword").val();
			}

			//우대사항
			var ch = $(".spk");
			for (var i = 0; i < ch.length; i++) {
				if (ch[i].checked) {
					special[i] = ch[i].value;
				}
			}			
		});
	});
</script>
</head>
<body>
	<%@include file="../temp/header1.jsp"%>
	<section id="main">
		<div id="first">
			<div id="searchsite">
				<div>
					<h1 class="h1">상세검색</h1>
				</div>
				<form id="form" name="frm" action="<%=request.getContextPath()%>/recruit/recruitSearch">
					<div id="searchbox">
						<fieldset class="common">
							<h3>지역</h3>
							<div id="area" class="selbox">
								<a href="javascript:void(0)" id="area_a">지역을 선택하세요 (최대 2개 가능)</a>
								<input type="hidden" name="area" value="" id="zone1">
								<input type="hidden" name="area" value="" id="zone2">
							</div>
							<div id="districtcode">
								<div id="si_box">
									<ul id="si">
										<c:forEach var="city" items="${sicode}">
											<li class="is">
											<input type="hidden" value="${city}" class="sikey">
											<a href="javascript:void(0)" class="si_a" title="${siname[city]}" media="${city}">${siname[city]}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div id="gu_box">
									<ul id="gu">

									</ul>
								</div>
								<div id="dong_box">
									<ul id="dong">

									</ul>
								</div>

							</div>
						</fieldset>

						<fieldset class="common">
							<h3>직종-업종</h3>
							<div id="jobwork" class="selbox">
								<a href="javascript:void(0)" id="jk">직종-업종을 선택하세요 (최대 2개)</a>
							</div>
							<div id="jobkind">
								<ul>
									<c:forEach var="kind" items="${jobkind}">
										<li><input type="checkbox" value="${kind}" class="jobk" name="job">${kind}</li>
									</c:forEach>
								</ul>
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>근무기간</h3>
							<div class="selbox">
								<input type="checkbox" name="w_date" value="1일" class="term">1일
								<input type="checkbox" name="w_date" value="1주일" class="term">1주일
								<input type="checkbox" name="w_date" value="1개월" class="term">1개월
								<input type="checkbox" name="w_date" value="3개월" class="term">3개월
								<input type="checkbox" name="w_date" value="6개월" class="term">6개월
								<input type="checkbox" name="w_date" value="1년이상" class="term">1년이상
							</div>
						</fieldset>


						<fieldset class="common">
							<h3>근무요일</h3>
							<div class="selbox">
								<input type="radio" name="w_day" value="7">주7일 월~일
								<input type="radio" name="w_day" value="6">주6일 월~토 
								<input type="radio" name="w_day" value="5">주5일 월~금 
								<input type="radio" name="w_day" value="주말 ">주말 토~일
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>근무시간</h3>
							<div class="selbox">
								<input type="checkbox" name="w_time" value="오전" class="time">오전
								<input type="checkbox" name="w_time" value="오후" class="time">오후
								<input type="checkbox" name="w_time" value="저녁" class="time">저녁
								<input type="checkbox" name="w_time" value="새벽" class="time">새벽
								<input type="checkbox" name="w_time" value="풀타임" class="time">풀타임
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>급여</h3>
							<div class="selbox">
								<input type="radio" name="salary" value="시급">시급 &nbsp; 
								<input type="radio" name="salary" value="일급">일급&nbsp; 
								<input type="radio" name="salary" value="주급">주급&nbsp; 
								<input type="radio" name="salary" value="월급">월급&nbsp; 
								<input type="radio" name="salary" value="연봉">연봉 &nbsp;
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>성별</h3>
							<div class="selbox">
								<input type="radio" name="gender" value="남자">남자 &nbsp; 
								<input type="radio" name="gender" value="여자">여자 &nbsp; 
								<input type="checkbox" name="gender" value="무관">무관
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>연령</h3>
							<div class="selbox">
								<input type="text" size="5" value="" id="age" name="age">세&nbsp; 
								<input type="checkbox" id="mu" value="무관">무관
							</div>
						</fieldset>

						<fieldset class="common" id="school">
							<h3>학력</h3>
							<div class="selbox">
								&nbsp;<input type="checkbox" name="school" value="초등학교졸업" class="spec">초등학교졸업 &nbsp;
								      <input type="checkbox"name="school" value="중학교졸업" class="spec">중학교졸업 &nbsp;
								      <input type="checkbox" name="school" value="고등학교졸업" class="spec">고등학교졸업 &nbsp;
								      <input type="checkbox" name="school" value="전문대졸업" class="spec">전문대졸업 &nbsp;
								      <input type="checkbox" name="school" value="4년제졸업" class="spec">4년제졸업 &nbsp;
								      <input type="checkbox" name="school" value="대학원졸업" class="spec">대학원졸업 &nbsp;
								      <input type="checkbox" name="school" value="대학교재학" class="spec">대학교재학 &nbsp;
								      <input type="checkbox" name="school" value="대학교휴학" class="spec">대학교휴학
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>우대조건</h3>
							<div id="special" class="selbox">
								<a href="javascript:void(0)" id="woodae">우대사항을 선택하세요 (최대 2개 가능)</a>
							</div>
							<div id="speckind">
								<ul>
									<c:forEach var="kinds" items="${speckind}">
										<li><input type="checkbox" value="${kinds}" class="spk" name="special">${kinds}</li>
									</c:forEach>
								</ul>
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>키워드</h3>
							<div class="selbox">
								<input type="text" size="40" style="width: 200px; height: 20px;" name="title" id="keyword">&nbsp; 
								<input type="checkbox" value="회사명" checked="checked" class="key">회사명&nbsp;
								<input type="checkbox" value="채용제목" checked="checked" class="key">채용제목
							</div>
						</fieldset>

						<fieldset id="searchbtn">
							<div id="btngroup">
								<input type="submit" value="검색" id="search">&nbsp;&nbsp;&nbsp;
								<input type="button" value="초기화" id="default">
							</div>
						</fieldset>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>