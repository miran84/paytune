$(function() {
	
	$("#8000").addClass('on');
    $("#8000_sub").addClass('on');
    $("#8001").addClass('on');
    
    $("#frm").validate({
    	rules: { 
    		ceo: { required : true},
    		phone_num: { required : true, maxlength : 13, telnum: true},
    	}, 
    	//규칙체크 실패시 출력될 메시지
		messages : { 
			phone_num: { telnum : "핸드폰 번호가 잘못되었습니다."},
		},
    	
    	submitHandler : function(form){
    		
    		var arr_key;
    		var i = 0 ; 
    		
    	    $("input[name=menu_id]").each(function(){
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
    	    	alert("권한을 하나이상 선택하세요!");
    	    	return;
    	    }
    	    
    		var frm = $("#frm")[0];
    		frm.arr_check_id.value = arr_key;
    		frm.action = "/setup/setupMod.do";
    		frm.submit();
        }
		
    });

    // 유효성 체크
    $.validator.addMethod("telnum", function(telnum, element){
      var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
      if(!pattern.test(telnum)){
        return this.optional(element)||false;
      }
      return true;
    });    
    
});


var fnSubmit = function(){
	$("#frm").submit();
}
