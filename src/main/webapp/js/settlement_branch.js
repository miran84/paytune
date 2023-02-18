
let period_date;
let cpid;

$(function() {
    $( ".date_form" ).datepicker({
		showOn: "both",
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        buttonImageOnly: false,
        showMonthAfterYear: true,
        hideIfNoPrevNext: true,
		dayNames: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
		dayNamesMin: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
	});
	
	$("#5000").addClass('on');
    $("#5000_sub").addClass('on');
    $("#5004").addClass('on');

    today('day');
    $("#pageUnit").val("20");
    settlement_branch_data();
});

var getDateStr = function(myDate){
	var year = myDate.getFullYear();
	var month = ("0"+(myDate.getMonth()+1)).slice(-2);
	var day = ("0"+myDate.getDate()).slice(-2);
	return ( year + '-' + month + '-' + day );
}

/* 오늘 날짜 */
var today = function(type) {
	var d = new Date();
//	return getDateStr(d);
	
	$("#start_datetime").val(getDateStr(d));
	$("#end_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}

/* 오늘로부터 며칠전 날짜 */
var prevDay = function(days, type) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var dayOfMonth = d.getDate();
	d.setDate(dayOfMonth - days);
	$("#start_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}

/* 오늘로부터 몇개월전 날짜 */
var prevMonth = function(month, type) {
	var d = new Date();
	$("#end_datetime").val(getDateStr(d));
	
	var monthOfYear = d.getMonth();
	d.setMonth(monthOfYear - month);
	$("#start_datetime").val(getDateStr(d));
	
	$("#day_type").val(type);
}


var doExcelDownload = function(){
	var arr_key;
	var i = 0 ; 
	
    $("input[name=check_id]").each(function(){
    	if($(this).is(":checked")){
        		if(i == 0) {
        			arr_key 			= $(this).attr("key").split(",");
        		}else{
        			arr_key 			+= "," + $(this).attr("key").split(",");
        		}
        		i++;
        	}
    });
    
    if(i == 0){
    	alert("하나이상 선택하세요!");
    	return;
    }
    
    var f = document.frm2;
    f.arr_check_id.value = arr_key;
	f.action = "/settlement/settlement_branch_excel.do";
	f.submit();
}

var settlement_branch_data = function(){
	
	var param = new Object();
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.bussincess_id		 = $("#bussincess_id").val();
	param.search_id2 		 = $("#search_id2").val();
	param.search_nm 		 = $("#search_nm").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.roleStore		 	 = $("#roleStore").val();
	param.high_store_id	 	 = $("#high_store_id").val();
	param.day_type		 	 = $("#day_type").val();
	param.order_id		 	 = $("#order_id").val();
	param.order_no		 	 = $("#order_no").val();
	
	$.post("settlement_branch_data.do", param, function(data) {
		$("#settlement_branch_data").html(data);
	});
}

var frmOrder = function(id){
	
	if($("#order_id").val() == ''){
	}else{
		if($("#order_id").val() == id && $("#order_no").val() == "1"){
			$("#order_no").val("2");
		}else if($("#order_id").val() == id && $("#order_no").val() == "2"){
			$("#order_no").val("1");
		}else{
			$("#order_no").val("1");
		}
	}
	
	$("#order_id").val(id);
	
	settlement_branch_data();
}

var settlement_branch_init = function(){
	$("#start_datetime").val('');
	$("#end_datetime").val('');
	$("#search_nm").val('');
}

/* pagination 페이지 링크 function */
var fn_link_page = function(pageNo){

	var param = new Object();
	param.pageIndex 		 = pageNo;
	param.start_datetime 	 = $("#start_datetime").val();
	param.end_datetime 		 = $("#end_datetime").val();
	param.bussincess_id		 = $("#bussincess_id").val();
	param.search_id2 		 = $("#search_id2").val();
	param.search_nm 		 = $("#search_nm").val();
	param.pageUnit 			 = $("#pageUnit").val();
	param.roleStore		 	 = $("#roleStore").val();
	param.high_store_id	 	 = $("#high_store_id").val();
	param.day_type		 	 = $("#day_type").val();
	param.order_no		 	 = $("#order_no").val();
	$.post("settlement_branch_data.do", param, function(data) {
		$("#settlement_branch_data").html(data);
	});
}

var detail = function(param1, param2){
	var param = new Object();
	param.period_date 		 = param1;
	param.cpid 				 = param2;
	
	period_date = param1;
	cpid = param2;
	
	$.post("settlement_branch_info.do", param, function(data) {
		$("#dim").html(data);
	});
}

var fn_link_page2 = function(pageNo){

	var param = new Object();
	param.pageIndex 	 = pageNo;
	param.pageUnit 		 = 10;		
	param.period_date	 = period_date;
	param.cpid 			 = cpid;
	$.post("settlement_branch_info.do", param, function(data) {
		$("#dim").html(data);
	});
}
