$(function() {
	
	$("#6000").addClass('on');
    $("#6000_sub").addClass('on');
    $("#6001").addClass('on');

});

var frmMod = function(val){
	
	var frm = $("#frm")[0];
	frm.action = "/notice/notice07_write.do";
	frm.submit();
}
