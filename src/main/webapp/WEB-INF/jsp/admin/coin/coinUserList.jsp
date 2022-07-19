<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function coinUserInfo(id){
		$("#id").val(id);
		$("#frm").attr("action", "/admin/coinUserInfo")
		$("#frm").submit();
	}
	
	function botState(id,state,check){

		if (state == 'Y' && check == 'Y' ){
			alert("봇이 시작상태에서 시작을 할수 없습니다. 먼저 정지 해주세요");
			return;
		}

		if (state == 'N' && check == 'N' ){
			alert("봇이 저이상태에서 정지 할수 없습니다. 먼저 시작 해주세요");
			return;
		}
		
		var data = {"id":id};
		var url = "/admin/updateScheduler";		
		if (state == 'N'){
			url = "/admin/pauseScheduler";
		}
		
		
		$.ajax({
			url: url,
			type: "POST",
			data: data,
			dataType: "json",
			success: function( result ){
				alert(result.res);
				$("#frm").attr("action", "/admin/coinUserList")
				$("#frm").submit();
			}
		})
	}

	function orderListCancle(id){
		
		var data = {"id":id};
		$.ajax({
			url: "/admin/orderListCancle",
			type: "POST",
			data: data,
			dataType: "json",
			success: function( result ){
				alert("ask="+result.askCnt+" bid="+result.bidCnt+" other="+result.otherCnt);
			}
		})
	}
	
</script>

<form id="frm" method="POST">
	<input type="hidden" id="id" name="id">
    <table class="tableWrap">
    	<tr>
        	<th>USER ID</th>
        	<th>API KEY</th>
        	<th>SEC KEY</th>
        	<th>상태</th>
        	<th>관리</th>
        	<th>내역삭제</th>
        	<th>생성날짜</th>
        	<th>수정날짜</th>
    	</tr>

        <c:forEach var="list" items="${coinUserList}">
        	<tr>
                <td><a href="javascript:coinUserInfo('${list.ID}')">${list.USER_ID}</a></td>
                <td>${list.API_KEY}</td>
                <td>${list.SCR_KEY}</td>
                <td>${list.BOT_STATE}</td>
                <td>
                	<input type="button" value="시작" onclick="botState('${list.ID}','Y','${list.BOT_STATE}');">
                	<input type="button" value="정지" onclick="botState('${list.ID}','N','${list.BOT_STATE}');">
                </td>
                <td>
                	<input type="button" value="내역 삭제" onclick="orderListCancle('${list.ID}');">
                </td>
                <td>${list.CREATE_DATE}</td>
                <td>${list.UPDATE_DATE}</td>
           	</tr>
        </c:forEach>
        
         <c:if test="${coinUserList.size() == 0 }">
			<tr>
				<td align="center" colspan="5">No Data</td>
			</tr>
		</c:if>
        
	</table><!--e:tableWrap-->
	
	<div class="newBtnBox">
        <button type="button" onclick="coinUserInfo();" class="newBtn">신규</button>
    </div>
	
</form>



