<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Voltaire" rel="stylesheet">
	<link rel="stylesheet" href="/css/user/all.css">
	<link rel="stylesheet" href="/css/user/media.css">
	<script src="/js/user/jquery-1.12.4.min.js"></script>
	<script src="/js/user/header.js"></script>
    
</head>


<%-- <c:choose>
	<c:when test="${path eq '/' || path eq 'index'}">
		 <body class="overflowHD mo_overflowHD">
	</c:when>
	<c:otherwise>
		 <body>
	</c:otherwise>
</c:choose> --%>
<body style="overflow-x: hidden;">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body> 
</html>