<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/modal/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/modal/css/bootstrap.css">

<script src="/fullcalendar/main.js"></script>
<link rel="stylesheet" href="/fullcalendar/main.css">
 
<script>
var temp = "";

document.addEventListener('DOMContentLoaded', function() {
	if ("${classInfo.C_ID}" != ""){
		
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
	         select: function(arg) {
				$('#timeModal').modal('show');
				$("#timeSave").unbind("click").bind("click",function(){
					let startTime = $("#startTime").val();
					let endTime = $("#endTime").val();
					let startTimes = startTime.split(":");
					let endTimes = endTime.split(":");
	                 
	                if (startTime == "" || endTime ==""){
	                     alert("시간을 입력하세요.");
					} else if(new Date(endTime)- new Date(startTime) < 0){ 
	                     alert("종료시간이 시작시간보다 먼저입니다.");
					} else { // 정상적인 입력 시
						const day = new Date(arg.start);
						let sTime = new Date(day.getFullYear(),day.getMonth(),day.getDate(),startTimes[0],startTimes[1])
						let eTime = new Date(day.getFullYear(),day.getMonth(),day.getDate(),endTimes[0],endTimes[1])

						const data = {	"cId":"${classInfo.C_ID}"
										,"scheduleDate":getDateStr(day)
										,"startTime":startTime
										,"endTime":endTime
									 }
						$.ajax({
							url: "/admin/academyClassScheduleInsert",
							type: "POST",
							data: data,
							dataType: "json",
							success: function( result ){
								if (result>0){
									calendar.addEvent({
										id : result,
										title: startTime+"-"+endTime,
										start: sTime,
										end: eTime
									})
								} else {
									alert("저장 실패")
								}
							}
						})
	                }

	                $('#timeModal').modal('hide');
	             });
	         },
	         events:[ 
	        	 <c:forEach var="list" items="${classScheduleList}" varStatus="status">
	        	 	<c:if test="${status.index != 0}">
	        	 		,
	        	 	</c:if>
	        		{
	                     id : '${list.S_ID}',
	                     title : '${list.START_TIME}'+"-"+'${list.END_TIME}',
	                     start : new Date('${list.START_DATE}'),
	                     end : new Date('${list.END_DATE}')
	                 }	
	        	 </c:forEach>
             ],
	         eventClick: function(arg) {
	             if (confirm('일정을 삭제하겠습니까?')) {
	            	 const data = {	"sId":arg.event._def.publicId};
	            	 $.ajax({
							url: "/admin/academyClassScheduleDelete",
							type: "POST",
							data: data,
							dataType: "json",
							success: function( result ){
								if (result>0){
									alert("삭제 성공");
									arg.event.remove();
								} else {
									alert("삭제 실패");
								}
							}
						})
	             }
	         },
	         dayMaxEvents: true, 
	         editable: false, // false로 변경 시 draggable 작동 x 
	         displayEventTime: false // 시간 표시 x

	    });
	    calendar.render();
	}
});

function academyClassList(){ 
	$("#frm").attr("action", "/admin/academyClassList");
	$("#frm").submit();
}; 

function chageType(){ 
	if ($("[name=classType]:checked").val() == 'C060200'){ 
		$("#cPId").show();
	} else { 
		$("#cPId").val("0");
		$("#cPId").hide();
	} 
} 

function classInfoSave(){ 

	if (!$('#className').val()) {
		alert('클래스명을 입력하세요.')
		$('#className').focus();
		return false;
	}
	
	var url = "";
	if ("${classInfo}" != ""){ 
		url = "/admin/academyClassUpdate";
	} else { 
		url = "/admin/academyClassInsert";
	}
	
	var data = $("#frm").serialize();
	$.ajax({
		url: url,
		type: "POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("저장 완료");
				if ("${classInfo}" == ""){
					$("#cId").val(result);
					$("#frm").attr("action", "/admin/academyClassInfo")
					$("#frm").submit();	
				}
			} else {
				alert("저장 실패")
			}
		}
	})
}

function classInfoDelete(cId){
	var data = $("#frm").serialize();
	$.ajax({
		url:"/admin/academyClassDelete",
		type:"POST",
		data: data,
		dataType: "json",
		success: function( result ){
			if (result>0){
				alert("삭제 완료");
				academyClassList();
			} else {
				alert("삭제 실패");
			}
		}
	})
	
}
</script>

