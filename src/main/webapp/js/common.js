(function ($) {
    $.fn.alphanumeric = function (p) {
        var input = $(this),
            az = "abcdefghijklmnopqrstuvwxyz_.",
            options = $.extend({
                ichars: '!@#$%^&*()+=[]\\\';,/{}|":<>?~`. ',
                nchars: '',
                allow: ''
            }, p),
            s = options.allow.split(''),
            i = 0,
            ch,
            regex;

//		$(this).attr({'style':'ime-mode:disabled'});
		$(this).css('ime-mode', 'disabled');


        for (i; i < s.length; i++) {
            if (options.ichars.indexOf(s[i]) != -1) {
                s[i] = '\\' + s[i];
            }
        }


        if (options.nocaps) {
            options.nchars += az.toUpperCase();
        }
        if (options.allcaps) {
            options.nchars += az;
        }


        options.allow = s.join('|');


        regex = new RegExp(options.allow, 'gi');
        ch = (options.ichars + options.nchars).replace(regex, '');


        input.keypress(function (e) {
            var key = String.fromCharCode(!e.charCode ? e.which : e.charCode);


            if (ch.indexOf(key) != -1 && !e.ctrlKey) {
                e.preventDefault();
            }
        });


        input.blur(function () {
            var value = input.val(),
                j = 0;


            for (j; j < value.length; j++) {
                if (ch.indexOf(value[j]) != -1) {
                    input.val('');
                    return false;
                }
            }
            return false;
        });


        return input;
    };


    $.fn.numeric = function (p) {
        var az = 'abcdefghijklmnopqrstuvwxyz',
            aZ = az.toUpperCase();


        return this.each(function () {
//            $(this).attr({'style':'ime-mode:disabled'});
			$(this).css('ime-mode', 'disabled');
            $(this).alphanumeric($.extend({ nchars: az + aZ }, p));
        });
    };


    $.fn.alpha = function (p) {
        var nm = '1234567890';
        return this.each(function () {
            $(this).alphanumeric($.extend({ nchars: nm }, p));
        });
    };
})(jQuery);

function popOpen( pW , pH , pUrl , pName ) {

	var pL = parseInt((window.screen.width-pW)/2); 							// ???????????????
	var pT = parseInt((window.screen.height-pH)/2); 						// ???????????????
	var pProp = 'width=' + pW + ',height=' + pH + ',scrollbars=yes,resizable=no,left=' + pL + ',top=' + pT + ',directories=no,status=no,menubar=no';

	var newWin = window.open( pUrl , pName, pProp );
	if (!newWin)
		alert('????????? ???????????? ????????? ?????????.');
	else
		newWin.focus();
}

function number_format(n) {
	var reg = /(^[+-]?\d+)(\d{3})/;   // ?????????
	n += '';                          // ????????? ???????????? ??????

	while (reg.test(n))
	n = n.replace(reg, '$1' + ',' + '$2');
	return n;
}

// ????????? ??????
function removeComma(s) {
    var rtn = parseFloat(s.replace(/,/gi, ""));
    if (isNaN(rtn)) {
        return 0;
    }
    else {
        return rtn;
    }
}

function phone_chk(ph)
{
    var pattern = new RegExp(/^[0-9-+]+$/); //???????????? ??????
	/*
  ??????
    var pattern = new RegExp(/^[a-z0-9_]+$/); //????????? ??????
  ??????

    var pattern = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/); //?????? ?????? ??????

  ??????

    var pattern = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/); //????????? ?????? ??????
	*/

   return pattern.test(ph);
}

function mail_chk(ph)
{
	var pattern = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/); //????????? ?????? ??????
	return pattern.test(ph);
}


function nick_check(vals){

	var str = document.getElementById(vals);



	if( str.value == '' || str.value == null ){
		alert( '???????????? ??????????????????' );
		return;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( str.value.replace( blank_pattern, '' ) == "" ){
		alert('???????????? ????????? ????????????????????? ');
		return;
	}


//?????? ??????
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test( str.value) == true){
		alert('???????????? ????????? ????????? ??? ????????????. ');
		return;
	}

	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(str.value) == true ){
		alert('???????????? ??????????????? ????????? ??? ????????????.');
		return;
	}

	//alert( '?????? : ' + str.value );

	/*
	if( str.value.search(/\W|\s/g) > -1 ){
		alert( '???????????? ?????? ????????? ????????? ??? ????????????.' );
		str.focus();
		return false;
	}*/



}


