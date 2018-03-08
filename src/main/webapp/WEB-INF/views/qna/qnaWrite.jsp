<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 문의</title>
<link rel="stylesheet" type="text/css" href="../resources/css/qna/qnaWrite.css">
<link href="<%=request.getContextPath()%>/resources/css/common/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/footer.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		if ($("#type option:selected").val() == "0") {
			alert('문의 유형을 선택하세요.');
			if ($("#type option:selected").val() == "0") {
				$("#type").focus();
			} else {
				$("#type").focus();
			}
			return false;
		}
		if ($.trim($("#contents").val()) == ""|| $.trim($("#contents").val()) == $.trim(default_inqry)) {
			alert('문의 내용을 입력하세요.');
			$("#contents").focus();
			return false;
		}

		if (!$("#check").is(":checked")) {
			alert('개인정보 수집내용에 동의해 주세요.');
			return false;
		}
		return true;
	});
});
</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<h1 class="h1">문의하기</h1>

		<div id="qnaWrap">
			<form id="frm" name="frm" action="qnaWrite" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${member.id}">
				<!--// 컨텐츠 영역 -->
				<div class="qnaCon">
					<table class="qnatable">
						<tbody>
							<tr>
								<th><span class="sq">필수</span>문의유형</th>
								<td>
									<select name="type" id="type" class="slt sltL" title="분류 선택" style="width: 180px;">
										<option value="0">분류 선택</option>
										<option value="회원정보">회원정보</option>
										<option value="이력서관리">이력서관리</option>
										<option value="구직활동관리">구직활동관리</option>
										<option value="공고등록관리">공고등록관리</option>
										<option value="유료서비스">유료서비스</option>
										<option value="오류/의견">오류/의견</option>
										<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="loc"><label for="contents"><span class="sq">필수</span>문의내용</label></th>
								<td>
									<div class="txWp">
										<textarea name="contents" id="contents"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="email"><span class="sq">필수</span>이메일</label></th>
								<td><input type="text" name="email" id="email" class="ipt" value="${member.email}" style="width: 94%"></td>
							</tr>
							<tr>
								<th class="loc_1 file"><label for="file">첨부파일</label></th>
								<td>
									<div class="fileList">
										<div class="fileWp">
											<label for="lbl_file1">첨부파일</label>
											<input type="file" name="file" id="lbl_file1" class="skip">
											<div class="filename"></div>
										</div>
									</div>
									<p class="tip">※(doc, hwp, png, jpeg, jpg, gif, bmp, zip) 첨부 가능</p>
								</td>
							</tr>
						</tbody>
					</table>
					<!--// 개인정보 정책 -->
					<div class="privacyWp">
						<div class="privacy">
							<h2>개인정보수집 및 이용안내</h2>
							<p><b>문의에 대한 처리 및 답변</b>을 위해 <b>이메일, 계정정보, 첨부사진(선택), IP주소, 브라우저 및 OS 정보</b>가 수집되며,<br> 수집된 정보는 <b>3년간 보관</b>합니다. 이에 동의하지 않을 경우 문의/제안 등록이 불가하며, 선택항목은 입력하지 않더라도<br> 서비스이용에 제한을 두지 않습니다.</p>
						</div>
						<p class="agree">
							<input type="checkbox" name="check" id="check" class="chk" value="on">
							<label for="check">개인정보수집 및 이용안내에 동의합니다.</label>
						</p>
					</div>

					<!--// 버튼 -->
					<p class="btn">
						<button type="submit" id="btn" class="bBtn">보내기</button>
					</p>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>