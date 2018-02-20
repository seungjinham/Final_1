<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitView.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#scrap_btn").click(function(){
		var srcpath = $("#sc").attr('src');
		alert(srcpath);
		var defpath = '<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png';
		var num = '${recruit.num}';
		var id = '${member.id}';
		var page = 'view';
		if(defpath==srcpath) {
			$("#sc").attr("src","<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_on.png");
			$.get("../scrap/scrapInsert?recruit_num="+num+"&id="+id+"&page="+page, function(data){
				$("head").append(data);
			});
			//location.href="../scrap/scrapInsert?recruit_num="+num+"&id="+id+"&page="+page;
		} else {
			$("#sc").attr("src","<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png");
			$.get("../scrap/scrapDelete?recruit_num="+num+"&id="+id, function(data){
				$("head").append(data);
			});
			//location.href="../scrap/scrapDelete?recruit_num="+num+"&id="+id;
		}
	});
	
 	var salary = '${recruit.salary}';
	var salaryArr = salary.split(" ");
	$("#sal_title").text(salaryArr[0]);
	$("#sal_cash").text(salaryArr[1]);
});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
	<div id="recruit_info">
	<div id="registration_info">
	<div id="reg_num"><span><h3>${recruit.num}</h3></span></div><div id="func_btn"><div id="scrap_wrap"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png" id="sc"><input type="button" value="스크랩" id="scrap_btn"></div></div>
	</div>
	</div>

		<div id="company_info">
			<div id="recruit_info">
				<div id="company">
					<span><h3>${company.c_name}</h3></span>
					<h1>${recruit.title}</h1>
				</div>
				<div id="thumnail">
					<div id="workview_info">
						<div class="thumitem">
							<div class="circle"><span id="sal_title"></span></div>
							<div class="char" id="sal_cash"></div>
						</div>
						<div class="thumitem">
							<div class="circle"><span>기간</span></div>
							<div class="char">${recruit.w_date}</div>
						</div>

						<div class="thumitem">
							<div class="calendar"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/calendar.PNG"></div>
							<div class="char">${recruit.w_day}</div>
						</div>

						<div class="thumitem">
							<div class="clock"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/clock.PNG"></div>
							<div class="char">${recruit.w_time}</div>
						</div>

						<div class="thumitem">
							<div class="circle"><span>마감일</span></div>
							<div class="char">${recruit.deadline}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="condition_info">
		<div id="leftbox">
		<div id="recruit_condition">
		<p><h1>모집조건</h1></p>
		<p><h3 class="recruit_data">인원</h3><h3 class="recruit_data rdh3">${recruit.people}</h3></p>
		<p><h3 class="recruit_data">성별</h3><h3 class="recruit_data rdh3">${recruit.gender}</h3></p>
		<p><h3 class="recruit_data">연령</h3><h3 class="recruit_data rdh3">${recruit.age}</h3></p>
		<p><h3 class="recruit_data">학력</h3><h3 class="recruit_data rdh3">${recruit.school}</h3></p>
		<p><h3 class="recruit_data">우대</h3><h3 class="recruit_data rdh3">${recruit.special}</h3></p>
		</div>
		
		<div id="work_condition">
		<p><h1>근무조건</h1></p>
		<p><h3 class="recruit_data">급여</h3><h3 class="recruit_data rdh3">${recruit.salary}</h3></p>
		<p><h3 class="recruit_data">근무기간</h3><h3 class="recruit_data rdh3">${recruit.w_date}</h3></p>
		<p><h3 class="recruit_data">근무요일</h3><h3 class="recruit_data rdh3">${recruit.w_day}</h3></p>
		<p><h3 class="recruit_data">근무시간</h3><h3 class="recruit_data rdh3">${recruit.w_time}</h3></p>
		<p><h3 class="recruit_data">업직종</h3><h3 class="recruit_data rdh3">${recruit.job}</h3></p>
		<p><h3 class="recruit_data">고용형태</h3><h3 class="recruit_data rdh3">${recruit.work}</h3></p>
		</div>
		</div>
		
		<div id="rightbox">
		<input type="button" value="지원하기" id="applybtn">
		<div id="recruit_manager">
		<p><h1>채용담당자 정보</h1></p>
		<p><h3 class="recruit_data">담당자</h3><h3 class="recruit_data rdh3">${company.name}</h3></p>
		<p><h3 class="recruit_data">이메일</h3><h3 class="recruit_data rdh3">${company.eamil}</h3></p>
		<p><h3 class="recruit_data">전화</h3><h3 class="recruit_data rdh3">${company.phone}</h3></p>
		</div>
		</div>
		</div>
		
		<div id="viewtab">
		<div id="tablist">
		<ul><li>근무지역</li><li>상세모집요강</li><li>채용기업정보</li></ul>
		</div>
		
		<div id="area"><h2>근무지역</h2></div>
		<div id="notice"><h2>상세모집요강</h2></div>
		<div id="business_info"><h2>기업정보</h2></div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	<a href="../apply/applyInsert?recruit_num=${recruit.num}&id=${member.id}&cid=${recruit.id}">Apply</a>
	<a href="../scrap/scrapInsert?recruit_num=${recruit.num}&id=${member.id}&page=view">Scrap</a>
	<h1>${company.id}</h1>
	<h1>${company.name}</h1>
	<h1>${company.phone}</h1>
	<h1>${company.email}</h1>
	<h1>${company.addr}</h1>
	<h1>${company.c_name}</h1>
	<h1>${recruit.title}</h1>
	<h1>${recruit.people}</h1>
	<h1>${recruit.school}</h1>
	<h1>${recruit.special}</h1>
	<h1>${recruit.salary}</h1>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>