function check(f) {
  var len;
  var str = f.value;
  str = str.replace(/,/g,'');
  var str1 = '';

  len = str.length;

  if(len>3) {
    for(var i=0;len-i-3>0;i+=3) {
      str1 = ','+str.substring(len-3-i,len-i)+str1;
    }
    str1 = str.substring(0,len-i)+str1;
    f.value = str1;
  }
}

function fc_chk_byte(memo, num)
 {
	var str = memo.name;
	var ari_max=num;
	var ls_str = memo.value; // ???????????? ????????? ???????????? value ???
	var li_str_len = ls_str.length; // ????????????

	// ???????????????
	var li_max = ari_max; // ????????? ????????? ??????
	var i = 0;     // for?????? ??????
	var li_byte = 0;  // ?????????????????? 2 ???????????? 1??? ??????
	var li_len = 0;  // substring?????? ????????? ??????
	var ls_one_char = ""; // ???????????? ????????????
	var ls_str2 = ""; // ???????????? ???????????? ???????????? ?????????????????? ????????????.

  for(i=0; i< li_str_len; i++)
  {
   // ???????????????
   ls_one_char = ls_str.charAt(i);

    li_byte++;
   // ?????? ????????? li_max??? ???????????????
   if(li_byte <= li_max){
    li_len = i + 1;
   }
  }

	document.getElementById(str+"_num").innerHTML = li_len;
	// ??????????????? ????????????
	if(li_byte > li_max){
		alert(num+" ?????? ?????? ???????????? ????????????. \n ????????? ????????? ???????????? ?????? ?????????. ");
		ls_str2 = ls_str.substr(0, li_len);
		document.getElementById(str+"_num").innerHTML = li_max;
		memo.value = ls_str2;
	}
	memo.focus();
}


function fc_chk_byte_en(memo, num)
 {
  var ari_max=num;
  var ls_str = memo.value; // ???????????? ????????? ???????????? value ???
  var li_str_len = ls_str.length; // ????????????

  // ???????????????
  var li_max = ari_max; // ????????? ????????? ??????
  var i = 0;     // for?????? ??????
  var li_byte = 0;  // ?????????????????? 2 ???????????? 1??? ??????
  var li_len = 0;  // substring?????? ????????? ??????
  var ls_one_char = ""; // ???????????? ????????????
  var ls_str2 = ""; // ???????????? ???????????? ???????????? ?????????????????? ????????????.

  for(i=0; i< li_str_len; i++)
  {
   // ???????????????
   ls_one_char = ls_str.charAt(i);

   // ???????????? 2??? ?????????.
   if (escape(ls_one_char).length > 4) {
    li_byte += 2;
   }else{   // ????????? ????????? 1??? ?????????.
    li_byte++;
   }
   // ?????? ????????? li_max??? ???????????????
   if(li_byte <= li_max){
    li_len = i + 1;
   }
  }

  // ??????????????? ????????????
  if(li_byte > li_max){
   alert("The contents are limited to "+num+" bytes. Excess contents will be deleted automatically.");
   ls_str2 = ls_str.substr(0, li_len);
   memo.value = ls_str2;
  }
  memo.focus();
 }

 function fc_chk2()
 {
  if(event.keyCode == 13)
  event.returnValue=false;
 }



function check_ext(str){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.jpg|.jpeg|.gif|.png)/)) {
             // ok
         }else{
            alert(".?????????????????? ??????????????? ?????????.")
            event.srcElement.select();
             //document.selection.clear();

			if (document.getSelection) { // for Firefox
				 str.value = '';
			 } else if (document.selection && document.selection.createRange) { // for IE
				 str.select();
				if (document.selection) {
					document.selection.clear(); // IE
				} else {
					window.getSelection().removeAllRanges();
				}
			}

             return false;
         }
     }
 }

function check_exe(str){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.exe)/)) {
            alert(".exe????????? ????????? ???????????????.")
            event.srcElement.select();
             //document.selection.clear();

			if (document.getSelection) { // for Firefox
				 str.value = '';
			 } else if (document.selection && document.selection.createRange) { // for IE
				 str.select();
				if (document.selection) {
					document.selection.clear(); // IE
				} else {
					window.getSelection().removeAllRanges();
				}
			}

             return false;
         }
     }
 }

