<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function classInfo(cId){
		$("#cId").val(cId);
		$("#frm").attr("action", "/admin/academyClassInfo")
		$("#frm").submit();
	}
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


    <table class="tableWrap">
    	<tr>
        	<th>클래스명</th>
        	<th>담당강사</th>
        	<th>클래스레벨</th>
        	<th>클래스유형</th>
        	<th>인원수</th>
        	<th>상태</th>
       		<th>시작일</th>
        	<th>종료일</th>
    	</tr>

        <c:forEach var="list" items="${classList}">
        	<tr>
                <td><a href="javascript:classInfo('${list.C_ID}')">${list.CLASS_NAME}</a></td> 
            	<td><a href="javascript:classInfo('${list.C_ID}')">${list.FN_TEACHER_NAME}</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">${list.FN_CLASS_LEVEL}</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">${list.FN_CLASS_TYPE}</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">${list.USER_CNT}</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">${list.FN_CLASS_STATE}</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">추후추가</a></td> 
                <td><a href="javascript:classInfo('${list.C_ID}')">추후추가</a></td> 
           	</tr>
        </c:forEach>

         <c:if test="${classList.size() == 0 }">
			<tr>
				<td align="center" colspan="8">No Data</td>
			</tr>
		</c:if>
        
	</table><!--e:tableWrap-->
	<c:import url="page.jsp" />
	
	<div class="newBtnBox">
        <button type="button" onclick="classInfo();" class="newBtn">신규</button>
    </div>

</form>


