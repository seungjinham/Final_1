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
</head>
<body>
	<%@ include file="../temp/header1.jsp" %>
	<section id="main">
		<div class="container">
			<div class="row">
			<div class="col-xs-8 margin-top-40 padding-left-0 gig-detail-left-side-width">
				<div id="overview">
					<h6 class="font-color-lighter margin-top-0 margin-bottom-10">
						<a class="plain font-color-lighter sendGAEventClz" href="sellerList?category=${seller.category}" data-name="breadcrumb - 상위 카테고리">
							<c:if test="${seller.category == 'design'}">디자인	</c:if>
							<c:if test="${seller.category == 'it'}">IT & 프로그래밍</c:if>
							<c:if test="${seller.category == 'translate'}">번역 & 통역</c:if>
						</a>&nbsp;
					</h6>
					<div class="border-solid border-bottom-none bg-color-white position-relative" style="height: 488px; width: 670px;">
						<img class="gig-detail-main-image" src="" alt="메인이미지" title="${seller.title}">
					</div>
					<div class="panel panel-default margin-all-0 border-radius-bottom">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12">
									<h3 class="margin-top-0 line-height NGM">${seller.title}</h3>
								</div>
							</div>
							<div class="row margin-top-10">
								<div class="col-xs-6">
									<div id="bookmarkBtn" class="inline-block gig-detail-bookmark-active sendGAEventClz" data-name="찜하기 버튼 클릭">
										<i class="fa fa-heart-o font-color-lighter font-size-h3"></i>
										<i class="fa fa-heart color-red pulse font-size-h3" style="display: none;"></i>
									</div>
								</div>
								<div class="col-xs-6 text-right">
									<h3 class="margin-top-0 margin-bottom-0 NGB">
										<b>₩ 35,000</b> <span class="font-color-light font-size-h6">부터</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="packages" class="margin-top-30" style="">
					<h4><b>가격정보</b></h4>
					<table class="table table-bordered table-hover-vertical package-table">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>

						<tbody>
							<tr class="package-price">
								<td class="package-option-title"></td>
								<td class="package-option-title text-center position-relative">
									<div class="package-title-arrow">
										<span class="font-color-light card-font-size-default">STANDARD</span><br>
										<span class="font-size-h3 font-color-base"><b>₩&nbsp;35,000</b></span><br>
										<span class="card-font-size-small font-color-lighter">(VAT포함)</span>
									</div>
								</td>
								<td class="package-option-title text-center position-relative">
									<div class="package-title-arrow">
										<span class="font-color-light card-font-size-default">DELUXE</span><br>
										<span class="font-size-h3 font-color-base"><b>₩&nbsp;300,000</b></span><br> 
										<span class="card-font-size-small font-color-lighter">(VAT포함)</span>
									</div>
								</td>
								<td class="package-option-title text-center position-relative">
									<div class="package-title-arrow">
										<span class="font-color-light card-font-size-default">PREMIUM</span><br>
										<span class="font-size-h3 font-color-base"><b>₩&nbsp;1,000,000</b></span><br> 
										<span class="card-font-size-small font-color-lighter">(VAT포함)</span>
									</div>
								</td>
							</tr>

							<tr class="package-title">
								<td class="package-option-title" rowspan="2">패키지 설명</td>
								<td class="package-option-0 package-option-data vertical-align-top">
									<h5 class="word-break" style="line-height: 1.5">
										<strong>이벤트 배너디자인</strong>
									</h5>
								</td>
								<td class="package-option-1 package-option-data vertical-align-top">
									<h5 class="word-break" style="line-height: 1.5">
										<strong>기획형 상세페이지</strong>
									</h5>
								</td>
								<td class="package-option-2 package-option-data vertical-align-top">
									<h5 class="word-break" style="line-height: 1.5">
										<strong>영상제작</strong>
									</h5>
								</td>
							</tr>
							<tr class="package-description">
								<td class="package-option-0 package-option-data vertical-align-top word-break">
									이벤트 기획 및 배너제작 (의뢰 전 상담필수)/800*1,000PX내
								</td>
								<td class="package-option-1 package-option-data vertical-align-top word-break">
									맞춤형 상세페이지 제작 (의뢰 전 상담필수)/860*10,000PX내</td>
								<td class="package-option-2 package-option-data vertical-align-top word-break">
									타이포그래픽 브랜드 및 제품 소개영상 (3분이내) (의뢰 전 상담필수)</td>
							</tr>

							<tr class="package-options">
								<td class="package-option-title">
									<div data-toggle="tooltip" data-placement="right" data-title="기본 제공되는 시안의 개수입니다." data-original-title="" title="">시안개수</div>
								</td>
								<td class="package-option-0 package-option-data text-center">
									<div><span>1</span></div>
								</td>
								<td class="package-option-1 package-option-data text-center">
									<div><span>1</span></div>
								</td>
								<td class="package-option-2 package-option-data text-center">
									<div><span>-</span></div>
								</td>
							</tr>

							<tr class="package-revisions">
								<td class="package-option-title">수정 횟수</td>
								<td class="package-option-0 package-option-data text-center">
									<span>3</span>
								</td>
								<td class="package-option-1 package-option-data text-center">
									<span>제한 없음</span>
								</td>
								<td class="package-option-2 package-option-data text-center">
									<span>3</span>
								</td>
							</tr>

							<tr class="package-delivery">
								<td class="package-option-title">작업 기간</td>
								<td class="package-option-0 package-option-data">
									<div class="text-center">3 일</div>
								</td>
								<td class="package-option-1 package-option-data">
									<div class="text-center">15 일</div>
								</td>
								<td class="package-option-2 package-option-data">
									<div class="text-center">30 일</div>
								</td>
							</tr>
							<tr>
								<td class="package-option-title"></td>
								<td class="package-option-0 package-option-data" data-index="0">
									<button
										class="btn btn-block btn-brand-yellow  padding-left-10 padding-right-10 sendGAEventClz"
										onclick="sendGAEvent('clickEvent', 'gigDetail', '구매하기 - 패키지 테이블');"
										id="packageSTANDARDOrderBtn"
										data-name="패키지 테이블 구매하기 - STANDARD">
										<b>구매</b>
									</button>
								</td>
								<td class="package-option-1 package-option-data" data-index="1">
									<button
										class="btn btn-block btn-brand-yellow  padding-left-10 padding-right-10 sendGAEventClz"
										onclick="sendGAEvent('clickEvent', 'gigDetail', '구매하기 - 패키지 테이블');"
										id="packageDELUXEOrderBtn" data-name="패키지 테이블 구매하기 - DELUXE">
										<b>구매</b>
									</button>
								</td>
								<td class="package-option-2 package-option-data" data-index="2">
									<button
										class="btn btn-block btn-brand-yellow  padding-left-10 padding-right-10 sendGAEventClz"
										onclick="sendGAEvent('clickEvent', 'gigDetail', '구매하기 - 패키지 테이블');"
										id="packagePREMIUMOrderBtn" data-name="패키지 테이블 구매하기 - PREMIUM">
										<b>구매</b>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div id="description" class="informationDiv margin-top-30">
					<h4 class="margin-none"><b>서비스 설명</b></h4>

					<div class="panel panel-default margin-top-10">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-9 padding-right-20 word-break line-height-2em">
									<p>안녕하세요?</p>
									<p>브랜딩&amp;마케팅전문 브랜드를만드는사람들 퍼스트클래스입니다. 저희는 중견기업을 전문으로 프로젝트를
										진행하는 회사로 처음 ‘강원도를팝니다’라는 소상공인을 대상으로 교육/패션/식품/뷰티/병원/앱/유명인 외에
										대기업까지 다양한 클라이언트와 함께 성장하고 있습니다. 그리고다양한 클라이언트와 소통하기 위해 최선을 다하고
										있습니다.
									</p>
								</div>
							</div>

							<div class="row margin-top-20">
								<div class="col-xs-12">
									<img class="width-100 margin-top-5" src="../resources">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="options" class="margin-top-30 informationDiv overflow-hidden" style="display: none;">
					<h4><b>가격정보</b></h4>
					<div class="panel panel-default margin-top-10">
						<ul class="list-group panel-list-group-only">
							<!-- 빠른작업 -->
						</ul>
					</div>
					<div class="row" style="display: none;">
						<div class="col-xs-offset-6 col-xs-6 text-right">
							<button class="btn btn-brand-yellow btn-block"
								onclick="sendGAEvent('clickEvent', 'gigDetail', '구매하기 - 하단'); sendGAClickEvent('패키지 1개 - 하단 - 구매하기')">
								<b>구매하기 (₩ <span> 35,000</span> / VAT포함)
								</b>
							</button>
						</div>
					</div>
				</div>


				<div id="asrule" class="margin-top-30 informationDiv ">
					<h4><b>A/S 및 환불</b></h4>
					<div class="panel panel-default margin-top-10">
						<div class="panel-body" style="word-break: break-all;">
							${seller.refund}
						</div>
					</div>
				</div>

				<div id="ratings" class="margin-top-30 informationDiv ">
					<h4>
						<b>서비스 평가</b>
					</h4>

					<div class="margin-bottom-30">
						<div class="text-center margin-top-10">
							<div class="panel panel-default bg-color-f5">
								<div class="panel-body">
									<div class="color-dark-yellow-400 text-center">
										<div class="rating-container theme-krajee-fa rating-md rating-disabled rating-margin-none">
											<div class="rating-stars" style="font-size: 25px">
												<span class="empty-stars">
													<span class="star"><i class="fa fa-star color-e3"></i></span>
													<span class="star"><i class="fa fa-star color-e3"></i></span> 
													<span class="star"><i class="fa fa-star color-e3"></i></span> 
													<span class="star"><i class="fa fa-star color-e3"></i></span> 
													<span class="star"><i class="fa fa-star color-e3"></i></span>
												</span> 
												<span class="filled-stars" style="width: 0%;"> 
													<span class="star"><i class="fa fa-star"></i></span> 
													<span class="star"><i class="fa fa-star"></i></span> 
													<span class="star"><i class="fa fa-star"></i></span> 
													<span class="star"><i class="fa fa-star"></i></span> 
													<span class="star"><i class="fa fa-star"></i></span>
												</span>
											</div>
										</div>
									</div>
									<h6 class="font-color-light margin-top-5"><b>0</b>개의 평가</h6>
								</div>
							</div>
						</div>

						<div id="ratingsWrapper">
							<div id="ratesDiv" class="margin-all-0"></div>
						</div>
						</div>
					</div>
				</div>				
			</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>