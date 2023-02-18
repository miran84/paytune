$(function() {
	
	$("#6000").addClass('on');
    $("#6000_sub").addClass('on');
    $("#6003").addClass('on');
    
});

var frmMod = function(val){
    
	var frm = $("#frm")[0];
	frm.action = "/notice/notice02_write.do";
	frm.submit();
}