function check_ext_ai(str){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.ai)/)) {
             // ok
         }else{
            alert("AI?????????????????? ??????????????? ?????????.")
            event.srcElement.select();
             //document.selection.clear();

			if (document.getSelection) { // for Firefox
				 str.value = '';
			 } else if (document.selection && document.selection.createRange) { // for IE
				 str.select();
				if (document.selection) {
					document.selection.clear(); // IE
				} else {
					window.getSelection().removeAllRanges();
				}
			}

             return false;
         }
     }
 }

function check_ext2(){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.jpg|.tiff|.pdf|.jpeg|.gif|.png)/)) {
             // ok
         }else{
             alert("????????? ????????? ???????????????.")
            event.srcElement.select();
             document.selection.clear();
             return false;
         }
     }
		alert(this.files[0].size);

 }
function check_ai(){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.ai)/)) {
             // ok
         }else{
             alert("AI ????????? ???????????????.")
            event.srcElement.select();
             document.selection.clear();
             return false;
         }
     }
		alert(this.files[0].size);

 }
function check_ai_en(){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.ai)/)) {
             // ok
         }else{
             alert("Please Select AI file.")
            event.srcElement.select();
             document.selection.clear();
             return false;
         }
     }
		alert(this.files[0].size);

 }

function check_ext2_en(){
     if(event.srcElement.value){
         if(event.srcElement.value.toLowerCase().match(/(.jpg|.tiff|.pdf|.jpeg|.gif|.png)/)) {
             // ok
         }else{
             alert("Please select only jpg, gif, giff, pdf, png file .")
            event.srcElement.select();
             document.selection.clear();
             return false;
         }
     }
		alert(this.files[0].size);

 }

function Close2(){
	$(".pupupLayer").remove();
}

function openPopLayer(src, w, h) {
if (!w) w = 600;
if (!h) h = 400;
$("body").append('<div class="pupupLayer"></div>');
var popupLayer = $('.pupupLayer');
var cssObj = {
'position': 'fixed'
, '_position': 'absolute'
, 'top': '0'
, 'left': '0'
, 'width': '100%'
, 'height': '100%'
, 'z-index': '10000'
, 'display': 'none'
}
popupLayer.css(cssObj);
popupLayer.append('<div class="bg"></div>');
var bg = $('.pupupLayer .bg');
cssObj = {
'position': 'absolute'
, 'top': '0'
, 'left': '0'
, 'width': '100%'
, 'height': '100%'
, 'background': '#000'
, 'opacity': '.1'
, 'filter': 'alpha(opacity=10)'
}
bg.css(cssObj);
popupLayer.append('<div class="layerArea"></div>');
var area = $('.pupupLayer .layerArea');
cssObj = {
'position': 'absolute'
, 'top': '50%'
, 'left': '50%'
, 'width': w + 'px'
, 'height': h + 'px'
, 'background': '#fff'
, 'border': '1px solid #ddd'
}
area.css(cssObj);
area.append('<iframe src=' + src + ' frameBorder="2" width="100%" height="100%" scrolling="auto"> </iframe>');
if (area.outerHeight() < $(document).height()) area.css('margin-top', '-' + area.outerHeight() / 2 + 'px');
else area.css('top', '0px');
if (area.outerWidth() < $(document).width()) area.css('margin-left', '-' + area.outerWidth() / 2 + 'px');
else area.css('left', '0px');
area.append('<img class="layerCloseBtn" src="http://www.kibs.com/bbs_img/layer_close.gif" alt="??????" />');
var closeBtn = $('.pupupLayer .layerCloseBtn');
cssObj = {
'position': 'absolute'
, 'padding': '5px'
, 'top': '-6px'
, 'left': (area.outerWidth() - 30) + 'px'
, 'cursor': 'pointer'
}
closeBtn.css(cssObj);
popupLayer.fadeIn(200);
closeBtn.click(function () {
popupLayer.fadeOut(200, function () { popupLayer.remove() });
})
}

function checkNumber(e){
	var objEv = e.srcElement ? e.srcElement : e.target;
	var numPattern = /([^0-9])/;
	numPattern = objEv.value.match(numPattern);
	if(numPattern != null){
//		alert("????????? ????????? ?????????!");
		objEv.value="";
		objEv.focus();
		return false;
	}
}



