<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="<%=request.getContextPath()%>/resources/css/common/header.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/common.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/common/footer.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/member/p_meun.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Paper Write</title>
<script type="text/javascript">
	$(function() {
		$("#m2").ready(function() {
			$(".m2").show("slow");

			$("#m1").css("color", "black");
			$("#m1").css("background-color", "white");
			$("#m1").css("font-weight", "bold");

			$("#m2").css("color", "white");
			$("#m2").css("background-color", "#23A41A");
			$("#m2").css("font-weight", "normal");

			$("#s_m3").css("color", "#23A41A");
			$("#s_m3").css("font-weight", "bold");
		});
	});
</script>
<style type="text/css">
#main2 {
	width: 1080px;
	height: 1500px;
}

#tit_border {
	width: 770px;
	height: 80px;
	float: left;
}

#tit {
	width: 700px;
	height: 80px;
	color: #23A41A;
	font-size: 37px;
	font-weight: bolder;
	letter-spacing: -1px;
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
	margin-left: 5px;
}

#paper_border {
	width: 770px;
	height: 1200px;
	border-top: 2px solid #23A41A;
	border-bottom: 2px solid #23A41A;
	float: left;
}

#p_tit_border {
	width: 100%;
	height: 150px;
	background-color: aqua;
	border-bottom: 2px solid #23A41A;
}

#p_tit_border_2 {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	box-sizing: border-box;
	padding-left: 10px;
	background-color: yellow;
	font-size: 21px;
	font-family: 'Malgun Gothic', '맑은 고딕', Dotum, '돋움', AppleGothic,
		sans-serif;
	font-weight: bold;
	letter-spacing: -1px;
	border-bottom: 1px dotted gray; 
	padding-top: 10px;
}

#p_tit_border_3 {
	width: 100%;
	height: 80px;
	margin: 0 auto;
	box-sizing: border-box;
	padding-left: 10px;
	background-color: lime;
}

#p_tit {
	width: 550px;
	height: 50px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 5px;
	padding-left: 10px;
	font-size: 16px;
	font-family: "맑은 고딕";
	letter-spacing: -1px;
	
}

#info_borders {
	width: 96%;
	height: 630px;
	padding: 40px;
	box-sizing: border-box;
	border: 1px solid #23A41A;
	margin: 0 auto;
}

#info_tit_border {
	width: 100%;
	height: 80px;
}

#info_tit_border_2 {
	width: 200px;
	height: 50px;
	box-sizing: border-box;
	font-size: 21px;
	font-family: 'Malgun Gothic', '맑은 고딕', Dotum, '돋움', AppleGothic,
		sans-serif;
	font-weight: bold;
	letter-spacing: -1px;
}

#p_photo {
	width: 130px;
	height: 160px;
	border: 1px solid #A9A9A9;
	float: left;
	margin-right: 30px;
}

.p_tit {
	display: block;
	left: 11px;
	font-size: 12px;
	padding-left: 15px;
	font-family: '맑은 고딕';
	color: #A9A9A9;
}

.name, .radio, .birth {
	width: 240px;
	height: 90px;
	float: left;
}

#p_name, #p_birth, #p_gender {
	margin-top: 10px;
	width: 200px;
	height: 35px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 5px;
	padding-left: 10px;
	font-size: 16px;
	font-family: "맑은 고딕";
	letter-spacing: -1px;
}

.working {
	float: left;
	width: 75px;
	height: 40px;
	text-align: center;
	font-size: 13px;
	font-family: "돋움";
	box-sizing: border-box;
	margin-top: 22px;
	border: 1px solid #A9A9A9;
	color: #A9A9A9;
	background-color: white;
	border-radius: 5px;
	margin-right: 3px;
}

.gender, .army {
	width: 100px;
	height: 90px;
	float: left;
}

#p_gender {
	margin-top: 10px;
	width: 70px;
	height: 35px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 5px;
	padding-left: 10px;
	font-size: 16px;
	font-family: "맑은 고딕";
	letter-spacing: -1px;
}

.p_army, .p_marry {
	float: left;
	width: 40px;
	height: 30px;
	text-align: center;
	font-size: 13px;
	font-family: "돋움";
	box-sizing: border-box;
	margin-top: 15px;
	border: 1px solid #A9A9A9;
	color: #A9A9A9;
	background-color: white;
	border-radius: 5px;
	margin-left: 10px;
}

