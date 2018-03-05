<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitView.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#scrap_btn").click(function(){
		var srcpath = $("#sc").attr('src');
		var defpath = '<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png';
		var num = '${recruit.num}';
		var id = '${member.id}';
		var page = 'view';
		if(defpath==srcpath) {
			$("#sc").attr("src","<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_on.png");
 			$.get("../scrap/scrapInsert?recruit_num="+num+"&id="+id+"&page="+page, function(data){
				$("head").append(data);
			});
			
		} else {
			$("#sc").attr("src","<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png");
 			$.get("../scrap/scrapDelete?recruit_num="+num+"&id="+id, function(data){
				$("head").append(data);
			});
			
		}
	});
	
	$("#applybtn").click(function(){
		var num = $("#regnum").attr("value");
		var id = '${member.id}';
		var cid = '${recruit.id}';
		//<a href="../apply/applyInsert?recruit_num=${recruit.num}&id=${member.id}&cid=${recruit.id}">Apply</a>
		$.get("../apply/applyInsert?recruit_num="+num+"&id="+id+"&cid="+cid, function(data){
			$("head").append(data);
		});
	});
	
 	var salary = '${recruit.salary}';
 	var deadline = '${recruit.deadline}';
	var salaryArr = salary.split(" ");
	var deadlineArr = deadline.split(" ");
	$("#sal_title").text(salaryArr[0]);
	$("#sal_cash").text(salaryArr[1]);
	$("#deadline").text(deadlineArr[0]);
	$("#h3_deadline").text(deadlineArr[0]);
});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
	<div id="recruit_info">
	<div id="registration_info">
	<div id="reg_num"><span><h3><input type="hidden" value="${recruit.num}" id="regnum">공고등록번호 ${recruit.num}</h3></span></div><div id="func_btn"><div id="scrap_wrap"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png" id="sc"><input type="button" value="스크랩" id="scrap_btn"></div></div>
	</div>
	</div>

		<div id="company_info">
			<div id="recruit_info">
				<div id="company">
					<span><h3>${company.c_name}</h3></span>
					<h1>${recruit.title}</h1>
				</div>
				<div id="thumnail">
					<div id="workview_info">
						<div class="thumitem">
							<div class="circle"><span id="sal_title"></span></div>
							<div class="char" id="sal_cash"></div>
						</div>
						<div class="thumitem">
							<div class="circle"><span>기간</span></div>
							<div class="char">${recruit.w_date}</div>
						</div>

						<div class="thumitem">
							<div class="calendar"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/calendar.PNG"></div>
							<div class="char">${recruit.w_day}</div>
						</div>

						<div class="thumitem">
							<div class="clock"><img src="<%=request.getContextPath()%>/resources/images/recruit/view/clock.PNG"></div>
							<div class="char">${recruit.w_time}</div>
						</div>

						<div class="thumitem">
							<div class="circle"><span>마감일</span></div>
							<div class="char" id="deadline"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="condition_info">
		<div id="leftbox">
		<div id="recruit_condition">
		<p><h1 class="viewtitle">모집조건</h1></p>
		<p><h3 class="recruit_data">마감일</h3><h3 class="recruit_data rdh3" id="h3_deadline"></h3></p>
		<p><h3 class="recruit_data">인원&nbsp;</h3><h3 class="recruit_data rdh3">${recruit.people}</h3></p>
		<p><h3 class="recruit_data">성별&nbsp;</h3><h3 class="recruit_data rdh3">${recruit.gender}</h3></p>
		<p><h3 class="recruit_data">연령&nbsp;</h3><h3 class="recruit_data rdh3">${recruit.age}</h3></p>
		<p><h3 class="recruit_data">학력&nbsp;</h3><h3 class="recruit_data rdh3">${recruit.school}</h3></p>
		<p><h3 class="recruit_data">우대&nbsp;</h3><h3 class="recruit_data rdh3">${recruit.special}</h3></p>
		</div>
		
		<div id="work_condition">
		<p><h1 class="viewtitle">근무조건</h1></p>
		<p><h3 class="recruit_data">급여&nbsp;&nbsp;</h3><h3 class="recruit_data" id="sala">${recruit.salary}</h3></p>
		<p><h3 class="recruit_data">근무기간</h3><h3 class="recruit_data rdh3">${recruit.w_date}</h3></p>
		<p><h3 class="recruit_data">근무요일</h3><h3 class="recruit_data rdh3">${recruit.w_day}</h3></p>
		<p><h3 class="recruit_data">근무시간</h3><h3 class="recruit_data rdh3">${recruit.w_time}</h3></p>
		<p><h3 class="recruit_data">업직종&nbsp;</h3><h3 class="recruit_data rdh3" id="job">${recruit.job}</h3></p>
		<p><h3 class="recruit_data">고용형태</h3><h3 class="recruit_data rdh3">${recruit.work}</h3></p>
		</div>
		</div>
		
		<div id="rightbox">
		<input type="button" value="지원하기" id="applybtn">
		<div id="recruit_manager">
		<p><h1 class="viewtitle">채용담당자 정보</h1></p>
		<p><h3 class="recruit_data">담당자</h3><h3 class="recruit_data rdh3">${company.name}</h3></p>
		<p><h3 class="recruit_data">이메일</h3><h3 class="recruit_data rdh3">${company.email}</h3></p>
		<p><h3 class="recruit_data">전화&nbsp;</h3><h3 class="recruit_data rdh3" id="pho">${company.phone}</h3></p>
		</div>
		</div>
		</div>
		
		<div id="viewtab">
		<div id="tablist">
		<ul><li><a href="#area_h2">근무지역</a></li><li><a href="#notice">상세모집요강</a></li><li><a href="#business_info">채용기업정보</a></li></ul>
		</div>
		
		<div id="area">
		<h2 id="area_h2">근무지역</h2>
		<hr/>
		<h3>주소 : ${company.addr}</h3>
		<div id="kakaoMap">
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c361d9dfa8c98b5b9f2917f213035b65&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c361d9dfa8c98b5b9f2917f213035b65&libraries=services"></script>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c361d9dfa8c98b5b9f2917f213035b65"></script>

		<script type="text/javascript">
		var container = document.getElementById('kakaoMap');
		var option = {
				center: new daum.maps.LatLng(33.450701, 126.570667), 
				level: 3 
		};
		var kakaoMap = new daum.maps.Map(container, option);
		
		var name = '${company.c_name}';
		var addr = '${company.addr}';
 		var arr = addr.split(",");
		arr = arr[1].split("(");
		addr = arr[0];
 		if(arr[1]!=null) {
 			arr = arr[1].split(")");
			addr = addr+arr[1];
		}
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch(addr, function(result, status){
			if(status===daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				var marker = new daum.maps.Marker({
					map: kakaoMap,
					position: coords
				});
				
				var infowindow = new daum.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
				});
				infowindow.open(kakaoMap, marker);
				kakaoMap.setCenter(coords);
			}
		});
		</script>
		</div>
		
		<div id="notice">
		<h2>상세모집요강</h2>
		<hr/>
		<div>
		<c:set var="fname" value="${recruit.fname}"></c:set>
		<c:if test="${!empty fname}">
		<img src="<%=request.getContextPath()%>/resources/images/company/${fname}">
		</c:if>
		<h3>${recruit.contents}</h3>
		</div>
		</div>
		
		<div id="business_info">
		<h1>채용기업정보</h1>
		<hr/>
		<div id="cominfo">
		<p><h2>${company.c_name}</h2></p>
		<p><h3 class="cominfo_h3 pre_h3">대표자</h3><h3 class="cominfo_h3">${company.name}</h3></p>
		<p><h3 class="cominfo_h3 pre_h3">회사주소</h3><h3 class="cominfo_h3">${company.addr}</h3></p>
		<p><h3 class="cominfo_h3 pre_h3">사업내용</h3><h3 class="cominfo_h3">${recruit.job}</h3></p>
		</div>
		</div>
		
		</div>
	<a href="../apply/applyInsert?recruit_num=${recruit.num}&id=${member.id}&cid=${recruit.id}">Apply</a>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>