<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.query_string']}" />

<nav>
	<a href="#" class="active">파트너스<br>신청</a>
	<a href="/admin/partnerList">파트너스</a>
	<a href="#">고객</a>
	<a href="#">파트너스<br>매출관리</a>
	<a href="#">전체매출<br>관리</a>
</nav>


