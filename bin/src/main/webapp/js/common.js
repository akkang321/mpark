//팝업창 열기
function openPopup( url, frm, popName, wid, hig ) {

	var winHeight = document.body.clientHeight;		// 현재창의 높이
	var winWidth = document.body.clientWidth;		// 현재창의 너비
	var winX = window.screenLeft;					// 현재창의 x좌표
	var winY = window.screenTop;					// 현재창의 y좌표
	var popX = winX + ( winWidth - wid ) / 2;
	var popY = winY + ( winHeight - hig ) / 2;

	window.open( 'about:blank', popName, 'scrollbars=no,width='+wid+'px,height='+hig+'px,top=' + popY + ',left=' + popX );
	frm.action = url;
	frm.target =popName;
	frm.method ="post";
	frm.submit();
}

//Map String -> Object ({data=data} -> {data:data})
function mapStringToObject(mapString) {

	var substrData = mapString.substr(1, mapString.length -2);
	var splitData = substrData.split(',');
	var objData = {};

	for(i in splitData) {
		var spData = splitData[i].split('=');
		objData[spData[0].trim()] = spData[1].trim();
	}

	return objData;
}

function today(monthNum){

	var date = new Date();
	var year = date.getFullYear();
	var month = new String(date.getMonth()+1);
	if(monthNum) var month = new String(date.getMonth()+1+monthNum);
	var day = new String(date.getDate());

	// 한자리수일 경우 0을 채워준다.
	if(month.length == 1){
		month = "0" + month;
	}
	if(day.length == 1){
		day = "0" + day;
	}

	return year + "-" + month + "-" + day;
}

function thisMonthFirstDay(){

	var date = new Date();
	var firstDate;

	firstDate = new Date(date.getFullYear(), date.getMonth(), 1);

	var year = firstDate.getFullYear();
	var month = new String(firstDate.getMonth()+1);
	var day = new String(firstDate.getDate());

	// 한자리수일 경우 0을 채워준다.
	if(month.length == 1){
		month = "0" + month;
	}
	if(day.length == 1){
		day = "0" + day;
	}

	return year + "-" + month + "-" + day;
}

function thisMonthLastDay(){

	var date = new Date();
	var lastDate;

	lastDate = new Date(date.getFullYear(), date.getMonth()+1, 0);

	var year = lastDate.getFullYear();
	var month = new String(lastDate.getMonth()+1);
	var day = new String(lastDate.getDate());

	// 한자리수일 경우 0을 채워준다.
	if(month.length == 1){
		month = "0" + month;
	}
	if(day.length == 1){
		day = "0" + day;
	}

	return year + "-" + month + "-" + day;
}

function selectboxYear(selectboxId) {

	var baseYear = 2019;
	var thisYear = new Date().getFullYear();

	$('#'+selectboxId).empty();

	for(var i=baseYear; i <= thisYear; i++) {

		$('#'+selectboxId).append('<option value="'+i+'">'+i+' 년</option>');
	}

	$('#'+selectboxId).val(thisYear);
}

function selectboxMonth(selectboxId) {

	$('#'+selectboxId).empty();

	for(var i=1; i <= 12; i++) {

		$('#'+selectboxId).append('<option value="'+i+'">'+i+' 월</option>');
	}

	var thisMonth = new Date().getMonth()+1;

	$('#'+selectboxId).val(thisMonth);
}

function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}

function numberFormat(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function $ComTimer(){
    //prototype extend
}

$ComTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
        this.comSecond--;					// 1초씩 감소
        this.domId.innerText = m;
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            $("#authBtn").attr('disabled', false);
            $("#authBtn").text('인증번호 받기');
            $("#authBtn").css('backgroundColor', '#ff6600');
        }
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
}

function deleteById(id){
	var element = document.getElementById(id);
	element.parentNode.removeChild(element);
}

function getDateStr(date){
    var sYear = date.getFullYear();
    var sMonth = date.getMonth() + 1;
    var sDate = date.getDate();

    sMonth = sMonth > 9 ? sMonth : "0" + sMonth;
    sDate  = sDate > 9 ? sDate : "0" + sDate;
    return sYear + sMonth + sDate;
}

