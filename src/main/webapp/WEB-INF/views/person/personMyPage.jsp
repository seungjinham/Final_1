<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Person MyPage</title>
<script type="text/javascript">


	$(function() {
		$(".m_meun").click(function() {
			$(this).css("color", "white");
			$(this).css("font-weight", "normal");
			$(this).css("background-color", "#23A41A");
			var id = $(this).attr("id");
			$("."+id).slideToggle("slow");
			
			$(".m_meun").each(function() {
				var i = $(this).attr("id");
				if(id != i){
					$("."+i).hide();
					$(this).css("color", "black");
					$(this).css("font-weight", "bold");
					$(this).css("background-color", "white");
				};
				
			});

		});
	});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#meun_border {
	width: 250px;
	float: left;
	background-color: lime;
}

#title {
	width: 230px;
	height: 60px;
	padding-top: 20px;
	padding-left: 20px;
	font-size: 30px;
	font-weight: bold;
	font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
	background-color: fuchsia;
	border-bottom: 1px dotted gray;
}

.m_meun {
	width: 230px;
	height: 43px;
	padding-top: 17px;
	padding-left: 20px;
	font-size: 17px;
	font-weight: bold;
	font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
	background-color: white;
	cursor: pointer;
	border-bottom: 1px dotted gray;
}

.icon {
	width: 20px;
	height: 20px;
	float: right;
	padding-right: 20px;
	padding-top: 4px;
}

.s_meun {
	width: 230px;
	height: 43px;
	padding-top: 17px;
	padding-left: 20px;
	font-size: 15px;
	font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
	background-color: white;
	cursor: pointer;
	border-bottom: 1px dotted gray;
	display: none;
	color: #23A41A;
}
</style>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main" style="width: 1100px; background-color: yellow;">
		<article id="meun_border">
			<div id="title">My Page</div>
			<div class="m_meun" id="m1">회원 정보</div>
			<div class="s_meun m1">회원 정보 수정</div>
			<div class="s_meun m1">회원 탈퇴</div>
			<div class="m_meun" id="m2">이력서</div>
			<div class="s_meun m2">이력서 등록</div>
			<div class="s_meun m2">이력서 수정·삭제</div>
			<div class="m_meun" id="m3">지원 공고</div>
			<div class="m_meun" id="m4">스크랩</div>
			<div class="m_meun" id="m5">판매자</div>
			<div class="s_meun m5" >판매자 등록</div>
			<div class="s_meun m5" >판매자 정보보기</div>
			<div class="s_meun m5" >거래 목록</div>
		</article>
		<form action="pseronMyPage" method="post">
			<p>
				ID : <input type="text" name="id" value="${member.id}"
					readonly="readonly">
			</p>
			<p>
				PW : <input type="text" name="pw" value="${member.pw}">
			</p>
			<p>
				NAME : <input type="text" name="name" value="${member.name}">
			</p>
			<p>
				EMAIL : <input type="text" name="email" value="${member.email}">
			</p>
			<p>
				PHONE : <input type="text" name="phone" value="${member.phone}">
			</p>
			<p>
				ADDR : <input type="text" name="addr" value="${member.addr}">
			</p>
			<p>
				BIRTH : <input type="text" name="birth" value="${member.birth}">
			</p>
			<p>
				GENDER :
				<c:if test="${member.gender eq 'M'}">
				M<input type="radio" checked="checked" value="M" name="gender">
				W<input type="radio" value="W" name="gender">
				</c:if>
				<c:if test="${member.gender eq 'W'}">
				M<input type="radio" value="M" name="gender">
				W<input type="radio" checked="checked" value="W" name="gender">
				</c:if>
			</p>
			<button>UPDATE</button>
		</form>
	</section>

	<%-- <hr>
	<h3>판매자</h3>
	<p><a href="../sell/sellerWrite">판매자 등록하기</a></p>
	<p><a href="../sell/sellerView">판매자 정보보기</a></p>
	<p><a href="./PersonUse">거래내역</a></p>
	
	<hr>
	<p><a href="../scrap/scrapSelectList?id=${member.id}">스크랩보기</a> --%>

</body>
</html>