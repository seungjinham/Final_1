<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitList.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="middle">
		<h1 class="h1">채용공고검색</h1>
			<div>
				<h2>빠른채용검색</h2>
			</div>
			<div id="search_area">
				<form id="form">
					<div id="searchbox">
						<fieldset class="common">
							<h3>지역</h3>
							<div id="area" class="boxcommon">지역을 선택하세요 (최대 2개 가능)</div>
						</fieldset>
						<fieldset class="common">
							<h3>직종-업종</h3>
							<div id="jobwork" class="boxcommon">직종-업종을 선택하세요 (최대 2개)</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무기간</h3>
							<div class="boxcommon">
								<input type="checkbox">1일 <input type="checkbox">1주일
								<input type="checkbox">1개월 <input type="checkbox">3개월
								<input type="checkbox">6개월 <input type="checkbox">1년이상
							</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무요일</h3>
							<div class="boxcommon">
								<input type="radio">주7일 월~일 <input type="radio">주6일
								월~토 <input type="radio">주5일 월~금 <input type="radio">주말
								토~일
							</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무시간</h3>
							<div class="boxcommon">
								<input type="checkbox">오전 <input type="checkbox">오후
								<input type="checkbox">저녁 <input type="checkbox">새벽
								<input type="checkbox">풀타임
							</div>
						</fieldset>
						<fieldset class="common genderage">
							<h3>성별</h3>
							<div class="boxcommon">
								<input type="radio">남자 &nbsp; <input type="radio">여자
								&nbsp; <input type="checkbox">무관
							</div>
						</fieldset>
						<fieldset class="common genderage">
							<h3>연령</h3>
							<div class="boxcommon">
								<input type="text" size="5">세&nbsp; <input
									type="checkbox">무관
							</div>
						</fieldset>
						<fieldset id="searchbtn">
							<div id="btngroup">
								<input type="button" value="검색" class="btn">&nbsp;&nbsp;&nbsp;<input
									type="button" value="초기화" class="btn">
							</div>
						</fieldset>
					</div>

				</form>
			</div>

			<div id="list_area">
				<div>
					<h2>채용공고리스트</h2>
				</div>
				<table id="list_table" class="table table-hover">
					<tr>
						<th>지역</th>
						<th>모집제목</th>
						<th>급여</th>
						<th>근무시간</th>
						<th>마감기한</th>
					</tr>
					<c:forEach var="item" items="${totallist}">
						<tr>
							<td>${item.addr}</td>
							<td>
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.c_name}</a></p>
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.title}</a></p>
							</td>
							<td>${item.salary}</td>
							<td>${item.w_time}</td>
							<td>${item.deadline}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>