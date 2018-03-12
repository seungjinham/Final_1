<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/member/p_meun.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerWrite.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//메뉴설정
		$("#m5").ready(function() {
			$(".m5").show("slow");

			$("#m1").css("color", "black");
			$("#m1").css("background-color", "white");
			$("#m1").css("font-weight", "bold");

			$("#m5").css("color", "white");
			$("#m5").css("background-color", "#23A41A");
			$("#m5").css("font-weight", "normal");

			$("#s_m8").css("color", "#23A41A");
			$("#s_m8").css("font-weight", "bold");
		});
		
		//================== 프로필 사진 등록/삭제 ==================
		//메인사진 등록
		$(function() {
			$("#file").on('change', function() {
				readURL(this);
				$("#blah").show();
				$("#file_label").text("사진 변경");
			});
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			};
		};
		
		//원본파일(STANDARD 패키지) 제공여부
		$(".original").click(function() {
			var original = $(this).val();
			$("#org").val(original);
			$("#org").val();
		});
		
		$("#yes").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#no").css("color", "#A9A9A9");
			$("#no").css("border", "1px solid #A9A9A9");
			$("#no").css("font-weight", "normal");
		});
		$("#no").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#yes").css("color", "#A9A9A9");
			$("#yes").css("border", "1px solid #A9A9A9");
			$("#yes").css("font-weight", "normal");
		});
		
		//DELUXE 패키지 제공여부
		$(".original").click(function() {
			var original = $(this).val();
			$("#org1").val(original);
			$("#org1").val();
		});
		
		$("#yes1").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#no1").css("color", "#A9A9A9");
			$("#no1").css("border", "1px solid #A9A9A9");
			$("#no1").css("font-weight", "normal");
		});
		$("#no1").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#yes1").css("color", "#A9A9A9");
			$("#yes1").css("border", "1px solid #A9A9A9");
			$("#yes1").css("font-weight", "normal");
		});
		
		//PREMIUM 패키지 제공여부
		$(".original").click(function() {
			var original = $(this).val();
			$("#org2").val(original);
			$("#org2").val();
		});
		
		$("#yes2").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#no2").css("color", "#A9A9A9");
			$("#no2").css("border", "1px solid #A9A9A9");
			$("#no2").css("font-weight", "normal");
		});
		$("#no2").click(function() {
			$(this).css("color", "#23A41A");
			$(this).css("border", "2px solid #23A41A");
			$(this).css("font-weight", "bold");
			$("#yes2").css("color", "#A9A9A9");
			$("#yes2").css("border", "1px solid #A9A9A9");
			$("#yes2").css("font-weight", "normal");
		});
	
	});

	//================== smart_editor ==================
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "service_contents",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#save").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["service_contents"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#frm").submit();
		});
	});
</script>
<style type="text/css">
.textarea_border {
	float: left;
	width: 740px;
	box-sizing: border-box;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 30px;
	border-bottom: 1px dotted gray;
}

.labels{
	padding-bottom: 20px;
	padding-left: 0px;
}

#service_contents {
	width: 680px;
	height: 300px;
}

