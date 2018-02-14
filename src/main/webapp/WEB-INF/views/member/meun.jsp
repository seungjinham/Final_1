<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#m1").ready(function(){
			$(".m1").show("slow");
		});
		
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
	<div class="m_meun" id="m1">회원 정보</div>
	<div class="s_meun m1">회원 정보 수정</div>
	<div class="s_meun m1">회원 탈퇴</div>
	<div class="m_meun" id="m2">이력서</div>
	<div class="s_meun m2">이력서 등록</div>
	<div class="s_meun m2">이력서 수정·삭제</div>
	<div class="m_meun" id="m3">지원 공고</div>
	<div class="m_meun" id="m4">
		<a href="../scrap/scrapSelectList?id=${member.id}">스크랩보기</a>
	</div>
	<div class="m_meun" id="m5">판매자</div>
	<div class="s_meun m5">
		<a href="../sell/sellerWrite">판매자 등록하기</a>
	</div>
	<div class="s_meun m5">
		<a href="../sell/sellerView">판매자 정보보기</a>
	</div>
	<div class="s_meun m5">
		<a href="./PersonUse">거래내역</a>
	</div>
</article>
