<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/fullcalendar/main.js"></script>
<link rel="stylesheet" href="/fullcalendar/main.css">

<script>
document.addEventListener('DOMContentLoaded', function() { 
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	 headerToolbar: {
             left: 'prevYear,prev,next,nextYear today',
             center: 'title',
             right: 'dayGridMonth,dayGridWeek,dayGridDay'
         },
         locale: "ko",
         navLinks: true, // can click day/week names to navigate views
         selectable: true,
         selectMirror: true,
         buttonText: {	today : "오늘",	month : "월별",week : "주별", day : "일별",},
         events:[ 
        	 <c:forEach var="list" items="${academyScheduleList}" varStatus="status">
        	 	<c:if test="${status.index != 0}">
        	 		,
        	 	</c:if>
        		{
                     id : '${list.S_ID}',
                     title : '${list.CLASS_NAME}'+'(${list.FN_TEACHER_NAME}) '+'${list.START_TIME}'+"-"+'${list.END_TIME}', 
                     start : new Date('${list.START_DATE}'),
                     end : new Date('${list.END_DATE}')
                 }	
        	 </c:forEach>
            ],
			dayMaxEvents: true, 
			editable: false, // false로 변경 시 draggable 작동 x 
			displayEventTime: false // 시간 표시 x

    });
    calendar.render();
});
</script>

<form id="frm" method="POST">
	<input type="hidden" id="cId" name="cId" value="">
	<div class="searchWrap">
    	<div class="id searchBox">
    	<h2>클래스명</h2>
    		<input type="text" id="sClassName" name="sClassName" value="${param.sClassName}" placeholder="">
        </div><!--e:searchBox-->

		<div class="name searchBox">
		<h2>담당강사</h2>
			<input type="text" id="sTeacherName" name="sTeacherName" value="${param.sTeacherName}" placeholder="">
		</div><!--e:searchBox-->

		<button type="submit" class="searchBtn">검색</button>

	</div><!--searchWrap-->

	<div id="calendar"></div>

	
</form>
