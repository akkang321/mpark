<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.query_string']}" />


<header>
    <div class="inner">
    <div class="Df_JF">
        	<h1><a href="/admin/index">제니스 C&M admin</a></h1>
        
        <c:if test="${ userInfo!=null }">
        	<h3><a href="/admin/logout">로그아웃</a></h3>
        </c:if>
    </div>
    </div><!--e:inner-->
</header>
<nav>
    <div class="inner">

        <div class="tabs">
            <a href="#" <c:if test="${fn:contains(path, 'user')|| fn:contains(path, 'teacher')|| fn:contains(path, '/admin/admin') || path eq '/admin/index' || path eq ''}" >class="active" </c:if>>인원관리</a> 
            <a href="#" <c:if test="${fn:contains(path, '/admin/academy')}" > class="active" </c:if>>아카데미관리</a> 
            <a href="#" <c:if test="${fn:contains(path, '/admin/situation')}" > class="active" </c:if>>수강관리</a> 
            <a href="#" <c:if test="${fn:contains(path, '/admin/price')}" > class="active" </c:if>>비용관리</a> 
            <a href="#" <c:if test="${fn:contains(path, '/admin/statistic')}" > class="active" </c:if>>통계</a>
            <a href="#" <c:if test="${fn:contains(path, '/admin/message')}" >class="active" </c:if>>발송관리</a>
            <a href="#">게시판관리</a>
            <a href="#" <c:if test="${fn:contains(path, '/admin/codeList')}">class="active" </c:if>>기타관리</a> 
        </div><!--e:tabs-->
        <div class="tabs-content">
            <div class="tab1 tab  <c:if test="${fn:contains(path, 'user')|| fn:contains(path, 'teacher')|| fn:contains(path, '/admin/admin') || path eq '/admin/index' || path eq ''}" > active </c:if>"> 
                <a href="/admin/userList">회원</a>
                <a href="/admin/teacherList">강사</a>
                <a href="/admin/adminList">관리자</a>
            </div>
            <div class="tab2 tab <c:if test="${fn:contains(path, '/admin/academy')}" > active </c:if>"> 
                <a href="/admin/academyClassList">클래스</a>
                <a href="/admin/academyScheduleList">스케쥴</a>
                <a href="/admin/academyPriceList">비용</a>
                <a href="/admin/academyCouponList">쿠폰</a>
            </div>
            <div class="tab3 tab <c:if test="${fn:contains(path, '/admin/situation')}" > active </c:if>">
            	<a href="/admin/situationClassList">클래스현황</a>
            	<a href="/admin/situationTeacherList">강사현황</a>
            	<a href="/admin/situationUserList">회원현황</a>
            </div>
            <div class="tab4 tab <c:if test="${fn:contains(path, '/admin/price')}" > active </c:if> "> 
            	<a href="/admin/priceClassList">클래스</a>
            	<a href="/admin/priceUserList">회원</a>
            	<a href="/admin/priceTeacherList">강사</a>
            	<a href="/admin/priceRefundList">환불</a>
            </div>
            <div class="tab5 tab <c:if test="${fn:contains(path, '/admin/statistic')}" > active </c:if>" >
            	<a href="/admin/statisticLoginList">로그인</a>
            	<a href="#">결제</a>
            </div>
            <div class="tab5 tab <c:if test="${fn:contains(path, '/admin/message')}">active</c:if>"> 
            	<a href="/admin/messageSmsContentList">문자 컨텐츠</a> 
            	<a href="/admin/messageSmsSendList">문자발송결과</a> 
            	<a href="#"></a> 
            	<a href="#"></a> 
            </div> 
            <div class="tab6 tab">
            	<a href="/admin/bbsNoticeList">공지사항</a>
            </div>
            <div class="tab7 tab <c:if test="${path eq '/admin/codeList'}" > active </c:if>">
            	<a href="/admin/codeList">공통코드</a>
            </div><!--e:tab-->
        </div><!--e:tabs-content-->
    </div><!--e:inner-->
</nav>

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


