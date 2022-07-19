<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function goPage(pageNo){ 
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/userList");
		$("#frm").submit();
	}

	function userInfo(uId){
		$("#uId").val(uId);
		$("#frm").attr("action", "/admin/userInfo")
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST" action="/admin/userList">
<input type="hidden" id="uId" name="uId">
	<div class="searchWrap">
    	<div class="id searchBox">
    	<h2>회원ID</h2>
    		<input type="text" name="sUId" value="${param.sUserId}" placeholder="">
        </div><!--e:searchBox-->

		<div class="name searchBox">
		<h2>이름</h2>
			<input type="text" name="sUserName" value="${param.sUserName}" placeholder="">
		</div><!--e:searchBox-->

		<div class="tell searchBox">
			<h2>핸드폰</h2>
			<input type="text" name="sPhone" value="${param.sPhone}" placeholder="">
		</div><!--e:searchBox-->

		<div class="searchBox">
		<h2>상태</h2>
		<select id="sUserState" name="sUserState" style="height:40px; width:220px">
  			<option value="">전체</option>
	  			<c:forEach var="list" items="${userStateList}" varStatus="status">
					<option value="${list.CODE_ID}" <c:if test="${param.sUserState == list.CODE_ID}">selected="selected"</c:if>>${list.CODE_NAME}</option>
				</c:forEach>
		</select>
		</div>
		
		<button type="submit" class="searchBtn">검색</button>

	</div><!--searchWrap-->


    <table class="tableWrap">
    	<tr>
        	<th>회원ID</th>
        	<th>이름</th>
        	<th>핸드폰</th>
       		<th>메일</th>
        	<th>성별</th>
        	<th>상태</th>
        	<th>가입날짜</th>
        	<th>수정날짜</th>
    	</tr>

        <c:forEach var="list" items="${ userList }">
        	<tr>
            	<td><a href="javascript:userInfo('${list.U_ID}')">${list.U_ID}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.USER_NAME}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.PHONE}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.EMAIL}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.FN_GENDER}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.FN_USER_STATE}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.CREATE_DATE}</a></td> 
                <td><a href="javascript:userInfo('${list.U_ID}')">${list.UPDATE_DATE}</a></td> 
           	</tr>
        </c:forEach>
        
        <c:if test="${userList.size() == 0 }">
			<tr>
				<td align="center" colspan="8">No Data</td>
			</tr>
		</c:if>

	</table><!--e:tableWrap-->
	<c:import url="page.jsp" />
</form>

