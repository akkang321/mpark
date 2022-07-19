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
        	 <c:forEach var="list" items="${situationUserScheduleInfo}" varStatus="status">
        	 	<c:if test="${status.index != 0}">
        	 		,
        	 	</c:if>
        		{
                     id : '${list.S_ID}',
                     title : '${list.CLASS_NAME}'+'(${list.TEACHER_NAME}) '+'${list.START_TIME}'+"-"+'${list.END_TIME}', 
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


<script>
	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/situationUserList"); 
		$("#frm").submit();
	}
</script>


<form id="frm" method="POST">
<input id="uId" name="uId" type="hidden" value="" />
	<div class="searchWrap">
		<div class="name searchBox">
		<h2>회원명 : ${ userName.USER_NAME }</h2>
		</div><!--e:searchBox-->
	</div><!--searchWrap-->

	<div id="calendar"></div>

	<br><br><br><br>

    <table class="tableWrap">

    	<tr>
        	<th>클래스</th>
        	<th>기간</th>
        	<th>참가건수(예약한 스케쥴 Total)</th>
    	</tr>

        <c:forEach var="list" items="${ situationUserInfo }"> 
        	<tr>
            	<td>${list.CLASS_NAME}</td>
                <td>${list.START_DAY} ~ ${list.END_DAY}</td>
                <td>${list.SCHEDULE_TOL}</td>
           	</tr>
        </c:forEach>

        <c:if test="${ situationUserInfo.size() == 0 }">
        	<tr>
            	<td colspan="9">No Data</td>
       		</tr>
        </c:if>

	</table><!--e:tableWrap-->

	<c:import url="page.jsp" />

</form>


