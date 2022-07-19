<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.query_string']}" />

<script>
	function teacherClassList(tId) {
		$("#tId").val(tId);
		$("#frm").attr("action", "/teacher/teacherClassList"); 
		$("#frm").submit();
	}
</script>

<header>
    <div class="inner">
    <div class="Df_JF">
        <h1><a href="javascript:teacherClassList('${ userInfo.T_ID }')">제니스 C&M 강사</a></h1>
        <c:if test="${ userInfo!=null }">
        	<h3><a href="/teacher/logout">로그아웃</a></h3> 
        </c:if>
    </div>
    </div><!--e:inner-->
</header>
<form id="frm" name="frm" method="post">
<input type="hidden" id="tId" name="tId">
<nav>
    <div class="inner">

        <div class="tabs">
            <a href="#">아카데미관리</a>
            <a href="#">수익</a>
            <a href="#">마이페이지</a>
          
        </div><!--e:tabs-->
        <div class="tabs-content">
            <div class="tab1 tab <c:if test="${fn:contains(path, 'user')|| fn:contains(path, 'teacher')|| fn:contains(path, '/admin/admin') || path eq '/admin/index'}" > active </c:if>"> 
                <a href="javascript:teacherClassList('${ userInfo.T_ID }')">클래스</a> 
                <a href="#">스케줄</a> 
            </div> 
            <div class="tab2 tab <c:if test="${fn:contains(path, '/admin/academy')}" > active </c:if>"> 
                <a href="#">클래스</a>
                <a href="#">통계</a>
            </div>
            <div class="tab3 tab <c:if test="${fn:contains(path, '/admin/situation')}" > active </c:if>"> 
            	<a href="#">정보수정</a>
            </div>
        </div><!--e:tabs-content-->
    </div><!--e:inner-->
</nav>
</form>

<script>

    $('.tabs a').each(function(index, item) {
        $(item).click(function() {
            $('.tabs a').removeClass('active')
            $(item).addClass('active')

            $('.tab').removeClass('active')
            $('.tab').eq(index).addClass('active')
        })

    })

</script>


