$(function() {
	
	$("#5000").addClass('on');
    $("#5000_sub").addClass('on');
    $("#5001").addClass('on');
    
    calendar_data('0');
});

var jsStoreId = function(){
	
	if($("#store_id").val() == ''){
		alert('가맹점ID를 검색해주세요!');
		$("#store_id").focus();
		return;
	}
	
	var param = new Object();
	param.store_id 			 = $("#store_id").val();

	$.ajax({
	    url:  '/settlement/storeid_search.do',
	    type: 'POST',
	    data: param,
	    success: function(data){
	    	
	    	if(data == 'none'){
	    		alert('가맹점 ID가 없습니다.');
	    	}else{
	    		$("#storeIdNm").text(data);
	    	}
	    },
	    error: function(e){
	        alert(e.reponseText);
	    },
	    complete: function() {
	    }
	});
}

var jsCalendar = function(val){
	
	var param = new Object();
	
	if($("#store_id").val() == ''){
		alert('가맹점ID를 검색해주세요!');
		$("#store_id").focus();
		return;
	}
	
	param.yyyy			 	 = $("#yyyy2").val();
	param.ym 				 = $("#yyyy2").val()+val;
	param.store_id 			 = $("#store_id").val();
	param.role_id 			 = $("#role_id").val();
	
	$.post("calendar_data.do", param, function(data) {
		$("#calendar_data").html(data);
	});
}


var calendar_data = function(val){
	
	if(val == '1'){
		if($("#store_id").val() == ''){
			alert('가맹점ID를 검색해주세요!');
			$("#store_id").focus();
			return;
		}	
	}
	
	var param = new Object();
	param.yyyy			 	 = $("#yyyy").val();
	param.ym 				 = $("#yyyy").val()+$("#mm").val();
	param.store_id 			 = $("#store_id").val();
	param.role_id 			 = $("#role_id").val();
	
	$.post("calendar_data.do", param, function(data) {
		$("#calendar_data").html(data);
	});
}