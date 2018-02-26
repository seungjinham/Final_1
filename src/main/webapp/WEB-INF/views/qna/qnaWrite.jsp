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

</script>
</head>
<body>
	<%@ include file="../temp/header1.jsp"%>
	<section id="main">
		<h1 class="h1">문의하기</h1>

		<div id="qnaWrap">
			<form id="frm" name="frm" action="qnaWrite" method="post" enctype="multipart/form-data" >
				<input id="hid_upload_src" name="hid_upload_src" type="hidden" value="https://file.albamon.com/albamon/Services/QnA/FileUpload_QNA">
				<input id="submit_src" name="submit_src" type="hidden" value="/Services/QnA/RegistProc">
				<input id="AttachFile" name="AttachFile" type="hidden" value="">
				<input id="AttachFile2" name="AttachFile2" type="hidden" value="">
				<input id="AttachFile3" name="AttachFile3" type="hidden" value="">
				<input id="AttachFileJobCheat" name="AttachFileJobCheat" type="hidden" value="">
				<input id="AttachFileJobCheat2" name="AttachFileJobCheat2" type="hidden" value="">
				<input id="AttachFileJobCheat3" name="AttachFileJobCheat3" type="hidden" value="">
				<input id="AccessURL" name="AccessURL" type="hidden" value="http://www.albamon.com/">

				<!--// 컨텐츠 영역 -->
				<div class="qnaCon">
					<fieldset>
						<table summary="이표는 이름, 아이디, e-메일 주소, 전화번호, 카테고리, 제목, 페이지주소, 전달내용을 포함하고 있습니다." class="qnatable">
							<colgroup>
								<col width="140px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th><span class="sq">필수</span>문의유형</th>
									<td>
										<select name="type" id="type" class="slt sltL" title="분류 선택" style="width: 180px;">
											<option value="0">분류 선택</option>
											<option value="1">회원정보</option>
											<option value="2">이력서관리</option>
											<option value="3">구직활동관리</option>
											<option value="4">공고등록관리</option>
											<option value="5">유료서비스</option>
											<option value="6">오류/의견</option>
											<option value="7">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="loc"><label for="Contents"><span class="sq">필수</span>문의내용</label></th>
									<td>
										<div class="txWp">
											<textarea name="Contents" id="Contents" maxlength="3000"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th><label for="Email"><span class="sq">필수</span>이메일</label></th>
									<td><input type="text" name="Email" id="Email" class="ipt" value="${member.email}" style="width: 94%" maxlength="50"></td>
								</tr>
								<tr>
									<th class="loc_1 file"><label for="SelectFile">첨부파일</label></th>
									<td>
										<div class="fileList">
											<div class="fileWp">
												<label for="lbl_file1">첨부파일</label>
												<input type="file" name="SelectFile" id="lbl_file1" class="skip">
												<div class="filename"></div>
											</div>
										</div>
										<p class="tip">※(doc, hwp, png, jpeg, jpg, gif, bmp, zip) 첨부 가능</p>
									</td>

								</tr>
							</tbody>
						</table>
					</fieldset>

					<!--// 개인정보 정책 -->
					<div class="privacyWp">
						<div class="privacy">
							<h2>개인정보수집 및 이용안내</h2>
							<p>
								<b>문의에 대한 처리 및 답변</b>을 위해 <b>이메일, 계정정보, 첨부사진(선택), IP주소, 브라우저 및 OS 정보</b>가 수집되며,<br> 수집된 정보는 <b>3년간 보관</b>합니다.
								이에 동의하지 않을 경우 문의/제안 등록이 불가하며, 선택항목은 입력하지 않더라도<br> 서비스이용에 제한을 두지 않습니다.
							</p>
						</div>
						<p class="agree">
							<input type="checkbox" name="PimsAgree" id="PimsAgree" class="chk" value="on"><label for="PimsAgree">개인정보수집 및 이용안내에 동의합니다.</label>
						</p>
					</div>

					<!--// 버튼 -->
					<p class="btn">
						<button type="submit" id="btn_submit" class="bBtn">보내기</button>
					</p>					
				</div>
			</form>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>