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
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
	<div id="recruit_info">
	<div id="registration_info">
	<div id="reg_num"><span><h4>${recruit.num}</h4></span></div><div id="func_btn"><div id="scrap_wrap"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png"><input type="button" value="스크랩" id="scrap_btn"></div></div>
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
							<div class="circle"><span>test</span></div>
							<div class="char">3620155</div>
						</div>
						<div class="thumitem">
							<div class="circle"></div>
							<div class="char"></div>
						</div>

						<div class="thumitem">
							<div class="calendar"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/calendar.PNG"></div>
							<div class="char"></div>
						</div>

						<div class="thumitem">
							<div class="clock"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/clock.PNG"></div>
							<div class="char"></div>
						</div>

						<div class="thumitem">
							<div class="circle"></div>
							<div class="char"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="condition_info">
		<div id="leftbox">
		<div id="recruit_condition">
		<p><h1>모집조건</h1></p>
		<p><h3 class="recruit_data">마감일</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h3 class="recruit_data">2018-05-05</h3></p>
		<p><h3 class="recruit_data">인원</h3><h3 class="recruit_data rdh3">5명</h3></p>
		<p><h3 class="recruit_data">성별</h3><h3 class="recruit_data rdh3">남자</h3></p>
		<p><h3 class="recruit_data">연령</h3><h3 class="recruit_data rdh3">25세~45세</h3></p>
		<p><h3 class="recruit_data">학력</h3><h3 class="recruit_data rdh3">무관</h3></p>
		<p><h3 class="recruit_data">우대</h3><h3 class="recruit_data rdh3">군필자</h3></p>
		</div>
		<div id="work_condition">
		<p><h1>근무조건</h1></p>
		<p><h3 class="recruit_data">급여</h3><h3 class="recruit_data rdh3">월급 3,400,000</h3></p>
		<p><h3 class="recruit_data">근무기간</h3><h3 class="recruit_data rdh3">6개월~1년</h3></p>
		<p><h3 class="recruit_data">근무요일</h3><h3 class="recruit_data rdh3">주6일</h3></p>
		<p><h3 class="recruit_data">근무시간</h3><h3 class="recruit_data rdh3">11:00~22:00</h3></p>
		<p><h3 class="recruit_data">업직종</h3><h3 class="recruit_data rdh3">외식</h3></p>
		<p><h3 class="recruit_data">고용형태</h3><h3 class="recruit_data rdh3">정규직</h3></p>
		</div>
		</div>
		<div id="rightbox"></div>
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