<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><tiles:getAsString name="title" /></title>
	<link rel="stylesheet" href="/css/admin/web.css">
	<script src="/js/admin/jquery.js"></script>
	<script src="/js/admin/web.js"></script>
	<script src="/js/common.js"></script>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="left" />
		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>