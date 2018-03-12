<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$(".m_meun").mouseenter(function() {
			$(this).css("color", "white");
			$(this).css("font-weight", "normal");
			$(this).css("background-color", "#23A41A");
			var id = $(this).attr("id");
			$("." + id).slideToggle("slow");

			$(".m_meun").each(function() {
				var i = $(this).attr("id");
				if (id != i) {
					$("." + i).hide();
					$(this).css("color", "black");
					$(this).css("font-weight", "bold");
					$(this).css("background-color", "white");
				}
				;
			});
		});

	});
</script>

<article id="meun_border">
	<div id="title">My Page</div>

	<div class="m_meun" id="m1">내 정보</div>
	<div class="s_meun m1">
		<a href="../person/personMyPage" id="s_m1">내 정보 수정<span
			class="arrow">＞</span></a>
	</div>
	<div class="s_meun m1">
		<a href="../person/personDelete" id="s_m2">회원 탈퇴<span
			class="arrow">＞</span></a>
	</div>
	<div class="s_meun m1">
		<a href="../person/personChangePw" id="s_m3">비밀번호 변경<span
			class="arrow">＞</span></a>
	</div>

	<div class="m_meun" id="m2">나의 이력서</div>
	<div class="s_meun m2">
		<a href="../paper/paperInsert" id="s_m4">이력서 등록<span class="arrow">＞</span></a>
	</div>
	<div class="s_meun m2">
		<a href="../paper/paperList?id=${member.id}" id="s_m5">나의 이력서 관리<span class="arrow">＞</span></a>
	</div>

	<div class="m_meun" id="m3">
		<a href="../apply/applySelectList?id=${member.id}" id="m_m3">나의 지원내역</a>
	</div>

	<div class="m_meun" id="m4">스크랩 & 즐겨찾기</div>
	<div class="s_meun m4"> 
		<a href="../scrap/scrapSelectList?id=${member.id}" id="s_m6">스크랩 공고<span class="arrow">＞</span></a>
	</div>
	<div class="s_meun m4">
		<a href="../sell/favorList" id="s_m7">판매자 즐겨찾기<span class="arrow">＞</span></a>
	</div>

	<div class="m_meun" id="m5">판매자 관리</div>
	<div class="s_meun m5">
		<a href="../sell/sellerWrite" id="s_m8">판매자 등록하기<span
			class="arrow">＞</span></a>
	</div>
	<div class="s_meun m5">
		<a href="../sell/sellerUpdate" id="s_m9">판매자 정보<span class="arrow">＞</span></a>
	</div>
	<div class="s_meun m5">
		<a href="./PersonUse" id="s_m10">나의 거래내역<span class="arrow">＞</span></a>
	</div>
</article>