.working:HOVER, .p_army:HOVER, .p_marry:HOVER {
	border: 2px solid gray;
	color: gray;
	font-weight: bold;
	cursor: pointer;
}

#border_1 {
	width: 100%;
	height: 200px;
}

.phone, .email, .addr, .addr_2, .marry, .hobby {
	width: 300px;
	height: 90px;
	float: left;
	padding-left: 24px;
}

#p_phone, #p_email, #p_addr, #p_addr_2, #p_hobby {
	margin-top: 10px;
	width: 260px;
	height: 35px;
	border: none;
	border-bottom: 1px solid gray;
	margin-left: 5px;
	padding-left: 10px;
	font-size: 16px;
	font-family: "맑은 고딕";
	letter-spacing: -1px;
}

.p_marry {
	float: left;
	width: 60px;
	height: 30px;
	text-align: center;
	font-size: 13px;
	font-family: "돋움";
	box-sizing: border-box;
	margin-top: 15px;
	border: 1px solid #A9A9A9;
	color: #A9A9A9;
	background-color: white;
	border-radius: 5px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>

	<section id="main">
		<div id="main2">
			<%@ include file="../member/p_meun.jsp"%>

			<div id="tit_border">
				<div id="tit">이력서 등록</div>
			</div>

			<form action="./paperInsert" method="post"
				enctype="multipart/form-data">
				<section id="paper_border">
					
					<div id="p_tit_border">
						<div id="p_tit_border_2">
							이력서 제목
						</div>
						<div id="p_tit_border_3">
							<input type="text" name="title" id="p_tit" placeholder="이력서 제목을 입력하세요. (50자 이내)">
						</div>
					</div>

					<article id="info_borders">
						<div id="info_tit_border">
							<div id="info_tit_border_2">기본 정보</div>
						</div>

						<div id="border_1">
							<div id="p_photo">
								<button>file</button>
							</div>
							<div class="name">
								<label for="p_name" class="p_tit">이름</label> <input type="text"
									id="p_name" value="스프링" name="name">
							</div>
							<div class="radio">
								<input type="button" class="working" value="구직준비중"> <input
									type="button" class="working" value="구직중"> <input
									type="button" class="working" value="재직중"> <input
									type="hidden" name="working" value="">
							</div>
							<div class="birth">
								<label for="p_birth" class="p_tit">생년월일</label> <input
									type="text" id="p_birth" value="1992.12.07" name="birth">
							</div>
							<c:if test="${member.gender eq 'M'}">
								<div class="gender">
									<label for="p_gender" class="p_tit">성별</label> <input
										type="text" id="p_gender" value="남">
								</div>
								<div class="army">
									<label for="p_army" class="p_tit">병역</label> <input
										type="button" class="p_army" value="미"> <input
										type="button" class="p_army" value="필"> <input
										type="hidden" name="army" value="">
								</div>
							</c:if>

							<c:if test="${member.gender eq 'W'}">
								<div class="gender" style="width: 270px;">
									<label for="p_gender" class="p_tit">성별</label> <input
										type="text" id="p_gender" value="여" style="width: 230px;">
								</div>
							</c:if>
						</div>
						<div class="marry">
							<label for="p_marry" class="p_tit">결혼 여부</label> <input
								type="button" class="p_marry" value="미혼"> <input
								type="button" class="p_marry" value="기혼"> <input
								type="hidden" name="marry" value="">
						</div>
						<div class="hobby">
							<label for="p_hobby" class="p_tit">취미</label> <input type="text"
								id="p_hobby" name="hobby">
						</div>
						<div class="phone">
							<label for="p_phone" class="p_tit">휴대폰</label> <input type="text"
								id="p_phone" value="스프링" name="phone">
						</div>
						<div class="email">
							<label for="p_email" class="p_tit">이메일</label> <input type="text"
								id="p_email" value="zico@naver.com" name="email">
						</div>
						<div class="addr">
							<label for="p_addr" class="p_tit">주소</label> <input type="text"
								id="p_addr" value="서울시 강남구">
						</div>
						<div class="addr_2">
							<label for="p_addr_2" class="p_tit">상세주소</label> <input
								type="text" id="p_addr_2" value="정보교육원 4층">
						</div>
					</article>
					
					<article id="school_border">
						<div id="school_border_2">
							
						</div>
					</article>

				</section>
			</form>

		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>