<form id="frm" method="post" action="" >
	<input type="hidden" id="cId" name="cId" value="${classInfo.C_ID}">
	<div class="searchWrap2">
	    <div class="name searchBox">
	        <h2>클래스명</h2>
	        <input type="text" id="className" name="className" value="${classInfo.CLASS_NAME}">
	    </div><!--e:searchBox-->
	
	    <div class="tell searchBox">
	        <h2>담당강사</h2>
	        <select name="tId" id="tId">
				<c:forEach var="list" items="${teacherList}">
				<option value="${list.T_ID}" <c:if test="${list.T_ID == classInfo.T_ID }"> selected="selected"</c:if>>${list.TEACHER_NAME}</option>
				</c:forEach>
			</select>
	    </div><!--e:searchBox-->
	
	    <div class="mail searchBox">
	        <h2>클래스레벨</h2>
	        <select name="classLevel" id="classLevel">
				<c:forEach var="list" items="${levelList}">
					<option value="${list.CODE_ID}" <c:if test="${list.CODE_ID == classInfo.CLASS_LEVEL }"> selected="selected"</c:if>>${list.CODE_NAME}</option>
				</c:forEach>
			</select>
	    </div><!--e:searchBox-->
	    
	    <div class="searchBox">
	      <h2>클래스상태</h2>
	        <select name="classState" id="classState">
				<c:forEach var="list" items="${stateList}">
					<option value="${list.CODE_ID}" <c:if test="${list.CODE_ID == classInfo.CLASS_STATE }"> selected="selected"</c:if>>${list.CODE_NAME}</option>
				</c:forEach>
			</select>
	    </div><!--e:searchBox-->
	    
	    <div class="searchBox">
	      <h2>강의실</h2>
	        <select name="classRoom" id="classRoom">
				<c:forEach var="list" items="${roomList}">
					<option value="${list.CODE_ID}" <c:if test="${list.CODE_ID == classInfo.CLASS_ROOM }"> selected="selected"</c:if>>${list.CODE_NAME}</option>
				</c:forEach>
			</select>
	    </div><!--e:searchBox-->
	    
	    <div class="searchBox">
	        <h2>인원수</h2>
	        <input type="text" id="userCnt" name="userCnt" value="${classInfo.USER_CNT}">
	    </div><!--e:searchBox-->
	    
	    
	    <div class="searchBox" style="width: 600px;"> 
			<h2>유형</h2>
			<div class="id searchBox search-radioBox" style="width: 150px;">
		        <c:forEach var="list" items="${typeList}">
		       		<input class="search-radio" type="radio" name="classType" onchange="chageType();" value="${list.CODE_ID}" <c:if test="${list.CODE_ID == classInfo.CLASS_TYPE }">checked="checked"</c:if> >${list.CODE_NAME}
		        </c:forEach>
		    </div>
	    	<select name="cPId" id="cPId"  <c:if test="${classInfo.CLASS_TYPE =='C060100' || classInfo == null }">style="display: none;"</c:if> >
	    		<option value="0">선택</option>
				<c:forEach var="list" items="${classPriceList}">
					<option value="${list.C_P_ID}" <c:if test="${list.C_P_ID == classInfo.C_P_ID }">selected="selected"</c:if> >${list.C_PRICE_NAME}</option>
				</c:forEach>
			</select>
		</div>
	</div><!--e:addImgWrap-->

	<div class="btnWrap">
	    <button type="button" class="confirmBtn" onclick="classInfoSave()">확인</button>
	    <c:if test="${classInfo.C_ID != null and classInfo.C_ID !=''}">
		    <button type="button" class="deleteBtn" onclick="classInfoDelete('${classInfo.C_ID }')">삭제</button>
	    </c:if>
	    <button type="button" class="cancelBtn" onclick="academyClassList()">취소</button>
	</div><!--e:btnWrap-->
	<br/><br/>
	<div id="calendar"></div>
	
	<div class="modal fade" id="timeModal" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
				<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalLabel">시간설정</h5>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
				<div class="modal-body">
					<div class="mb-3">
		            	<label for="recipient-name" class="col-form-label">시작시간:</label>
		            	<input type="time" id="startTime" class="form-control" >
		            	<label for="message-text" class="col-form-label">종료시간:</label>
		            	<input type="time" id="endTime" class="form-control" >
		          	</div>
		      </div>
		      	<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" id="timeSave" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
</form>




