<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>companySelectOne</h1>
	<form action="companyRecruitUpdate">
		<input type="text" value=${recruitDTO.id} name="id">
		<input type="hidden" value=${recruitDTO.num} name="num">
		<input type="text" value=${recruitDTO.title} name="title">
		<input type="text" value=${recruitDTO.deadline} name="deadline">
		<input type="text" value=${recruitDTO.people} name="people">
		<input type="text" value=${recruitDTO.gender} name="gender">
		<input type="text" value=${recruitDTO.age} name="age">
		<input type="text" value=${recruitDTO.school} name="school">
		<input type="text" value=${recruitDTO.special} name="special">
		<input type="text" value=${recruitDTO.salary} name="salary">
		<input type="text" value=${recruitDTO.w_date} name="w_date">
		<input type="text" value=${recruitDTO.w_day} name="w_day">
		<input type="text" value=${recruitDTO.w_time} name="w_time">
		<input type="text" value=${recruitDTO.job} name="job">
		<input type="text" value=${recruitDTO.work} name="work">
		<input type="text" value=${recruitDTO.benefit} name="benefit">
		<input type="text" value=${recruitDTO.contents} name="contents">
		<button>update</button>
	</form>
</body>
</html>