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
		$(".del").click(function() {
			var num = $(this).val();
			var fname = $(this).attr("title");
			var check=confirm(num+" 정말 삭제 하시겠습니까?");
			if(check) {
				$.ajax({
					url:"../company/companyRecruitDelete",
					type:"GET",
					data:{
						num:num,
						fname:fname
					},
					success:function(data){
						if(data.trim()==1){
							alert('data삭제');
						} else {
							alert('data 안삭제');
						}
					}
				});
			}
		});
		$(".update").click(function() {
			var num = $(this).val();
			location.href="companySelectOne?num="+num;
			
			/* 
			var num = $(this).val();
			var list = $(this).attr("title");
			alert(list);
			var check=confirm(num+" 수정 하시겠습니까");
			if(check) {
				$.ajax({
					url:"../company/companyRecruitUpdate",
					type:"GET",
					data:{
						num:num,
						list:list
					},
					success:function(data){
						if(data.trim()==1){
							alert('수정 성공');
						} else {
							alert('수정 안성공');
						}
					}
				});
			} */
		});
		
		
		
		
		
		
	});

</script>
</head>
<body>
	<table>
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
				<td><button class="update" value="${list2.num}" title="${list2}">update</button></td>
				<td><button class="del" value="${list2.num}" title="${list2.fname}">delete</button></td>
			</tr>
		</c:forEach>
	</table>
	

</body>
</html>