#refund_border{
	float: left;
	width: 740px;
	box-sizing: border-box;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 30px;
	border-bottom: 1px dotted gray;
}
#refund_contents{
	width: 680px;
	height: 150px;
}
</style>
<body>
	<%@ include file="../temp/header1.jsp" %>
	<section id="main">
		<div class="main2">
			<%@ include file="../member/p_meun.jsp"%>
			<div id="tit_border">
				<div id="tit">판매자 정보</div>
			</div>
			<c:if test="${not empty seller.category}">
				<form id="frm" name="frm" action="sellerUpdate" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">
				<section id="paper_border">
					<div id="p_tit_border">
						<div id="p_tit_border_2">제목</div>
						<div id="p_tit_border_3">
							<input type="text" name="title" id="p_tit" value="${seller.title}">
						</div>
					</div>

					<article id="info_borders">
						<div class="p_meun_border">
							<div class="p_meun_border_2">판매자 정보</div>
						</div>
						<div id="border_1">
							<div id="photo_border">
								<div id="img_border">
									<img id="blah" src="#" alt="your image" style="display: none;">
								</div>
								<label for="file" id="file_label">사진 등록</label>
								<input type='file' id="file" name="file">
							</div>

							<div class="name">
								<label for="p_name" class="p_tit">이름</label>
								<input type="text" id="p_name" value="${member.name}" name="name" value="${seller.name}">
								<label 	for="p_phone" class="p_tit">전화번호</label>
									<input type="text"
									id="p_phone" value="${member.phone}" name="phone"> <label
									for="p_email" class="p_tit">이메일</label> <input type="text"
									id="p_email" value="${member.email}" name="email">
							</div>
						</div>
					</article>


					<!-- STANDARD -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">STANDARD 패키지</div>
					</div>

					<article class="box_border">
						<div class="Decision_border">
							<label for="s_name" class="p_tit">패키지 명</label> <input
								type="text" name="name" class="Decision" value="${seller.sellOption[0].name}">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">패키지 내용</label> <input
								type="text" name="contents" class="Decision" value="${seller.sellOption[0].contents}">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">가격</label> <input type="text"
								name="price" class="Decision" value="${seller.sellOption[0].price}">
						</div>
						<div class="Decision_border">
							<label for="original" class="p_tit">원본파일 제공여부</label>
							<div class="radio">
								<input type="button" class="original" value="제공" id="yes">
								<input type="button" class="original" value="제공하지 않음" id="no">
								<input type="hidden" name="original" value="" id="org">
							</div>
						</div>
						<div class="Decision_border">
							<label for="work_modify" class="p_tit">수정 횟수</label> <input
								type="text" name="work_modify" class="Decision" value="${seller.sellOption[0].work_modify}">
						</div>
						<div class="Decision_border">
							<label for="work_date" class="p_tit">작업 기간</label> <input
								type="text" name="work_date" class="Decision" value="${seller.sellOption[0].work_date}">
						</div>
					</article>


					<!-- DELUXE -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">DELUXE 패키지</div>
					</div>

					<article class="box_border">
						<div class="Decision_border">
							<label for="s_name" class="p_tit">패키지 명</label> <input
								type="text" name="name" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">패키지 내용</label> <input
								type="text" name="contents" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">가격</label> <input type="text"
								name="price" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="original" class="p_tit">원본파일 제공여부</label>
							<div class="radio">
								<input type="button" class="original" value="제공" id="yes1">
								<input type="button" class="original" value="제공하지 않음" id="no1">
								<input type="hidden" name="original" value="" id="org1">
							</div>
						</div>
						<div class="Decision_border">
							<label for="work_modify" class="p_tit">수정 횟수</label> <input
								type="text" name="work_modify" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="work_date" class="p_tit">작업 기간</label> <input
								type="text" name="work_date" class="Decision" value="">
						</div>
					</article>

					<!-- PREMIUM -->
					<div class="p_meun_border f_left">
						<div class="p_meun_border_2">PREMIUM 패키지</div>
					</div>

					<article class="box_border">
						<div class="Decision_border">
							<label for="s_name" class="p_tit">패키지 명</label> <input
								type="text" name="name" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">패키지 내용</label> <input
								type="text" name="contents" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="contents" class="p_tit">가격</label> <input type="text"
								name="price" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="original" class="p_tit">원본파일 제공여부</label>
							<div class="radio">
								<input type="button" class="original" value="제공" id="yes2">
								<input type="button" class="original" value="제공하지 않음" id="no2">
								<input type="hidden" name="original" value="" id="org2">
							</div>
						</div>
						<div class="Decision_border">
							<label for="work_modify" class="p_tit">수정 횟수</label> <input
								type="text" name="work_modify" class="Decision" value="">
						</div>
						<div class="Decision_border">
							<label for="work_date" class="p_tit">작업 기간</label> <input
								type="text" name="work_date" class="Decision" value="">
						</div>
					</article>

					<div class="textarea_border">
						<label for="service_contents" class="p_tit labels">서비스 설명</label>
						<textarea name="contents" id="service_contents">${seller.contents}</textarea>
					</div>
					
					<div class="textarea_border">
						<label for="refund" class="p_tit labels">A/S 및 환불</label>
						<textarea name="refund" id="refund_contents">${seller.refund}</textarea>
					</div>

				</section>
				
				<div id="insert_btn_border">
					<div id="insert_btn">
					<input type="button" value="등록" id="btn">
					</div>
				</div>
			</form>
			</c:if>
			<c:if test="${empty seller.category}">
				<div id="plus_border">
					<a href="./sellerWrite"><button id="plus">판매자 등록</button></a>
				</div>
			</c:if>
		</div>
	</section>
</body>
</html>