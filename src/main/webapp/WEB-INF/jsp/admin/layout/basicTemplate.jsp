<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <title>미팍 Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description">
    <meta content="Themesdesign" name="author">

    <!-- jquery.vectormap css -->
    <link href="/static/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">

    <!-- DataTables -->
    <link href="/static/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <!-- Responsive datatable examples -->
    <link href="/static/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap Css -->
    <link href="/static/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
    <!-- Icons Css -->
    <link href="/static/css/icons.min.css" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="/static/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">
    <link rel="/stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
    
    
    <link href="/static/css/sweetalert2.min.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/css_plus.css" rel="stylesheet"  type="text/css">
    
    <link rel="stylesheet" href="/css/web.css">
    
	<script src="/common/common.js"></script>
</head>
<body data-topbar="dark">
	<div id="layout-wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="left" />
		<tiles:insertAttribute name="body" />
		
	</div>
</body>
 <div class="rightbar-overlay"></div>

    <!-- JAVASCRIPT -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.bundle.min.js"></script>
    <script src="/static/js/metisMenu.min.js"></script>
    <script src="/static/js/simplebar.min.js"></script>
    <script src="/static/js/waves.min.js"></script>

    <!-- apexcharts -->
    
    <!-- jquery.vectormap map -->
    <script src="/static/js/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="/static/js/jquery-jvectormap-us-merc-en.js"></script>
    <!-- Required datatable js -->
    <script src="/static/js/jquery.dataTables.min.js"></script>
    <script src="/static/js/dataTables.bootstrap4.min.js"></script>

    <!-- Responsive examples -->
    <script src="/static/js/dataTables.responsive.min.js"></script>
    <script src="/static/js/responsive.bootstrap4.min.js"></script>
   
    <!-- App js -->
    <script src="/static/js/web.js"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Sweet Alerts js -->
    <script src="/static/js/sweetalert2.min.js"></script>

    <!-- Sweet alert init js-->
    <script src="/static/js/sweet-alerts.init.js"></script>
</html>


<!-- Right bar overlay-->
   
