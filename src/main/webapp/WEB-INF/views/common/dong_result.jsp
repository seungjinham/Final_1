<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<li class="is">
<input type="checkbox" value="전체" class="dongkey">
<a href="javascript:void(0)" class="gu_a" title="전체">전체</a>
</li>
							
<c:forEach var="village" items="${dongcode}">
<li class="is">
<input type="checkbox" value="${dongname[village]}" class="dongkey">
<a href="javascript:void(0)" class="dong_a">${dongname[village]}</a>
</li>
</c:forEach>
