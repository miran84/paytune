$(function() {
	
	$("#5000").addClass('on');
    $("#5000_sub").addClass('on');
    $("#5002").addClass('on');
});

var fnHold = function(){
	var frm = $("#frm")[0];
	frm.action = "/settlement/settlement_all_hold.do";
	frm.submit();
}