$(function()

{

 $(document).on("keyup", "input[numberOnly]", function(e) {
		if( ( e.keyCode >=  48 && e.keyCode <=  57 ) ||   //????????? 0 ~ 9 : 48 ~ 57
		( e.keyCode >=  96 && e.keyCode <= 105 ) ||   //????????? 0 ~ 9 : 96 ~ 105
		e.keyCode ==   8 ||    //BackSpace
		e.keyCode ==  46 ||    //Delete
		e.keyCode == 110 ||    //?????????(.) : ???????????????
		e.keyCode == 190 ||    //?????????(.) : ?????????
		e.keyCode ==  37 ||    //??? ?????????
		e.keyCode ==  39 ||    //??? ?????????
		e.keyCode ==  35 ||    //End ???
		e.keyCode ==  36 ||    //Home ???
		e.keyCode ==   9 ||    //Tab ???
		e.keyCode ==  13    // Enter ???
		) {
		} else {
			$(this).val($(this).val().replace(/[^0-9]/gi,"") );
		}
	}
);

 $(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );});

});


//????????????
function numberFormat(num) {
	var pattern = /(-?[0-9]+)([0-9]{3})/;
	while(pattern.test(num)) {
		num = num.replace(pattern,"$1,$2");
	}
	return num;
}

//????????????
function unNumberFormat(num) {
	return (num.replace(/\,/g,""));
}


function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) { return null; }
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}
var httpRequest = null;

