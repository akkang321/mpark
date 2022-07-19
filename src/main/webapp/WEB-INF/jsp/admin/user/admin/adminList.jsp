<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function goPage(pageNo){
		$("#pageNo").val(pageNo);
		$("#frm").attr("action", "/admin/userList");
		$("#frm").submit();
	}

	function adminInfo(uId){
		$("#uId").val(uId);
		$("#frm").attr("action", "/admin/adminInfo");
		$("#frm").submit();
	}
</script>

<form id="frm" method="POST" action="/admin/userList">
<input type="hidden" id="uId" name="uId">
    <table class="tableWrap">
    	<tr>
        	<th>관리자ID</th>
        	<th>이름</th>
        	<th>핸드폰</th>
       		<th>메일</th>
    	</tr>

        <c:forEach var="list" items="${ adminList }">
        	<tr>
            	<td><a href="javascript:adminInfo('${list.U_ID}')">${list.U_ID}</a></td>
                <td><a href="javascript:adminInfo('${list.U_ID}')">${list.USER_NAME}</a></td>
                <td><a href="javascript:adminInfo('${list.U_ID}')">${list.PHONE}</a></td>
                <td><a href="javascript:adminInfo('${list.U_ID}')">${list.EMAIL}</a></td>
           	</tr>
        </c:forEach>

	</table><!--e:tableWrap-->
		<div class="newBtnBox">
        <button type="button" onclick="adminInfo();" class="newBtn">신규</button>
    </div>
</form>

