<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="favorInsert" method="post" name="frm" id="frm">
	<input type="hidden" name="id" value="${favorDTO.id}">
	<input type="hidden" name="seller" value="${favorDTO.seller}">
	<button type="button" id="favor-btn" class="off">즐겨찾기</button>
</form>