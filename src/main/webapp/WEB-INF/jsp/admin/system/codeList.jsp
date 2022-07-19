<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="KO">
<head>
<script type="text/javaScript">
function goPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#frm").attr("action","/admin/codeList");
	$("#frm").submit();
}

function searchList(){
	$("#frm").attr("action","/admin/codeList");
	$("#frm").submit();
}

function ajaxCodeInfo(codeId){
	var data = { "codeId": codeId};
	$.ajax({
		type: "post",
		url: "/admin/codeInfo",
		datatype:"json",
		data: data,
		success:function( result ) {
			$("#codeId").val(result.CODE_ID);
			$("#codeName").val(result.CODE_NAME);
			$("#codeDesc").val(result.CODE_DESC);
			$("#codeLevel").val(result.CODE_LEVEL);
			$("#parentCode").val(result.PARENT_CODE);
			$("#etc1").val(result.ETC1);
			$("#etc2").val(result.ETC2);
			$("#etc3").val(result.ETC3);
			$("#saveType").val("U");
			$('#codeId').prop('readonly', true);
			
			$("#insertBtn").hide();
			$("#refreshBtn").show();
			$("#updataBtn").show();
			$("#deleteBtn").show();
		}
	});
}

function ajaxCodeSave(){
//	console.log($("#frm").validate());
	var data = $("#frm").serialize();
	$.ajax({
		type: "post",
		url: "/admin/codeSave",
		datatype:"json",
		data: data,
		success:function( result ) {
			if (result>0){
				alert("저장 성공");
				searchList();
			} else {
				alert("저장 실패");
			}
		}
	});
}

function ajaxCodeDelete(){
	var data = $("#frm").serialize();
	$.ajax({
		type: "post",
		url: "/admin/codeDelete",
		datatype:"json",
		data: data,
		success:function( result ) {
			if (result>0){
				alert("삭제 성공");
				searchList();
			} else {
				alert("삭제 실패");
			}
		}
	});
}

function deleteData(){
	$("#frm").attr("action","/admin/codeDelete");
	$("#frm").submit();
}

function clickBtn(type){
	if (type == "R"){
		$("#codeId").val("");
		$("#codeName").val("");
		$("#codeDesc").val("");
		$("#parentCode").val("");
		$("#codeLevel").val("");
		$("#etc1").val("");
		$("#etc2").val("");
		$("#etc3").val("");
		$("#saveType").val("I");
		$('#codeId').prop('readonly', false);
		
		$("#insertBtn").show();
		$("#refreshBtn").hide();
		$("#updataBtn").hide();
		$("#deleteBtn").hide();
	} else if (type == "D"){
		ajaxCodeDelete();
	} else {
		ajaxCodeSave();
	}

}
</script>
</head>
<form id="frm" method="post" action="">
<input type="hidden" id="saveType" name="saveType" value="I">
	<div class="searchWrap">
	    <div class="id searchBox">
	        <h2>코드ID</h2>
	        <input type="text" name="sCodeId" value="${param.sCodeId}">
	    </div><!--e:searchBox-->
	
	    <div class="name searchBox">
	        <h2>코드명</h2>
	        <input type="text" name="sCodeName"	value="${param.sCodeName}" >
	    </div><!--e:searchBox-->
	
	    <div class="name searchBox">
	        <h2>부모코드</h2>
	        <input type="text" name="sParentCode" value="${param.sParentCode}">
	    </div><!--e:searchBox-->
	
	    <button type="button" class="searchBtn" onclick="searchList();">검색</button>
	
	</div><!--searchWrap-->
	
	<div class="tableDouble">
	    <div class="tableCover">
	        <table class="tableWrap">
	            <tr>
	                <th>코드ID</th>
	                <th>코드명</th>
	                <th>코드순위</th>
	                <th>코드레벨</th>
	                <th>부모코드</th>
	                <th>기타1</th>
	                <th>기타2</th>
	                <th>기타3</th>
	            </tr>
	            <c:forEach var="list" items="${codeList}">
					<tr>
						<td><a href="javascript:ajaxCodeInfo('${list.CODE_ID}')">${list.CODE_ID}</a></td>
						<td>${list.CODE_NAME}</td>
						<td>${list.CODE_DESC}</td>
						<td>${list.CODE_LEVEL}</td>
						<td>${list.PARENT_CODE}</td>
						<td>${list.ETC1}</td>
						<td>${list.ETC2}</td>
						<td>${list.ETC3}</td>
					</tr>
				</c:forEach>
	        </table><!--e:tableWrap-->
	<c:import url="page.jsp" />
	    </div><!--e:tableCover-->
	
	    <h1 class="center-title-h1">코드상세</h1>
	    <div class="searchWrap searchWrap4">
	
	        <div class="id searchBox">
	            <h2>코드ID</h2>
	            <input type="text" id="codeId" name="codeId" maxlength="7">
	        </div><!--e:searchBox-->
	
	        <div class="name searchBox">
	            <h2>코드명</h2>
	            <input type="text" id="codeName" name="codeName" maxlength="33" >
	        </div><!--e:searchBox-->
	
	        <div class="tell searchBox">
	            <h2>코드순위</h2>
	            <input type="text" id="codeDesc" name="codeDesc" oninput="value=value.replace(/[^\d]/g,'')" >
	        </div><!--e:searchBox-->
	
			<div class="tell searchBox">
                <h2>코드레벨</h2>
                <input type="text" id="codeLevel" name="codeLevel" maxlength="2"  oninput="value=value.replace(/[^\d]/g,'')" >
            </div><!--e:searchBox-->
	
	        <div class="tell searchBox">
	            <h2>부모코드</h2>
	            <input type="text" id="parentCode" name="parentCode" maxlength="7" >
	        </div><!--e:searchBox-->
	
	        <div class="tell searchBox">
	            <h2>기타1</h2>
	            <input type="text" id="etc1" name="etc1" maxlength="33">
	        </div><!--e:searchBox-->
	
	        <div class="tell searchBox">
	            <h2>기타2</h2>
	            <input type="text" id="etc2" name="etc2" maxlength="33">
	        </div><!--e:searchBox-->
	
	        <div class="tell searchBox">
	            <h2>기타3</h2>
	            <input type="text" id="etc3" name="etc3" maxlength="33">
	        </div><!--e:searchBox-->
	
	    </div><!--searchWrap-->
	
	    <div class="btnWrap">
	    	<button id="insertBtn" onclick="clickBtn('I');return false;"  class="confirmBtn">신규</button>
			<button id="refreshBtn" onclick="clickBtn('R');return false;"  class="confirmBtn" style="display: none;">초기화</button>
			<button id="updataBtn" onclick="clickBtn('U');return false;" class="deleteBtn" style="display: none;">저장</button>
			<button id="deleteBtn" onclick="clickBtn('D');return false;" class="cancelBtn" style="display: none;">삭제</button>
	    </div><!--e:btnWrap-->
	</div><!--e:tableDouble-->
</form>

