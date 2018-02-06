<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navigation a").hover(
			function () {
				$(this).addClass('on');
				$("#header").addClass('on');
			},
			function () {
				$(this).removeClass('on');
			}
		);
		$(".navi-sublist").hover(
			function () {$(this).prev().addClass('on');},
			function () {$(this).prev().removeClass('on');}
		);
		$(".navigation a").mouseover(function () {
			$(".nav-sub-wrap, .navi-sublist").addClass('on');
		});
		$("#header").mouseleave(function () {
			$("#header").removeClass('on');
			$(".nav-sub-wrap, .navi-sublist").removeClass('on');
		});
		$(".navi-sublist li a").hover(function () {$(this).removeClass('on');});

		$('body').on('focus', '.navigation a', function(e) {
			$("#header").addClass('on');
			$(".nav-sub-wrap, .navi-sublist").addClass('on');
		});
	});
</script>
</head>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<body>
<header>
	<div id="header" class="">
		<div class="hgroup">
			<div class="inbox">
				<h1 class="logo">
					<a href="<%=request.getContextPath()%>">
						<img src="/f1/resources/images/common/logo.jpg" width="150px" height="80px">
					</a>
				</h1>
				<div class="nvalinks">

					<c:if test="${empty member}">
						<a href="<%=request.getContextPath()%>/member/login">로그인</a>
						<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
					</c:if>

					<c:if test="${not empty member}">
						<c:if test="${member.job eq 'P'}">
							<a href="<%=request.getContextPath()%>/person/personMyPage">마이페이지</a>
						</c:if>
						<c:if test="${member.job eq 'C'}">
							<a href="<%=request.getContextPath()%>/company/companyMyPage">마이페이지</a>
						</c:if>
						<a href="<%=request.getContextPath()%>/member/memberLogOut">로그아웃</a>
					</c:if>
				</div>

				<ul class="navigation">
					<li><a href="javascript:void(0);" class="">채용정보</a>
						<ul class="navi-sublist subnav01">
							<li><a href="recruit/recruitList">공고 검색</a></li>
						</ul>
					</li>
						
					<li><a href="javascript:void(0);" class="">재능마켓</a>
						<ul class="navi-sublist subnav02">
							<li><a href="<%=request.getContextPath()%>/sell/sellerList?category=design">디자인</a></li>
							<li><a href="<%=request.getContextPath()%>/sell/sellerList?category=it">IT & 프로그래밍</a></li>
							<li><a href="<%=request.getContextPath()%>/sell/sellerList?category=translate">번역 & 통역</a></li>
						</ul>
					</li>
						
					<li><a href="javascript:void(0);" class="">개인서비스</a>
						<ul class="navi-sublist subnav03">
							<li><a href="">이력서 관리</a></li>
							<li><a href="">지원현황</a></li>
							<li><a href="">스크랩 공고정보</a></li>
							<li><a href="<%=request.getContextPath()%>/person/personMyPage">회원정보 수정</a></li>
							<li><a href="<%=request.getContextPath()%>/sell/sellerWrite">판매자 등록</a></li>
							<li><a href="">판매자 즐겨찾기</a></li>
							<li><a href="">거래 내역 관리</a></li>
						</ul>
					</li>
						
					<li><a href="javascript:void(0);" class="">기업서비스</a>
						<ul class="navi-sublist subnav03">
							<li><a href="">게재중인 공고</a></li>
							<li><a href="">지원자 관리</a></li>
							<li><a href="<%=request.getContextPath()%>/company/companyRecruit">공고 등록하기</a></li>
							<li><a href="">파워링크 구매</a></li>
							<li><a href="">구매내역 관리</a></li>
							<li><a href="<%=request.getContextPath()%>/company/companyMyPage">회원정보 수정</a></li>
						</ul>
					</li>
						
						
					<li><a href="javascript:void(0);" class="">고객센터</a>
						<ul class="navi-sublist subnav04">
							<li><a href="<%=request.getContextPath()%>/faq/faqList">FAQ</a></li>
							<li><a href="<%=request.getContextPath()%>/talk/talkForm">문의하기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

</header>
</body>
</html>