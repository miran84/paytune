$(function() {
	
	$("#2000").addClass('on');
    $("#2000_sub").addClass('on');
    $("#2002").addClass('on');
    
	$("#frmMod").on("click", function(){
		var frm = $("#frm")[0];
		frm.action = "/manage2/manage2_modify.do";
		frm.submit();
	});
});

