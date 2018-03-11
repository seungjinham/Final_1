<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/sell/sellerView.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//=============즐겨찾기=============
	if(${favorDTO} != null){
		$.get("favorInsert?id=${favorDTO.id}&seller=${favorDTO.seller}", function(data) {
			$(".favor").html(data);
		});
	}
	
	if(${favorDTO} == null) {
		$.get("favorDelete?id=${favorDTO.id}&seller=${favorDTO.seller}", function(data) {
			$(".favor").html(data);
		});
	}
	
	$(".favor").on("click", "#favor-btn", function() {
		var favor = $(this).attr("class");
		document.frm.submit();
		if (favor == "off") {
			$("#favor-btn").attr("class", "on");
		}else {
			$("#favor-btn").attr("class", "off");
		}
	});
	
	//=============옵션 hover=============
	$(".option-data").hover(function(e) {
		var classList = $(this)[0].classList;
		
		for(var i in classList) {
            if(typeof classList[i] == 'string' && (classList[i] == 'option0' || classList[i] == 'option1' || classList[i] == 'option2')) {
                $('.'+classList[i]).addClass('package-hover');
            }
            if(i == (classList.length-1)) break;
        }

	}, function(e){
        $('.option-data').removeClass('package-hover');
    });
});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
	<div class="contain">
		<div class="title-color">
			<b>[ 카테고리 >  
			<c:if test="${seller.category == 'design'}"> 디자인 </c:if> 
			<c:if test="${seller.category == 'it'}"> IT & 프로그래밍 </c:if> 
			<c:if test="${seller.category == 'translate'}"> 번역 & 통역 </c:if>
			]</b>
		</div>
		<div class="panel">
			<div class="panel-body">
				<div class="row">
					<img id="main-img" src="../resources/upload/${seller.oname}" title="${seller.title}">
					<span id="main-title">${seller.title}</span><br> 
					<span id="main-price">
						<b>₩ 35,000</b><span>~</span>
						<c:if test="${not empty member}">
							<div class="favor"></div>
						</c:if>
					</span>
					
				</div>
			</div>
		</div>

			<div id="packages">
				<h1 class="title-color"><b>가격정보</b></h1>
				<table class="table table-bordered package-table">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr class="package-price">
						<td class="option-title"></td>
						<td class="option-title">
							<span class="h4">STANDARD</span><br>
							<span class="h3"><b>₩&nbsp;35,000</b></span><br>
							<span class="h5">(VAT포함)</span>
						</td>
						<td class="option-title">
							<span class="h4">DELUXE</span><br> 
							<span class="h3"><b>₩&nbsp;300,000</b></span><br> 
							<span class="h5">(VAT포함)</span>
						</td>
						<td class="option-title">
							<span class="h4">PREMIUM</span><br>
							<span class="h3"><b>₩&nbsp;1,000,000</b></span><br> 
							<span class="h5">(VAT포함)</span>
						</td>
					</tr>

					<tr class="package-title package-font">
						<td class="option-title">패키지 설명</td>
						<td class="option0 option-data">
							<strong>이벤트 배너디자인</strong><br><br>
							이벤트 기획 및 배너제작 /800*1,000PX내
						</td>
						<td class="option1 option-data">
							<strong>기획형 상세페이지</strong><br><br>
							맞춤형 상세페이지 제작 /860*10,000PX내
						</td>
						<td class="option2 option-data">
							<strong>영상제작</strong><br><br>
							타이포그래픽 브랜드 및 제품 소개영상 (3분이내)
						</td>
					</tr>
					<tr class="package-font">
						<td class="option-title">시안개수</td>
						<td class="option0 option-data text-center">1</td>
						<td class="option1 option-data text-center">2</td>
						<td class="option2 option-data text-center">3</td>
					</tr>

					<tr class="package-font">
						<td class="option-title">수정 횟수</td>
						<td class="option0 option-data text-center">3</td>
						<td class="option1 option-data text-center">제한 없음</td>
						<td class="option2 option-data text-center">3</td>
					</tr>

					<tr class="package-font">
						<td class="option-title">작업 기간</td>
						<td class="option0 option-data text-center">3일</td>
						<td class="option1 option-data text-center">15일</td>
						<td class="option2 option-data text-center">30일</td>
					</tr>
					<tr>
						<td class="option-title"></td>
						<td class="option0 option-data">
							<button class="btn btn-block btn-brand"><b>구매</b></button>
						</td>
						<td class="option1 option-data">
							<button class="btn btn-block btn-brand"><b>구매</b></button>
						</td>
						<td class="option2 option-data">
							<button class="btn btn-block btn-brand"><b>구매</b></button>
						</td>
					</tr>
				</table>
			</div>
			<h1 class="title-color"><b>서비스 설명</b></h1>

			<div class="panel">
				<div class="panel-body">
					<div class="row">
						<p>안녕하세요?</p>
						<p>브랜딩&amp;마케팅전문 브랜드를만드는사람들 퍼스트클래스입니다.</p>
						<p>저희는 중견기업을 전문으로 프로젝트를 	진행하는 회사로 처음 ‘강원도를팝니다’라는 소상공인을 대상으로</p>
						<p>교육/패션/식품/뷰티/병원/앱/유명인 외에 대기업까지 다양한 클라이언트와 함께 성장하고 있습니다.</p>
						<p>그리고다양한 클라이언트와 소통하기 위해 최선을 다하고 있습니다.</p>
						<br>
						<p><img id="con-img" src="../resources/upload/${seller.oname}"></p>
					</div>
				</div>
			</div>

			<div id="asrule">
				<h1 class="title-color"><b>A/S 및 환불</b></h1>
				<div class="panel">
					<div class="panel-body">
						<div class="row">
							${seller.refund}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>