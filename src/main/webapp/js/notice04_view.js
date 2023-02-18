$(function() {
	
	$("#6000").addClass('on');
    $("#6000_sub").addClass('on');
    $("#6005").addClass('on');

});

var frmMod = function(val){
	
	var frm = $("#frm")[0];
	frm.action = "/notice/notice04_write.do";
	frm.submit();
}
