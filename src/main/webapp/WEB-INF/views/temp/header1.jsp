<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		

		$("#login").click(function() {
				window.open("<%=request.getContextPath()%>/member/login", "", "top=250,left=750,width=350,height=450");
		});
		
		var message = '${message}';
		if(message!="") {
			alert(message);
		}
	});
</script>
<header>
	<!--  header 시작 -->
	<div id="header" class="">
		<div class="hgroup">
				<div class="inbox">
					<h1 class="logo">
						<a href="<%=request.getContextPath()%>" id="logo_img">
							<img src="/f1/resources/images/common/footer_logo.png" width="40px" height="40px">
							<span id="logo_letter">P!CK ME</span>
						</a>
					</h1>
					<div class="nvalinks">
						<ul class="member_menu">
							<c:if test="${empty member}">
								<li><a href="#" target="_self" class="btn_link" id="login">로그인</a></li>
								<li><a href="<%=request.getContextPath()%>/member/join" target="_self" class="btn_link">회원가입</a></li>
							</c:if>

							<c:if test="${not empty member}">
								<li>
									<c:if test="${member.job eq 'P'}">
										<a href="<%=request.getContextPath()%>/person/personMyPage" target="_self" class="btn_link">마이페이지</a>
									</c:if> <c:if test="${member.job eq 'C'}">
										<a href="<%=request.getContextPath()%>/company/companyMyPage" target="_self" class="btn_link">마이페이지</a>
									</c:if>
								</li>
								<li><a href="<%=request.getContextPath()%>/member/memberLogOut" target="_self" class="btn_link">로그아웃</a><li>
							</c:if>
						</ul>
					</div>

 					<ul class="navigation">
 						<li><a href="javascript:void(0);" class="">채용정보</a>
							<ul class="navi-sublist subnav01">
								<%-- <li><a href="<%=request.getContextPath()%>/recruit/Search">공고 검색</a></li> --%>
								<li><a href="<%=request.getContextPath()%>/recruit/recruitList">채용 공고 검색</a></li>
								<li><a href="<%=request.getContextPath()%>/recruit/recruitSearch">상세 검색</a></li>
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
								<li><a href="<%=request.getContextPath()%>/person/personMyPage">회원정보수정</a></li>
								<li><a href="">이력서 관리</a></li>
								<li><a href="<%=request.getContextPath()%>/apply/applySelectList?id=${member.id}">지원현황</a></li>
								<li><a href="<%=request.getContextPath()%>/scrap/scrapSelectList?id=${member.id}">공고 즐겨찾기</a></li>
								<li><a href="<%=request.getContextPath()%>/sell/sellerWrite">판매자 등록</a></li>
								<li><a href="#">거래 내역 관리</a></li>
								<li><a href="#">판매자 즐겨찾기</a></li>
							</ul>
						</li>

						<li><a href="javascript:void(0);" class="">기업서비스</a>
							<ul class="navi-sublist subnav03">
								<li><a href="<%=request.getContextPath()%>/company/companyMyPage">회원정보수정</a></li>
								<li><a href="<%=request.getContextPath()%>/company/companyRecruit">공고 등록하기</a></li>
								<li><a href="<%=request.getContextPath()%>/company/companyRecruitList">게재중인 공고</a></li>
								<li><a href="<%=request.getContextPath()%>/supporter/supporterList">지원자 관리</a></li>
								<%-- <li><a href="<%=request.getContextPath()%>/use/powerBuy">파워링크 구매</a></li>
								<li><a href="#">구매내역 관리</a></li> --%>
							</ul>
						</li>


						<li><a href="javascript:void(0);" class="">고객센터</a>
							<ul class="navi-sublist subnav04">
								<li><a href="<%=request.getContextPath()%>/faq/faqList">자주묻는 질문</a></li>
								<li><a href="<%=request.getContextPath()%>/qna/qnaWrite">문의하기</a></li>
								<c:if test="${member.id == 'admin'}">
									<li><a href="<%=request.getContextPath()%>/qna/qnaList">문의리스트</a></li>
								</c:if>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		<div class="nav-sub-wrap"></div>
	</div>
	
</header>