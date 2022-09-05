<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title><tiles:getAsString name="title" /></title>
<script src="/common/jquery.js"></script>
<link rel="stylesheet" href="/css/web.css">
<link rel="stylesheet" href="/css/reset.css">

</head>
	<tiles:insertAttribute name="body" />
</html>