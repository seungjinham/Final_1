<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(".m_meun").mouseenter(function() {
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

<article id="meun_border">
	<div id="title">My Page</div>
	<div class="m_meun" id="m1">기업 정보</div>
	<div class="s_meun m1">
		<a href="../company/companyMyPage" id="s_m1">기업 정보 수정<span class="arrow">＞</span></a></div>
	<div class="s_meun m1">
		<a href="../company/companyDelete" id="s_m2">기업 삭제<span class="arrow">＞</span></a></div>
	<div class="m_meun" id="m2">채용 공고</div>
	<div class="s_meun m2"><a href="#" id="s_m3">채용공고 등록<span class="arrow">＞</span></a></div>
	<div class="s_meun m2"><a href="#" id="s_m4">채용공고 수정·삭제<span class="arrow">＞</span></a></div>
	<div class="m_meun" id="m3">
		<a href="#" id="m_m3">이력서 현황</a></div>
	<div class="m_meun" id="m4">
		<a href="#" id="m_m4">화상 면접</a>
	</div>
	<div class="m_meun" id="m5">파워링크</div>
	<div class="s_meun m5">
		<a href="#" id="s_m5">파워링크 등록하기</a><span class="arrow">＞</span>
	</div>
</article>
