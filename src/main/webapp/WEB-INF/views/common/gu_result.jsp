<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

    							<c:forEach var="town" items="${gucode}">
							<li class="is"><input type="checkbox" value="${town}" class="gukey"><a href="javascript:void(0)" class="gu_a" title="${guname[town]}">${guname[town]}</a></li>
							</c:forEach>

							