<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/recruit/recruitList.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var area = new Array(2);
	var presivalue = "";
	var sivalue = "";
	var sicode = "";
	var subsivalue = "";
	var guvalue = "";
	var gucode = "";
	var subguvalue = "";
	var dongvalue = new Array(2);
	var dongcount = 0;
	var gucount = 0;

	$("#area_a").click(function() {
		$("#districtcode").css('display', 'block');
		$("#si_box").css('display', 'block');
	});

	$(".si_a").click(function() {
				sivalue = $(this).attr("title");
				sicode = $(this).attr("media");
				subsivalue = sivalue;
				presivalue = sivalue;

				if (presivalue != "" || presivalue != sivalue) {
					$("#dong_box").css('display', 'none');
				}
				$.get("../recruit/recruitSearch?si_value=" + sivalue + "&si_code=" + sicode, function(data) {
					$("#gu").html(data);
				});
				$("#gu_box").css('display', 'block');
			});

	$("#gu").on("click", ".gu_a", function() {
				guvalue = "";
				gucode = "";
				guvalue = $(this).attr("title");
				gucode = $(this).attr("media");
				subguvalue = guvalue;
				if (guvalue != "" && guvalue != '전체') {
					guvalue = guvalue.split(" ");
					if (guvalue.length == 1) {
						guvalue = guvalue[0];
					} else {
						guvalue = guvalue[1];
					}
				}

				if (gucode != "" && gucode != '00000') {
					gucode = gucode.split(" ");
					if (gucode.length == 1) {
						gucode = gucode[0];
					} else {
						gucode = gucode[1];
					}
				}

				if (guvalue != '전체' && gucode != '00000') {
					$.get("../recruit/recruitSearch?si_value=" + sivalue + "&si_code=" + sicode + "&gu_value=" + guvalue + "&gu_code=" + gucode, function(data) {
						$("#dong").html(data);
					});
					$("#dong_box").css('display', 'block');
				} else {
					if (gucount < 2) {
						area[gucount] = sivalue;
						gucount++;
					} else {
						alert("최대 2개까지 선택가능합니다.");
					}
				}
			});

	$("#dong").on("click", ".dongkey", function() {
		var ch = $(this);
		for (var i = 0; i < ch.length; i++) {
			if (ch[i].checked) {
				if (dongcount < 2) {
					if (ch[i].value == '전체') {
						area[dongcount] = subsivalue + " " + subguvalue;
						dongcount++;
					} else {
						area[dongcount] = subsivalue + " " + subguvalue + ch[i].value;
						dongcount++;
					}
				} else {
					ch[i].checked = false;
					alert("최대 2개까지만 선택할 수 있습니다.");
				}
			} else if (ch[i].checked == true) {
				ch[i].checked = false;
				dongcount--;
			} else {

			}
		}
	});
	
	$("#default").click(function() {
		location.reload();
	});
	
	$("#jk").click(function() {
		$("#jobkind").css('display', 'block');
	});
	
	//나이
	$("#mu").click(function(){
		if($(this).prop("checked")){
			$("#age").val($(this).val());
		}else{
			$("#age").val("");
		}
	});
	
	$("#search").click(function(){
		var job = new Array();
		var w_date = new Array();
		var w_day;
		var w_time = new Array();
		var gender;
		var age;
		
		//지역
		$("#zone1").attr("value", area[0]);
		$("#zone2").attr("value", area[1]);

		//업종
		var ch = $(".jobk");
		for (var i = 0; i < ch.length; i++) {
			if (ch[i].checked) {
				job[i] = ch[i].value;
			}
		}
		
		//근무기간
		var ch = $(".term");
		for (var i = 0; i < ch.length; i++) {
			if (ch[i].checked) {
				w_date[i] = ch[i].value;
			}
		}

		//근무요일
		if ($(':radio[name="w_day"]:checked').prop("checked")) {
			w_day = $(':radio[name="w_day"]:checked').val();
		}

		//근무시간
		var ch = $(".time");
		for (var i = 0; i < ch.length; i++) {
			if (ch[i].checked) {
				w_time[i] = ch[i].value;
			}
		}
		
		//성별
		if ($(':radio[name="gender"]:checked').val() == '남자') {
			gender = $(':radio[name="gender"]:checked').val();
		} else if ($(':radio[name="gender"]:checked').val() == '여자') {
			gender = $(':radio[name="gender"]:checked').val();
		} else if ($('input:checkbox[name="gender"]').prop("checked")) {
			gender = $('input:checkbox[name="gender"]').val();
		} else {
			gender = $('input:checkbox[name="gender"]').val();
		}
	});
	<%-- var num;
	var id;
	var page='list';
	var defpath='<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png'; --%>
	
	$(".ip1").click(function(){
		var num = $(this).attr("title");
		var id = '${member.id}';
		var page='list';
		var defpath='<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png';
		var srcpath1=$(".ip1").attr("src");
		if(defpath==srcpath1) {
			$.get("../scrap/scrapInsert?recruit_num="+encodeURI(num)+"&id="+encodeURI(id)+"&page="+encodeURI(page), function(data){
				$("head").append(data);
			});
			$("#sc").attr("src", "<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_on.png");
		} else {
			$.get("../scrap/scrapDelete?recruit_num="+encodeURI(num)+"&id="+encodeURI(id)+"&page="+encodeURI(page), function(data){
				$("head").append(data);
			});
			$("#sc").attr("src", "<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png");
		}
	});
	
	$(".ip2").click(function(){
		var num = $(this).attr("title");
		var id = '${member.id}';
		var page='list';
		var defpath='<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png';
		var srcpath2=$(".ip2").attr("src"); 
		if(defpath==srcpath2) {
			$.get("../scrap/scrapInsert?recruit_num="+encodeURI(num)+"&id="+encodeURI(id)+"&page="+encodeURI(page), function(data){
				$("head").append(data);
			});
			$(this).attr("src", "<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_on.png");
		} else {
			$.get("../scrap/scrapDelete?recruit_num="+encodeURI(num)+"&id="+encodeURI(id)+"&page="+encodeURI(page), function(data){
				$("head").append(data);
			});
			$(this).attr("src", "<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png");
		}
	});
	
	$(".pageclick").click(function(){
		var curpage = $(this).val();
		location.href="../recruit/recruitList?curPage="+curpage
	});
});
</script>
</head>
<body>
	<%@include file="../temp/header1.jsp"%>
	<section id="main">
		<div class="middle">
		<h1 class="h1">채용공고검색</h1>
			<div>
				<h2>빠른채용검색</h2>
			</div>
			<div id="search_area">
				<form id="form" action="<%=request.getContextPath()%>/recruit/recruitList">
					<div id="searchbox">
						<fieldset class="common">
							<h3>지역</h3>
							<div id="area" class="boxcommon">
							<a href="javascript:void(0)" id="area_a">지역을 선택하세요 (최대 2개 가능)</a>
							<input type="hidden" name="area" value="" id="zone1">
							<input type="hidden" name="area" value="" id="zone2">
							</div>
							<div id="districtcode">
								<div id="si_box">
									<ul id="si">
										<c:forEach var="city" items="${sicode}">
											<li class="is">
											<input type="hidden" value="${city}" class="sikey">
											<a href="javascript:void(0)" class="si_a" title="${siname[city]}" media="${city}">${siname[city]}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div id="gu_box">
									<ul id="gu">

									</ul>
								</div>
								<div id="dong_box">
									<ul id="dong">

									</ul>
								</div>
								</div>
						</fieldset>
						<fieldset class="common">
							<h3>직종-업종</h3>
							<div id="jobwork" class="boxcommon">
							<a href="javascript:void(0)" id="jk">직종-업종을 선택하세요 (최대 2개)</a>
							</div>
							<div id="jobkind">
								<ul>
									<c:forEach var="kind" items="${jobkind}">
										<li><input type="checkbox" value="${kind}" class="jobk" name="job">${kind}</li>
									</c:forEach>
								</ul>
							</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무기간</h3>
							<div class="boxcommon">
								<input type="checkbox" name="w_date" value="1일" class="term">1일
								<input type="checkbox" name="w_date" value="1주일" class="term">1주일
								<input type="checkbox" name="w_date" value="1개월" class="term">1개월
								<input type="checkbox" name="w_date" value="3개월" class="term">3개월
								<input type="checkbox" name="w_date" value="6개월" class="term">6개월
								<input type="checkbox" name="w_date" value="1년이상" class="term">1년이상
							</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무요일</h3>
							<div class="boxcommon">
								<input type="radio" name="w_day" value="7">주7일 월~일
								<input type="radio" name="w_day" value="6">주6일 월~토 
								<input type="radio" name="w_day" value="5">주5일 월~금 
								<input type="radio" name="w_day" value="주말 ">주말 토~일
							</div>
						</fieldset>
						<fieldset class="common">
							<h3>근무시간</h3>
							<div class="boxcommon">
								<input type="checkbox" name="w_time" value="오전" class="time">오전
								<input type="checkbox" name="w_time" value="오후" class="time">오후
								<input type="checkbox" name="w_time" value="저녁" class="time">저녁
								<input type="checkbox" name="w_time" value="새벽" class="time">새벽
								<input type="checkbox" name="w_time" value="풀타임" class="time">풀타임
							</div>
						</fieldset>
						<fieldset class="common genderage">
							<h3>성별</h3>
							<div class="boxcommon">
								<input type="radio" name="gender" value="남자">남자 &nbsp; 
								<input type="radio" name="gender" value="여자">여자 &nbsp; 
								<input type="checkbox" name="gender" value="무관">무관
							</div>
						</fieldset>
						<fieldset class="common genderage">
							<h3>연령</h3>
							<div class="boxcommon">
								<input type="text" size="5" value="" id="age" name="age">세&nbsp; 
								<input type="checkbox" id="mu" value="무관">무관
							</div>
						</fieldset>
						<fieldset id="searchbtn">
							<div id="btngroup">
								<input type="submit" value="검색" class="btn searchbtn">&nbsp;&nbsp;&nbsp;
								<input type="button" value="초기화" class="btn resetbtn" id="default">
							</div>
						</fieldset>
					</div>

				</form>
			</div>
			
			<%-- <div id="powerlink"><h2>파워링크</h2></div>
			
			<div id="powerlinklist">
				<table id="powerlink_table" class="table">
					<tr id="firstrow">
						<th class="f_th">지역</th>
						<th class="f_th">모집제목</th>
						<th class="f_th">급여</th>
						<th class="f_th">근무시간</th>
						<th class="f_th">마감기한</th>
					</tr>
					<c:forEach var="item" items="${totallist}" end="4">
						<tr id="extrarow">
							<td class="e_td"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png" title="${item.num}" class="ip1">${item.addr}</td>
							<td class="e_td e_td2">
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.c_name}</a></p>
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.title}</a></p>
							</td>
							<td class="e_td e_td2">${item.salary}</td>
							<td class="e_td">${item.w_time}</td>
							<td class="e_td">${item.deadline}</td>
						</tr>
					</c:forEach>
				</table>
			
			</div> --%>

			<div id="list_area">
				<div>
					<h2>채용공고리스트</h2>
				</div>
				<table id="list_table" class="table">
					<tr id="firstrow">
						<th class="f_th">지역</th>
						<th class="f_th">모집제목</th>
						<th class="f_th">급여</th>
						<th class="f_th">근무시간</th>
						<th class="f_th">마감기한</th>
					</tr>
					<c:forEach var="item" items="${totallist}">
						<tr id="extrarow">
							<td class="e_td"><img src="<%=request.getContextPath()%>/resources/images/recruit/scrap/scrap_off.png" title="${item.num}" class="ip2">${item.addr}</td>
							<td class="e_td e_td2">
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.c_name}</a></p>
								<p><a href="<%=request.getContextPath()%>/recruit/recruitView?num=${item.num}&id=<%=request.getSession().getId()%>">${item.title}</a></p>
							</td>
							<td class="e_td e_td2">${item.salary}</td>
							<td class="e_td">${item.w_time}</td>
							<td class="e_td">${item.deadline}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<c:if test="${pagelist.curBlock>=1}">
						<span><input type="button" value="이전" class="btnshape prebtn prenext"></span>
					</c:if>
					<c:forEach begin="${pagelist.startNum}" end="${pagelist.lastNum}"
						var="i">
						<span><input type="button" value="${i}" class="pageclick btnshape"></span>
					</c:forEach>
					<c:if test="${pagelist.curBlock<=pagelist.totalBlock}">
						<span><input type="button" value="다음" class="btnshape prenext"></span>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<%@include file="../temp/footer.jsp"%>
</body>
</html>