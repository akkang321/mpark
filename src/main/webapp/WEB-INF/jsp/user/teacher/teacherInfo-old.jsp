<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="serverName" value="${pageContext.request.serverName}" />

<html>

<head>
	<link rel="stylesheet" href="/css/user/scrollHorizontal.css">
    
    <script>
    	function teacherInfo(tId){ 
    		$("#tId").val(tId);
    		$("#frm").attr("action", "/teacherInfo")
    		$("#frm").submit();	
    	}; 
    
    	function teacherInfoDetail(tId){
    		$("#tId").val(tId);
    		$("#frm").attr("action", "/teacherInfoDetail")
    		$("#frm").submit();	
    	}
    </script>
    
</head>

<form id="frm" method="post">
<input type="hidden" id="tId" name="tId" value="">
    <nav>

		<jsp:include page="/WEB-INF/jsp/user/layout/logo.jsp" />

        <ul class="main-nav"> 
            <li>
                <a href="#">
                    INSTRUCTORS
                    <span class="bar"></span>
                </a>
                <ul class="sub-nav">
                <c:forEach var="list" items="${ teacherNameList }">
					<li><a href="javascript:teacherInfo('${ list.T_ID }')">${ list.TEACHER_NAME }</a></li>
				</c:forEach>
                </ul>
            </li>

            <li>
                <a href="#">
                    SCHEDULE
                    <span class="bar"></span>
                </a> 
            </li>
            <li>
                <a href="#">
                    CONTACT
                    <span class="bar"></span>
                </a>
            </li>
            <li>
                <a href="#">
                    ABOUT
                    <span class="bar"></span>
                </a>
            </li>
            <li>
                <a href="#">
                    LOCATION
                    <span class="bar"></span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="loadingCover">
		<div class="container">
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
		  </div>
	</div>
	<script>
		window.onload = async() => {
			$('.loadingCover').fadeOut(500)
		}
	</script>


    <div class="loadingCover">
		<div class="container">
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
			<div class="ball"></div>
		  </div>
	</div>
	<script>
		window.onload = async() => {
			$('.loadingCover').fadeOut(500)
		}
	</script>


<!--
    <div class="horizontal-scroll">
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze1.png) no-repeat center center / cover;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze2.png) no-repeat center center / cover;;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze3.png) no-repeat center center / cover;;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze1.png) no-repeat center center / cover;;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze2.png) no-repeat center center / cover;;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze3.png) no-repeat center center / cover;;"></div>
        </div>
        <div class="horizontal-scroll__block">
            <div class="background" style="background: url(/img/user/teacher/img/noze1.png) no-repeat center center / cover;;"></div>
        </div>
    </div>
-->


	<div class="horizontal-scroll">

        <c:forEach var="list" items="${ teacherInfo }">
	      <c:set var="myImg" />
	        <c:if test="${ list.PHOTO_PATH != null }">
	          <c:set var="myImg">http://${serverName}\myImg${ list.PHOTO_PATH }</c:set>
	          <c:set var="myImg">${fn:replace(myImg, '\\', '/')}</c:set> 
	        </c:if>

          <div class="horizontal-scroll__block">
              <div class="background" style="background: url(${myImg}) no-repeat center / cover;"></div>
          </div>

        </c:forEach>

    </div>


<!--
    	<c:forEach var="list" items="${ fileList }" varStatus="status">
			<c:set var="myImg" />
				<c:if  test="${ list.FILE_PATH != null }">
					<c:set var="myImg">myImg${ list.FILE_PATH }</c:set>
				</c:if>

				<div class="addImgWrap addImgWrap2" id="imgDiv${ status.index }">
					<input type="hidden" name="fileIds" value="${ list.FILE_ID }">
				<div class="addBox">
					<h2>이미지</h2>
					<div class="btnBox">
						<span class="btn-file">이미지 추가<input type="file" name="uploadFiles" onchange="changeImg(this)" accept="image/*" value=""></span>
						<span class="btn-del" onclick="deleteImgs(${ status.index },${ list.FILE_ID });">삭제</span>
					</div>
				</div>
				<div class="imgBox">
					<img src="${ myImg }" name="previewImages" alt="">
				</div>
				</div>
		</c:forEach>
-->


    <div class="pictures_mobile">
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze1.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze2.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze3.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/aiki1.jpg) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/leejung1.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze1.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze2.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/noze3.png) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/aiki1.jpg) no-repeat center center / cover;"></div>
        <div class="imgBox" style="background: url(/img/user/teacher/img/leejung1.png) no-repeat center center / cover;"></div>
    </div><!--e:pictures_mobile-->


    <div class="seeMoreBox"><a href="javascript:teacherInfoDetail('${ teacherInfoOne.FILE_USE_ID }')" class="seeMore">MORE</a></div>

    <span class="arrowRight"></span>


</form>


