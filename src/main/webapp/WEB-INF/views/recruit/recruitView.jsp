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
	<div id="reg_num"><span><h4>${recruit.num}</h4></span></div><div id="func_btn"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png"><input type="button" value="스크랩" id="scrap_btn"></div>
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
	<div class="thumitem"></div>
	<div class="thumitem"></div>
	<div class="thumitem"></div>
	<div class="thumitem"></div>
	<div class="thumitem"></div>
	
	</div>
	</div>
	</div>
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