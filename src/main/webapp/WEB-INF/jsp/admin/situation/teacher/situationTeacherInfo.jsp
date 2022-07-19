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
        	 <c:forEach var="list" items="${situationTeacherScheduleInfo}" varStatus="status">
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
		$("#frm").attr("action", "/admin/situationClassList");
		$("#frm").submit();
	}
</script>


<form id="frm" method="POST">
<!-- 
   	<div style="font-size:15px;">
    	클래스명 : ${ sClassInfo.CLASS_NAME }
	</div>
	<br/>
    <div style="font-size:15px;"> 
    	강사명 : ${ sClassInfo.TEACHER_NAME }
	</div>
<br/>
    <div style="font-size:15px;">
    	시간 : ${ sClassInfo.SCHEDULE_DATE } - ${ sClassInfo.START_TIME } ~ ${ sClassInfo.END_TIME }
	</div>
	<br/><br/><br/>
	<div style="font-size:15px;">
		참가인원
	</div>
<br/>
-->
	<div class="searchWrap">
		<div class="name searchBox">
		<h2>강사명 : ${ teacherName.TEACHER_NAME }</h2>
		</div><!--e:searchBox-->
	</div><!--searchWrap-->

	<div id="calendar"></div>

	<br><br><br><br>


    <table class="tableWrap">

    	<tr>
        	<th>클래스명</th>
        	<th>기간</th>
        	<th>스케쥴 총 건수</th>
       		<th>스케쥴 마감 수</th>
        	<th>스케쥴 진행중</th>
        	<th>클래스마감여부</th>
    	</tr>

        <c:forEach var="list" items="${situationTeacherInfo}">
        	<tr>
        		<!--<td><a href="javascript:userInfo()">${list.U_ID}</a></td>-->
            	<td><div>${list.CLASS_NAME}</div></td>
                <td><div>${list.START_DATE} ~ ${list.END_DATE}</div></td>
                <td><div>${list.TOTLE_CNT}</div></td>
                <td><div>${list.FINISH_CNT}</div></td>
                <td><div>${list.NOW_CNT}</div></td>
                <td><div>${list.CLASS_STATE}</div></td>
           	</tr>
        </c:forEach>
        <c:if test="${situationTeacherInfo.size() == 0 }">
        	<tr>
            	<td colspan="6">No Data</td>
        	</tr>
        </c:if>

	</table><!--e:tableWrap-->

<c:import url="page.jsp" />

</form>


