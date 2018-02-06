<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<header>
	<div id="header" class="">
		<div class="hgroup">
			<div class="inbox">
				<h1 class="logo"><a href="../"><span>PICK ME</span></a></h1>
				<div class="nvalinks">

					<c:if test="${empty member}">
						<a href="member/login">로그인</a>
						<a href="member/join">회원가입</a>
					</c:if>

					<c:if test="${not empty member}">
						<c:if test="${member.job eq 'P'}">
							<a href="./person/personMyPage">마이페이지</a>
						</c:if>
						<c:if test="${member.job eq 'C'}">
							<a href="./company/companyMyPage">마이페이지</a>
						</c:if>
						<a href="./member/memberLogOut">로그아웃</a>
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
							<li><a href="sell/sellerList?category=design">디자인</a></li>
							<li><a href="sell/sellerList?category=it">IT & 프로그래밍</a></li>
							<li><a href="sell/sellerList?category=translate">번역 & 통역</a></li>
						</ul>
					</li>
						
					<li><a href="javascript:void(0);" class="">개인서비스</a>
						<ul class="navi-sublist subnav03">
							<li><a href="">이력서 관리</a></li>
							<li><a href="">지원현황</a></li>
							<li><a href="">스크랩 공고정보</a></li>
							<li><a href="./person/personMyPage">회원정보 수정</a></li>
							<li><a href="">판매자 등록</a></li>
							<li><a href="">판매자 즐겨찾기</a></li>
							<li><a href="">거래 내역 관리</a></li>
						</ul>
					</li>
						
					<li><a href="javascript:void(0);" class="">기업서비스</a>
						<ul class="navi-sublist subnav03">
							<li><a href="company/companyRecruitList">게재중인 공고</a></li>
							<li><a href="">지원자 관리</a></li>
							<li><a href="company/companyRecruit">공고 등록하기</a></li>
							<li><a href="">파워링크 구매</a></li>
							<li><a href="">구매내역 관리</a></li>
							<li><a href="./company/companyMyPage">회원정보 수정</a></li>
						</ul>
					</li>
						
						
					<li><a href="javascript:void(0);" class="">고객센터</a>
						<ul class="navi-sublist subnav04">
							<li><a href="faq/faqList">FAQ</a></li>
							<li><a href="">문의하기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

</header>

