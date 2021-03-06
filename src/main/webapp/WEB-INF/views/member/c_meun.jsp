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
	<div class="m_meun" id="m1">기업 정보</div>
	<div class="s_meun m1">
		<a href="../company/companyMyPage" id="s_m1">기업 정보 수정<span
			class="arrow">＞</span></a>
	</div>
	<div class="s_meun m1">
		<a href="../company/companyMemberDel" id="s_m2">기업 삭제<span
			class="arrow">＞</span></a>
	</div>
	<div class="s_meun m1">
		<a href="../company/companyChangePw" id="s_m3">비밀번호 변경<span
			class="arrow">＞</span></a>
	</div>
	<div class="m_meun" id="m2">채용 공고</div>
	<div class="s_meun m2">
		<a href="../company/companyRecruit" id="s_m4">채용공고 등록<span class="arrow">＞</span></a>
	</div>
	<div class="s_meun m2">
		<a href="../company/companyRecruitList" id="s_m5">게재중인 공고<span class="arrow">＞</span></a>
	</div>
	<div class="m_meun" id="m3">
		<a href="../supporter/supporterList" id="m_m3">지원자 관리</a>
	</div>
	
</article>
