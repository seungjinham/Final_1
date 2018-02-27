<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<li class="is"><input type="hidden" value="전체" class="gukey"><a href="javascript:void(0)" class="gu_a" title="전체">전체</a></li>
    							<c:forEach var="town" items="${gucode}">
							<li class="is"><input type="hidden" value="${town}" class="gukey"><a href="javascript:void(0)" class="gu_a" title="${guname[town]}" media="${town}">${guname[town]}</a></li>
							</c:forEach>

							