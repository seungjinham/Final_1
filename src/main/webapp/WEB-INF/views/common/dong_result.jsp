<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  

							<c:forEach var="village" items="${dongcode}">
							<li class="is"><input type="checkbox" value="${village}" class="dongkey"><a href="javascript:void(0)" class="dong_a">${dongname[village]}</a></li>
							</c:forEach>
