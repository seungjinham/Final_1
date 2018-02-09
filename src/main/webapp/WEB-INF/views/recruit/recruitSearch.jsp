<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitSearch.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- <div id="header"></div>header div -->
<%@ include file="../temp/header1.jsp" %>
<div id="leftwing">
</div>

<div id="rightwing">
<ul>
<li><a href="<%=request.getContextPath()%>/scrap/scrapSelectList?id=${member.id}">스크랩 보기</a></li>
<li><a href="<%=request.getContextPath()%>/apply/applySelectList?id=${member.id}">지원한 이력서 보기</a></li>
</ul>

<ul>
<li><a href="#">FAQ</a></li>
<li><a href="#">파워링크</a></li>
</ul>

<p><a href="#">임시<img/></a></p>
</div>

<div id="container">

<!-- top -->
<div id="top">
<div class="ad"></div>
<div class="ad"></div>
<div class="ad"></div>
<div class="ad"></div>
<div class="ad"></div>
</div>

<!-- contentsbg -->
<div id="contentsbg">
<!-- leftbox -->
<div id="leftbox">
<h2>채용정보</h2>
<div id="leftmenu"></div>
<div id="leftad"></div>
</div>
<!-- contentsbox -->
<div id="contentsbox">

<div id="pagetop"><h3>상세검색</h3></div>

<form id="form">
<div id="searchbox">
<fieldset class="common"><h3>지역</h3><div id="area">지역을 선택하세요 (최대 2개 가능)</div></fieldset>
<fieldset class="common"><h3>직종-업종</h3><div id="jobwork">직종-업종을 선택하세요 (최대 2개)</div></fieldset>
<fieldset class="common"><h3>근무기간</h3>
<input type="checkbox">1일
<input type="checkbox">1주일
<input type="checkbox">1개월
<input type="checkbox">3개월
<input type="checkbox">6개월
<input type="checkbox">1년이상
</fieldset>
<fieldset class="common"><h3>근무요일</h3>
<input type="radio">주7일 월~일
<input type="radio">주6일 월~토
<input type="radio">주5일 월~금
<input type="radio">주말 토~일
</fieldset>
<fieldset class="common"><h3>근무시간</h3>
<input type="checkbox">오전
<input type="checkbox">오후
<input type="checkbox">저녁
<input type="checkbox">새벽
<input type="checkbox">풀타임
</fieldset>
<fieldset class="common"><h3>급여</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio">시급 &nbsp;
<input type="radio">일급 &nbsp;
<input type="radio">주급&nbsp;
<input type="radio">월급 &nbsp;
<input type="radio">연봉 &nbsp;
</fieldset>
<fieldset class="common"><h3>성별</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio">남자 &nbsp;
<input type="radio">여자 &nbsp;
<input type="checkbox">무관
</fieldset>
<fieldset class="common"><h3>연령</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" size="5">세&nbsp;
<input type="checkbox">무관</fieldset>
<fieldset class="common" id="school"><h3>학력</h3>
&nbsp;&nbsp;&nbsp;
&nbsp;<input type="checkbox">초등학교졸업
&nbsp;<input type="checkbox">중학교졸업
&nbsp;<input type="checkbox">고등학교졸업
&nbsp;<input type="checkbox">전문대졸업
&nbsp;<input type="checkbox">4년제졸업<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<input type="checkbox">대학원졸업
&nbsp;<input type="checkbox">대학교재학
&nbsp;<input type="checkbox">대학교휴학
</fieldset>
<fieldset class="common"><h3>우대조건</h3><div id="special">우대사항을 선택하세요 (최대 2개 가능)</div></fieldset>
<fieldset class="common"><h3>키워드</h3>
&nbsp;&nbsp;
<input type="text" size="40" style="width:200px; height:20px;">&nbsp;
<input type="checkbox">회사명&nbsp;
<input type="checkbox">채용제목</fieldset>
<fieldset id="searchbtn">
<div id="btngroup">
<input type="button" value="검색">&nbsp;&nbsp;&nbsp;<input type="button" value="초기화">
</div>
</fieldset>
</div>

</form>
</div>
</div>

</div><!-- container div -->



<!-- <div id="footer"></div>footer div -->
<%@ include file="../temp/footer.jsp"%>
</div>wrap div
</body>
</html>