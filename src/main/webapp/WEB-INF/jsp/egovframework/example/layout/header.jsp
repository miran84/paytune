<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header id="myHeader">
		    <div class="fnb">
		        <div class="inner">
		            <h1>
		                <a href="/main/main.do">
		                    <img src="/img/main/adm_logo.png" alt="지엠지페이먼트">
		                </a>
		            </h1>
		            <div class="fr">
		                <ul class="h_tab">
		                    <li class="h_info">
		                        <div class="h_info_list">
		                            <span>${sessionScope.sessionLoginAction.business_nm}(${sessionScope.login_id}) / </span>
		                            <span>IP :  ${sessionScope.ipAddress} / </span>
		                            <span>최근접속일시 : ${sessionScope.sessionLoginAction.today} / </span>
		                            <span>접속가능시간 <em><span id="divTimer"></span></em> / </span>
		                            <button type="button" onclick="resetTimer();"><span>접속 연장</span></button>
		                        </div>
		                        <a href="javascript:void(0);">
		                            <button type="button" class="pw_change_btn">비밀번호변경</button>
		                            <button onclick="location.href='/user/mypage_info.do'" type="button" class="modify_btn">정보수정</button> 
		                        </a>		                    
		                        <a class="log_out" href="/logout.do">로그아웃</a>                           
		                    </li>
		                </ul>
		                         
		            </div>
		        </div>
		    </div>
		</header>
		
		<!-- 비밀번호인증 -->
		<div class="popup_wrap">
			<div class="popup popup02 pw_find_popup">
				<div class="popup_head">
					<strong class="popup_ttl">비밀번호변경</strong>
					<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
				</div>
				<div class="popup_body">
					<div class="popup_inner">
						<div class="inner_bottom">
							<table class="popup_list">
								<tbody>
		                            <tr>
		                                <th>인증방법 선택</th>
		                                <td>
		                                    <span class="checkbox">
												<input type="radio" name="certify" value="phone_num" class="input_checkbox" id="certify01" checked>
												<label for="certify01">휴대폰</label>
											</span>
											<span class="checkbox">
												<input type="radio" name="certify" value="email" class="input_checkbox" id="certify02" >
												<label for="certify02">이메일</label>
		                                    </span>
		                                    <button onclick="authSend();" type="button" class="btn_digit">인증번호 발송</button>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th>인증번호</th>
		                                <td>
		                                    <input type="text" name="auth_no" id="auth_no" placeholder="인증번호" class="width_180">
		                                    <button type="button" onclick="authCheck();" class="btn_digit">인증확인</button>
		                                </td>
		                            </tr>
								</tbody>
							</table>
							<div class="btn_box">
								<a href="javascript:passWd();" class="a_btn a_btn_blue">조회</a>
							</div>					
						</div>				
					</div>
				</div>
			</div>
		</div>
		<!-- //비밀번호인증  -->		
		<!-- 비밀번호변경 -->
		<div class="popup_wrap popup_main">
			<div class="popup popup02 pw_change">
				<div class="popup_head">
					<strong class="popup_ttl">비밀번호변경</strong>
					<a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
				</div>
				<div class="popup_body">
					<div class="popup_inner">
						<div class="inner_bottom">
							<table class="popup_list">
								<tbody>
		                            <tr>
		                                <th>현재비밀번호</th>
		                                <td>
		                                    <input type="password" name="passwd2" id="passwd2" placeholder="현재 비밀번호 입력">
		                                </td>
		                            </tr>
									<tr>
										<th>새비밀번호</th>
										<td>
		                                    <input type="password" name="newpasswd" id="newpasswd" placeholder="새 비밀번호 입력">
		                                </td>
									</tr>
									<tr>
										<th>새비밀번호 확인</th>
										<td>
		                                    <input type="password" name="newpasswd2" id="newpasswd2" placeholder="새 비밀번호 확인">
		                                </td>
									</tr>
								</tbody>
							</table>
							<div class="btn_box">
								<a href="javascript:pwChange();" class="a_btn a_btn_blue">확인</a>
							</div>					
						</div>				
					</div>
				</div>
			</div>
		</div>
		<!-- //비밀번호변경  -->
		
		<div class="dim"></div>		
		
		<script>
			var sessionTime;
			var timerHour = 3; 
			var timerMinute = 0;
			var timerSecond = 0;
			var timerEndFlag = false;

		    // 좌측 메뉴
		    $(document).ready(function(){
		        $('.depth1_ttl').on('click', function(){
		            $(this).next('.depth2').toggleClass('on'); 
		            $(this).toggleClass('on'); 
		
		            if ($('.depth2').hasClass('on')) {
		                $('.depth2').removeClass('on');
		                $('.depth1_ttl').removeClass('on');
		
		                $(this).next('.depth2').toggleClass('on'); 
		                $(this).toggleClass('on'); 
		            } else {return;}            
		        }); 
		        
		        // 비밀번호 변경 팝업열기
		        $('.pw_change_btn').on('click', function(){
		            
	            <c:choose>
		            <c:when test="${sessionScope.role_id eq '1001'}">
			           $('.popup_wrap .pw_change').fadeIn();
			           $('.popup_wrap').siblings('.dim').fadeIn();
		            </c:when>
		           <c:otherwise>
                       $('.popup_wrap .pw_find_popup').fadeIn();
			           $('.popup_wrap').siblings('.dim').fadeIn();
		           </c:otherwise>
	           </c:choose>		            
		        });

		        $('.go_pw_change').on('click', function(){
		            $('.popup_wrap .pw_find_popup').fadeOut();
		            $('.popup_wrap .pw_change').fadeIn();
		        });
		        // 팝업 닫기
		        $('.btn_closed').on('click', function(){
		            $('.dim').fadeOut();
		            $('.popup_wrap .popup').fadeOut();
		        });		        
		        // 팝업 닫기
		        $('.pop_close_btn').on('click', function(){
		            $('.dim').fadeOut();
		            $('.popup_wrap .popup').fadeOut();
		        });		        
		
		        setTimer();
		    }); 
		
		    //resize 시 myGng 높이 변경
		    $(document).ready(function(){
		
		        $(window).resize(resizeContents);
		            resizeContents();
		    });
		
		    function resizeContents() {
		
		        $("#myGnb").height($('#wrap').height() - 55);
		
		    }
		    
		    function authSend(){
		    	
		    	var certify = $("input[name='certify']:checked").val();
				var url_page = "";
		    	
		    	if(certify == "phone_num"){
					url_page = "/smsAction.do";
		    	}else if(certify == "email"){
					url_page = "/emailAction.do";
		    	}
		    	
				var param = new Object();
				param.type	 		 = "2";
				
				$.ajax({
				    url:  url_page,
				    type: 'POST',
				    data: param,
				    success: function(data){
				    	alert("인증번호가 발송되었습니다.");
				    	return;
				    },
				    error: function(e){
				        alert(e.reponseText);
				    },
				    complete: function() {
				    }
				});	
		    }
		    
		    function authCheck(){
		    	
		    	var certify = $("input[name='certify']:checked").val();
				var param = new Object();
				
				param.auth_no	 		 = $('#auth_no').val();
				param.certify	 		 = certify;
				
				$.ajax({
				    url:  "/authCheck.do",
				    type: 'POST',
				    data: param,
				    success: function(data){
				    	
				    	if(data == "AUTH_SUCCESS"){
				    		alert("정상인증 되었습니다.");
					    	return;
				    		
				    	}else if(data == "AUTH_FALSE"){
					    	alert("인증번호가 틀립니다.");
					    	return;
				    	}
				    },
				    error: function(e){
				        alert(e.reponseText);
				    },
				    complete: function() {
				    }
				});	
		    }
		    
		    function passWd(){
		    	
		    	var certify = $("input[name='certify']:checked").val();
				var param = new Object();
				
				param.auth_no	 		 = $('#auth_no').val();
				param.certify	 		 = certify;
				
				$.ajax({
				    url:  "/authCheck.do",
				    type: 'POST',
				    data: param,
				    success: function(data){
				    	
				    	if(data == "AUTH_SUCCESS"){
				            $('.popup_wrap .pw_find_popup').fadeOut();
				            $('.popup_wrap .pw_change').fadeIn();
				    		
				    	}else if(data == "AUTH_FALSE"){
					    	alert("인증번호가 틀립니다.");
					    	return;
				    	}
				    },
				    error: function(e){
				        alert(e.reponseText);
				    },
				    complete: function() {
				    }
				});	
				
		    }
		    
		    function pwChange(){
		    	
				if($('#passwd2').val() == ""){
					alert("현재비밀번호로 입력해주세요!");
					$('#passwd2').focus();
					return;
				}
				
				var pw = $("#newpasswd").val();
				var num = pw.search(/[0-9]/g);
				var eng = pw.search(/[a-z]/ig);
		//		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
				if(pw.length < 8 || pw.length > 15){
				 alert("8자리 ~ 15자리 이내로 입력해주세요.");
				 return;
				}else if(pw.search(/\s/) != -1){
				 alert("비밀번호는 공백 없이 입력해주세요.");
				 return;
				}else if( num < 0 && eng < 0 ){
				 alert("영문,숫자중 2가지 이상을 혼합하여 입력해주세요.");
				 return;
				}
				 
				if($('#newpasswd').val() == ""){
					alert("새비밀번호를 입력해주세요!");
					$('#newpasswd').focus();
					return;
				}
				
				 
				if($('#newpasswd2').val() == ""){
					alert("새비밀번호 확인을 입력해주세요!");
					$('#newpasswd2').focus();
					return;
				}
				if($('#newpasswd').val() != $('#newpasswd2').val()){
					alert("비밀번호가 일치하지 않습니다.");
					$('#newpasswd').focus();
					return;
				}
				if($('#passwd2').val() == $('#newpasswd').val()){
					alert("현재비밀번호랑 새 비밀번호가 동일합니다.");
					$('#passwd2').focus();
					return;
				}
				
				var param = new Object();
				param.passwd	 			 = $('#passwd2').val();
				param.newpasswd	 			 = $('#newpasswd').val();
				param.type		 			 = "2";
				
				$.ajax({
				    url:  '/pwSearch2.do',
				    type: 'POST',
				    data: param,
				    success: function(data){
				    	
				    	if(data == "INFO_SUCCESS"){
				    		alert("비밀번호가 변경 되었습니다.");
				            $('.dim').fadeOut();
				            $('.popup_wrap .popup').fadeOut();
							return;		    		
				    	}else{
				    		alert("현재 비밀번호가 맞지않습니다.");
							return;		
				    	}
				    	
				    },
				    error: function(e){
				        alert(e.reponseText);
				    },
				    complete: function() {
				    }
				});	
				
		    }
		
		    function setTimer(){
		    	
		    	var dispHour = "";			
		    	var dispMinute = "";
		    	var dispSecond = "";
		    	
		    	if(timerEndFlag == true) return;

		    	if(timerSecond == 0) {
		    		timerMinute = timerMinute - 1 ;
		    		timerSecond = 59 ;
		    		
		    		if(timerMinute < 0) {
		    			timerHour = timerHour - 1 ;
		    			timerMinute = 59 ;
		    		}
		    		
		    	} else timerSecond = timerSecond - 1;
		    	
		    	if ( timerHour < 0 ) {
		    		timerEndFlag = true;
		    		alert("접속시간이 만료되었습니다. ");
		    		top.document.location.href="/logout.do";
		    		return;
		    	}
		    	
/*
		    	if ( ( timerHour == 0 && timerMinute == 10 && timerSecond == 00 )
		    		|| ( timerHour == 0 && timerMinute == 5 && timerSecond == 00 )
		    		|| ( timerHour == 0 && timerMinute == 3 && timerSecond == 00 )
		    		|| ( timerHour == 0 && timerMinute == 1 && timerSecond == 00 )
		    		) {
		    		setDivTimerPopup("SHOW");
		    	}
*/		    	
		    	dispSecond = (timerSecond < 10 ? "0" : "") + timerSecond;
		    	dispMinute = (timerMinute < 10 ? "0" : "") + timerMinute;
		    	dispHour = timerHour;
		    	
		    	document.getElementById('divTimer').innerHTML = dispHour + ':' + dispMinute + ':' + dispSecond;
//		    	document.getElementById('divTimer2').innerHTML = dispHour + ':' + dispMinute + ':' + dispSecond;
		    	
		    	sessionTime = setTimeout('setTimer()', 1000);
		    }

		    //timer reset
		    function resetTimer(){
		    	//location.href = location.href;
		    	timerHour = 3; 
		    	timerMinute = 0;
		    	timerSecond = 0;
		    	timerEndFlag = false;
		    	
				var param = new Object();
				$.ajax({
				    url:  '/sesionCheck.do',
				    type: 'POST',
				    data: param,
				    success: function(data){
				    },
				    error: function(e){
				        alert(e.reponseText);
				    },
				    complete: function() {
				    }
				});			    	
//		    	setDivTimerPopup("HIDE");
		    }		    
		    
    
		</script> 
		
		<section id="myGnb">
		    <div class="menu_box">
		        <ul class="depth1">
					<c:forEach var="result" items="${sessionScope.MENU}" varStatus="status">
					<c:choose>
						<c:when test="${!empty result.menu_url}">
				            <li class="depth1_menus depth_active_none">
				                <a class="depth1_ttl on " id="${result.menu_id}" onclick="location.href='${result.menu_url}'" style="cursor:pointer;">${result.menu_nm}</a>
				            </li>
						</c:when>
						<c:otherwise>
							<li class="depth1_menus">
				                <a class="depth1_ttl" id="${result.menu_id}" style="cursor:pointer;">${result.menu_nm}</a>
				                <ul class="depth2" id="${result.menu_id}_sub">
								<c:forEach var="result2" items="${sessionScope.SUBMENU}" varStatus="status">
									<c:if test="${result.menu_id eq result2.high_menu_id}">
					                    <li class="">
					                        <a class="" id="${result2.menu_id}" onclick="location.href='${result2.menu_url}'" style="cursor:pointer;">${result2.menu_nm}</a>
					                    </li>
									</c:if>
								</c:forEach>
				                </ul>
				            </li> 				    
						</c:otherwise>
					</c:choose>		
					</c:forEach>	
		        </ul>
		    </div>
		    
		</section>		
		
		<script>
		/*
		    $(function(){
		        if($('.depth2 a').hasClass('on')){
		            $('.depth2 a.on').parents('.depth2').addClass('on').parents('.depth1_menus').children('.depth1_ttl').addClass('on');
		        }
		    });
		*/
		</script>