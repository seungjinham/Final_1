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
$(function(){
	var spec = new Array("어학가능", "컴퓨터활용", "운전가능", "군필자", "인근거주", "유사업무 경험자", "장애인", "업무 관련 자격증 소지자");
	var category = new Array("요식업", "IT", "미디어", "유통 판매", "서비스", "사무직", "디자인", "교육 강사", "문화생활", "건설 운송"); 
	
	$("#woodae").click(function(){
		$("#woo").html("<div><ul></ul></div>");
	});
	
 	$("#area_a").click(function(){
		$("#districtcode").css('display', 'block');
		$("#si").css('display', 'block');
	});
	
	$(".si_a").click(function(){
		$("#gu").css('display', 'block');
	});
	
 	$(".gu_a").click(function(){
		$("#dong").css('display', 'block');
	});
 	
 	$("#default").click(function(){
 		location.reload();
 	}); 
 	
 	$("#search").click(function(){
 		var addr = new Array();
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
 		
 		//근무기간
 		var ch = $(".term");
 		for(var i=0; i<ch.length; i++) {
 			if(ch[i].checked) {
 				w_date[i] = ch[i].value;
 			}
 		}
		
 		//근무요일
 		if($(':radio[name="w_day"]:checked').prop("checked")) {
 			w_day=$(':radio[name="w_day"]:checked').val();
 		}
 		
 		//근무시간
 		var ch = $(".time");
 		for(var i=0; i<ch.length; i++) {
 			if(ch[i].checked) {
 				w_time[i] = ch[i].value;
 			}
 		}
 		
 		//급여
 		if($(':radio[name="salary"]:checked').prop("checked")) {
 			salary=$(':radio[name="salary"]:checked').val();
 		}
		
 		//나이
		if($("#age").val()!="") {
			age=$("#age").val();
		}else {
			age=$('input:checkbox[name="age"]').val();
		}
		
 		//성별
		if($(':radio[name="gender"]:checked').val()=='남자') {
			gender = $(':radio[name="gender"]:checked').val();
		} else if($(':radio[name="gender"]:checked').val()=='여자') {
			gender = $(':radio[name="gender"]:checked').val();
		} else if($('input:checkbox[name="gender"]').prop("checked")){
			gender = $('input:checkbox[name="gender"]').val();
		} else {
			gender = $('input:checkbox[name="gender"]').val();
		}
 		
 		//학력
		var ch = $(".spec");
 		for(var i=0; i<ch.length; i++) {
 			if(ch[i].checked) {
 				school[i] = ch[i].value;
 			}
 		}
 		
 		//검색어
 		var ch = $(".key");
 		for(var i=0; i<ch.length; i++) {
 			if(ch[i].checked) {
 				etc[i] = ch[i].value;
 			}
 		}
 		
 		if(etc[0]=='회사명') {
 			c_name=$("#keyword").val();
 			console.log(c_name);
 		} else if(etc[1]=='채용제목') {
 			title=$("#keyword").val();
 			console.log(title);
 		} else {
 			c_name=$("#keyword").val();
 			title=$("#keyword").val();
 			console.log(c_name);
 			console.log(title);
 		}
 	});
});
</script>
</head>
<body>
	<%@include file="../temp/header1.jsp"%>
	<section id="main">
	<a href="<%=request.getContextPath()%>/recruit/recruitSearchList">SearchList</a>
		<div id="first">
			<div id="searchsite">
				<div>
					<h1 class="h1">상세검색</h1>
				</div>
				<form id="form" name="frm">
					<div id="searchbox">
						<fieldset class="common">
							<h3>지역</h3>
							<div id="area" class="selbox"><a href="javascript:void(0)" id="area_a">지역을 선택하세요 (최대 2개 가능)</a>						
							</div>
						<div id="districtcode">
							<ul id="si">
							<c:forEach var="city" items="${sinum}">
							<li class="is"><a href="javascript:void(0)" class="si_a" title="${city}">${si[city]}</a></li>
							</c:forEach>
 							</ul>
							<ul id="gu">
							<c:forEach var="town" items="${gunum}">
							<li class="is"><a href="javascript:void(0)" class="gu_a" title="${town}">${gu[town]}</a></li>
							</c:forEach>
							</ul>
							<ul id="dong">
							<c:forEach var="village" items="${dongnum}">
							<li class="is"><a href="javascript:void(0)" class="dong_a">${dong[village]}</a></li>
							</c:forEach>
							</ul>
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>직종-업종</h3>
							<div id="jobwork" class="selbox">직종-업종을 선택하세요 (최대 2개)</div>
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
								<input type="radio" name="w_day" value="주7일 월~일">주7일 월~일 
								<input type="radio" name="w_day" value="주6일 월~토 ">주6일 월~토 
								<input type="radio" name="w_day" value="주5일 월~금">주5일 월~금
								<input type="radio" name="w_day"value="주말 토~일">주말 토~일
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>근무시간</h3>
							<div class="selbox">
								<input type="checkbox" name="clock" value="오전" class="time">오전 
								<input type="checkbox" name="clock" value="오후" class="time">오후
								<input type="checkbox" name="clock" value="저녁" class="time">저녁 
								<input type="checkbox" name="clock" value="새벽" class="time">새벽
								<input type="checkbox" name="clock" value="풀타임" class="time">풀타임
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
								<input type="checkbox" name="gen" value="무관">무관
							</div>
						</fieldset>

						<fieldset class="common">
							<h3>연령</h3>
							<div class="selbox">
								<input type="text" size="5" value="" id="age">세&nbsp; 
								<input type="checkbox" name="age" value="무관">무관
							</div>
						</fieldset>

						<fieldset class="common" id="school">
							<h3>학력</h3>
							<div class="selbox">
								&nbsp;<input type="checkbox" name="school" value="초등학교졸업" class="spec">초등학교졸업 
								&nbsp;<input type="checkbox" name="school" value="중학교졸업" class="spec">중학교졸업 
								&nbsp;<input type="checkbox" name="school" value="고등학교졸업" class="spec">고등학교졸업
								&nbsp;<input type="checkbox" name="school" value="전문대졸업" class="spec">전문대졸업
								&nbsp;<input type="checkbox" name="school" value="4년제졸업" class="spec">4년제졸업 
								&nbsp;<input type="checkbox" name="school" value="대학원졸업" class="spec">대학원졸업
								&nbsp;<input type="checkbox" name="school" value="대학교재학" class="spec">대학교재학 
								&nbsp;<input type="checkbox" name="school" value="대학교휴학" class="spec">대학교휴학
							</div>
						</fieldset>

						<fieldset class="common" id="woo">
							<h3>우대조건</h3>
							<div id="special" class="selbox"><a href="javascript:void(0)" id="woodae">우대사항을 선택하세요 (최대 2개 가능)</a></div>
						</fieldset>

						<fieldset class="common">
							<h3>키워드</h3>
							<div class="selbox">
								<input type="text" size="40" style="width: 200px; height: 20px;" name="title" id="keyword">&nbsp;
								<input type="checkbox" name="word" value="회사명" checked="checked" class="key">회사명&nbsp; 
								<input type="checkbox" name="word" value="채용제목" checked="checked" class="key">채용제목
							</div>
						</fieldset>

						<fieldset id="searchbtn">
							<div id="btngroup">
								<input type="button" value="검색" id="search">&nbsp;&nbsp;&nbsp;
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