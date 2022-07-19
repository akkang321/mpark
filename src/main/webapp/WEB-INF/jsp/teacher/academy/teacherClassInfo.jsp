<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        	 <c:forEach var="list" items="${ classUserInfoSchedule }" varStatus="status"> 
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


<form id="frm" name="frm" method="POST">
<input type="hidden" id="tId" name="tId" value="">

	<div id="calendar"></div>
<br><br><br><br><br>
	    <table class="tableWrap">
	    
    	<tr>
        	<th>회원ID</th>
        	<th>회원명</th>
        	<th>미참석</th>
    	</tr>
    <c:forEach var="list" items="${ classUserList }">
		<tr>
			<td>${ list.U_ID }</td>
			<td>${ list.USER_NAME }</td>
			<td>${ list.JOIN_STATE }</td>
		</tr>
	</c:forEach>

         <c:if test="${ classUserList.size() == 0 }"> 
			<tr>
				<td align="center" colspan="8">No Data</td> 
			</tr>
		</c:if>
        
	</table><!--e:tableWrap-->
	
</form>


