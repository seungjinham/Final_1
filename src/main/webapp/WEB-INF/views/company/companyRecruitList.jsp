<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#del").click(function() {
			var del =$(this);
			var num = $(this).val();
			var check=confirm(num+" 정말 삭제 하시겠습니까?");
			if(check) {
				$.ajax({
					url:"./companyRecruitDelete",
					type:"GET",
					data:{
						num:num
					},
					success:function(data){
						if(data.trim()==1){
							$(del).prev().remove();
							$(del).remove();
							i--;
						}
					}
				})
			}
		})
	})

</script>
</head>
<body>
	<table class="t">
		<tr>
			<td>NUM</td>
		</tr>
		<c:forEach items="${list}" var="list2">
			<tr>
				<td>${list2.num}</td>
				<td>${list2.id}</td>
				<td>${list2.title}</td>
				<td>${list2.deadline}</td>
				<td>${list2.people}</td>
				<td>${list2.gender}</td>
				<td>${list2.age}</td>
				<td>${list2.school}</td>
				<td>${list2.special}</td>
				<td>${list2.salary}</td>
				<td>${list2.w_date}</td>
				<td>${list2.w_day}</td>
				<td>${list2.w_time}</td>
				<td>${list2.job}</td>
				<td>${list2.work}</td>
				<td>${list2.benefit}</td>
				<td>${list2.contents}</td>
				<td><img src="<%=request.getContextPath()%>/resources/images/company/${list2.fname}"></td>
				<td>${list2.oname}</td>
				<td>${list2.addr}</td>
				<td><button id="del" value="${list2.num}">delete</button></td>
			</tr>
		</c:forEach>
	</table>
	

</body>
</html>