function sendRequest(url, params, callback, method) {
	httpRequest = getXMLHttpRequest();
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader(
		'Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}

function cfSetFile(param)
{
 var frm = document.frm;
 var fileName = frm.bfile1.value;
 frm.filename1.value = fileName;
}

function cfSetFile2(param)
{
 var frm = document.frm;
 var fileName = frm.bfile2.value;
 frm.filename2.value = fileName;
}

function cancel_it()
{
	if (confirm("????????? ?????????????????????????"))
	{
		location.href="/kor/";
	}
}

function checkForNumber() {
	var key = event.keyCode;
	if(!(key==8||key==9||key==13||key==46||key==144||
	(key>=48&&key<=57)||(key>=96&&key<=105)||key==190)) {
		event.returnValue = false;
	}
}

function email_chk(email){
	var mail = email;
	var t = escape(mail);
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;



	if(regex.test(t) === false) {
		return false;
	} else {
		return true;
	}
}

function zipcode(frm, zip1, zip2, addr1, addr2, addr3)
{
	var left_size = (screen.width-500)/2;
	var top_size = (screen.height-150)/2;
	var post_zip = window.open("/zipcode/zip.asp?frm="+frm+"&zip1="+zip1+"&zip2="+zip2+"&addr1="+addr1+"&addr2="+addr2+"&addr3="+addr3+"", 'popupName', 'width=600, height=600, left=50, top=50, statusbar=0, scrollbars=0');
//	window.close();
//	window.open ("postcode.php","","width=500 height=150 top="+top_size+" left="+left_size);
}

function get_sido(strs)
{
        $.ajax({
            type:"GET"
            , url:"../../ajax/get_sido.php"
			, dataType : "html" //???????????? ???????????? ??????
			, timeout : 30000 //???????????? ??????
			, cache : false  //true, false
			, data : "sido_id="+ encodeURI(strs) //????????? ?????? ????????????
            , success:function(json){
				$("select[name='gugun_id'").find('option').each(function() {
					$(this).remove();
				});
				$("select[name='dong_id'").find('option').each(function() {
					$(this).remove();
				});
				$("select[name='dong_id']").append("<option value=''>???/???/??? ??????</option>");
                var list = $.parseJSON(json);
				var listLen = list.length;
				var contentStr = "";
				$("select[name='gugun_id']").append("<option value=''>???/??? ??????</option>");
				for(var i=0; i<listLen; i++){
					if (list[i].idx == "<?=$gugun?>" )
					{
					$("select[name='gugun_id']").append("<option value='"+list[i].gugun+"' selected>"+list[i].gugun+"</option>");
					} else {
					$("select[name='gugun_id']").append("<option value='"+list[i].gugun+"'>"+list[i].gugun+"</option>");
					}
				}
            }
        });
}

//????????? ????????????
function get_dong(strs)
{
        $.ajax({
            type:"GET"
            , url:"../../ajax/get_dong.php"
			, dataType : "html" //???????????? ???????????? ??????
			, timeout : 30000 //???????????? ??????
			, cache : false  //true, false
			, data : "gugun="+encodeURI(strs)+"&sido="+encodeURI(document.getElementById("sido_id").value)  //????????? ?????? ????????????
			, error : function(request, status, error) {
			 //?????? ?????? ????????? ??????
				alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
			}
            , success:function(json){
				$("select[name='dong_id'").find('option').each(function() {
					$(this).remove();
				});
                var list = $.parseJSON(json);
				var listLen = list.length;
				var contentStr = "";
				$("select[name='dong_id']").append("<option value=''>??????</option>");
				for(var i=0; i<listLen; i++){
					if (list[i].idx == "<?=$dong?>" )
					{
					$("select[name='dong_id']").append("<option value='"+list[i].dong+"' selected>"+list[i].dong+"</option>");
					} else {
					$("select[name='dong_id']").append("<option value='"+list[i].dong+"'>"+list[i].dong+"</option>");
					}
				}
            }
        });
}

function alert_(msg, gubun, time)
{
	if (time == undefined)
	{
		time = 1000;
	}
	if (gubun == undefined)
	{
		gubun = "success";
	}
	notif({
		type: gubun,
		msg: msg,
		width: "all",
		position: "center",
		timeout: time
	});
}

function blank()
{
	return;
}


function ByteCount(obj, maxlength, gubun) {
    var str = obj.value; // ???????????? ????????? ???????????? value ???

    var str_length = str.length; // ????????????

    // ???????????????
    var max_length = maxlength; // ????????? ????????? ??????
    var i = 0; // for?????? ??????
    var ko_byte = 0; // ?????????????????? 2 ???????????? 1??? ??????
    var li_len = 0; // substring?????? ????????? ??????
    var one_char = ""; // ???????????? ????????????
    var str2 = ""; // ???????????? ???????????? ???????????? ?????????????????? ????????????.

    for (i = 0; i < str_length; i++) {
        // ???????????????
        one_char = str.charAt(i);

        // ???????????? 2??? ?????????.
        if (escape(one_char).length > 4) {
            ko_byte += 2;
        }
        // ????????? ????????? 1??? ?????????.
        else {
            ko_byte++;
        }

        // ?????? ????????? max_length??? ???????????????
        if (ko_byte <= max_length) {
            li_len = i + 1;
        }
    }
	$("#"+gubun).html(li_len);

    // ??????????????? ????????????
    if (ko_byte > max_length) {
        alert(max_length+" Byte ????????? ???????????? ????????????. ");
    }
    obj.focus();

}


function changeEmail() {
	if (document.getElementById("email3").value != "")
	{
		document.getElementById("email2").readOnly = true;
	} else {
		document.getElementById("email2").readOnly = false;
	}
	document.getElementById("email2").value = document.getElementById("email3").value;
}

	function changeEmails(str) {
		if (document.getElementById(str+"3").value != "")
		{
			document.getElementById(str+"2").readOnly = true;
		} else {
			document.getElementById(str+"2").readOnly = false;
		}
		document.getElementById(str+"2").value = document.getElementById(str+"3").value;
	}

	function autoHypenPhone(str){
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				if( str.length < 4){
					return str;
				}else if(str.length < 7){
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				}else if(str.length < 11){
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				}else{
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
				return str;
	}


function mphon(obj) {
	obj.value =  PhonNumStr( obj.value );
}




function PhonNumStr( str ){

  var RegNotNum  = /[^0-9]/g;

  var RegPhonNum = "";

  var DataForm   = "";


  // return blank

  if( str == "" || str == null ) return "";



  // delete not number

  str = str.replace(RegNotNum,'');


  /* 4?????? ????????? ?????? ????????? ????????? ????????? ??????. */

  if( str.length < 4 ) return str;

  /* ???????????? 02??? ?????? 10?????? ???????????? ???????????? ?????????. */

  if(str.substring(0,2)=="02" && str.length > 10){
   str = str.substring(0, 10);
  }

  if( str.length > 3 && str.length < 7 ) {
   if(str.substring(0,2)=="02"){
    DataForm = "$1-$2";

    RegPhonNum = /([0-9]{2})([0-9]+)/;

   } else {
    DataForm = "$1-$2";

    RegPhonNum = /([0-9]{3})([0-9]+)/;
   }
  } else if(str.length == 7 ) {
   if(str.substring(0,2)=="02"){
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{2})([0-9]{3})([0-9]+)/;
   } else {
    DataForm = "$1-$2";

    RegPhonNum = /([0-9]{3})([0-9]{4})/;
   }
  } else if(str.length == 9 ) {
    if(str.substring(0,2)=="02"){
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{2})([0-9]{3})([0-9]+)/;
   } else {
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
   }
  } else if(str.length == 10){
   if(str.substring(0,2)=="02"){
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{2})([0-9]{4})([0-9]+)/;
   }else{
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
   }
  } else if(str.length > 10){
   if(str.substring(0,2)=="02"){
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{2})([0-9]{4})([0-9]+)/;
   }else{
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{3})([0-9]{4})([0-9]+)/;
   }
  } else {
   if(str.substring(0,2)=="02"){
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{2})([0-9]{3})([0-9]+)/;
   }else{
    DataForm = "$1-$2-$3";

    RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
   }
  }


  while( RegPhonNum.test(str) ) {

   str = str.replace(RegPhonNum, DataForm);

  }

  return str;

}

function trim(str) {
    str = str.replace(/ /g, '');
    return str;

}

function login_naver() {
	//window_open('/oauth-api/login_with_naver.php')
	popOpen( 600, 600, '/oauth-api/login_with_naver.php', 'naver')
}
function login_google() {
	popOpen( 800, 600, '/oauth-api/login_with_google.php', 'google')
}
function login_facebook() {
	popOpen( 800, 700, '/oauth-api/login_with_facebook.php', 'facebook')
}
function login_daum() {
	//window_open('/oauth-api/login_with_kaokao.php')
	popOpen( 600, 600, '/oauth-api/login_with_daum.php', 'daum')
}
function login_twitter() {
	//window_open('/oauth-api/login_with_kaokao.php')
	popOpen( 600, 600, '/oauth-api/login_with_twitter.php', 'daum')
}

function replaceAll(str, searchStr, replaceStr) {
	if(str != undefined)
	{
    return str.split(searchStr).join(replaceStr);
	}
}

function replaceAll(str, searchStr, replaceStr) {


    return str.split(searchStr).join(replaceStr);
}

function pop_wish(t_idx)
{
	$.colorbox({iframe:true,href:"/mypage/pop_wish.php?t_idx[]="+t_idx, width:"700px", height:"580x"});
}

	function cart_it(str)
	{
		$.ajax({
			url: "/product_image/cart_it.php",
			type: "POST",
			data: "t_idx[]="+str,
			error : function(request, status, error) {
			 //?????? ?????? ????????? ??????
				alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
				$("#ajax_loader").addClass("display-none");
			}
			,complete: function(request, status, error) {
			}
			, success : function(response, status, request) {
				if (response == "OK")
				{
					location.href="/mypage/cart.php";
					return;
				} else if (response == "OV") {
					alert("?????? ????????? ??????????????????.");
					return;
				} else if (response == "NL") {
					alert("????????? ????????? ?????????.");
					return;
				} else {
					alert(response);
					alert("????????? ?????????????????????!!");
					return;
				}
			}
		});
	}

function purchase_it(str)
{
	$.colorbox({iframe:true,href:"/mypage/pop_purchase.php?t_idx[]="+str, width:"700px", height:"710x"});
}


function getCookie(name) {
	var Found = false
	var start, end
	var i = 0

	while(i <= document.cookie.length) {
	start = i
	end = start + name.length

	if(document.cookie.substring(start, end) == name) {
	Found = true
	break
	}
	i++
	}

	if(Found == true) {
	start = end + 1
	end = document.cookie.indexOf(";", start)
	if(end < start)
	end = document.cookie.length
	return document.cookie.substring(start, end)
	}
	return ""
}

function setCookie( name, value, expiredays ) {
    var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function chk_eng(str){ return str.search(/[a-zA-Z]/g); } function chk_num(str){ return str.search(/[0-9]/g); }
function chk_length(str, min, max){ return (str.length >= min && str.length <= max)?true:false; }



