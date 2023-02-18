<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/setup_ip.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				    <strong class="sub_ttl">접속 IP</strong>
					<form class="form_layout" name="frm1" id="frm1" method="post" action=""	target="" onsubmit="return false;" >
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">검색조건</label>
									</td>
									<td class="input_desc" colspan="7">

										<span class="checkbox">
											<input type="radio" name="check" value="1001" class="input_checkbox" id="s_1001" checked> <label for="s_1001">본사</label>
										</span> 
										<span class="checkbox"> 
											<input type="radio" name="check" value="1002" class="input_checkbox" id="s_1002"> <label for="s_1002">영업대행</label>
										</span> 
										<span class="checkbox"> 
											<input type="radio" name="check" value="1003" class="input_checkbox" id="s_1003"> <label for="s_1003">대리점</label>
										</span> 
										<span class="checkbox"> 
											<input type="radio" name="check" value="1004" class="input_checkbox" id="s_1004" > <label for="s_1004">가맹점</label>
										</span>
									</td>								
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
										<label class="" for="">검색어</label>
									</td>
									<td class="input_desc" colspan="7">
										 <input class="width_370" type="text" name="searchKeyword" placeholder="" id="searchKeyword" value="${searchSetupVO.searchKeyword }" onkeyup="enterkey()">
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:setup_ip_data();" class="a_btn a_btn_blue">검색</a>
						</div>
					</form>
				</div>
				 
				 <div class="col">
					<div class="view_box login_view_box">
						<button class="register_btn"> 등록</button>
					</div>
					
					<div id="setup_ip_data"></div>
					
				 </div>
			</div>
					

    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <form action="" name="frm3" id="frm3" method="post">
    <input type="hidden" name="ip" id="ip" value=""/>
    <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">
    <div class="popup_wrap">
        <div class="popup popup02 ip_setup">
            <div class="popup_head">
                <strong class="popup_ttl">접속 IP 추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="/img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="popup_body">
                <div class="popup_inner">
                    <div class="inner_bottom">
                        <table class="popup_list">
                            <tbody>
                                <tr>
                                    <th>IP</th>
                                    <td>
                                        <div class="ip_wrap">
                                            <div class="ip_box">
                                                <input type="text" name="ip1" id="ip1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                <span>.</span>
                                                <input type="text" name="ip2" id="ip2" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                <span>.</span>
                                                <input type="text" name="ip3" id="ip3" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                <span>.</span>
                                                <input type="text" name="ip4" id="ip4" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                            </div>
                                            <button type="button" class="btn_digit">접속 IP</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>메모</th>
                                    <td>
                                        <input type="text" name="memo" id="memo" placeholder="메모" maxlength="300">
                                    </td>
                                </tr>
                                <tr>
                                    <th>선택</th>
                                    <td>
                                        <div class="radiobox">
                                            <div class="input_wrap">
                                                <input type="radio" name="role_id" id="r1001" value="1001" checked> 
                                                <label for="r1001">본사</label>
                                            </div>
                                            <div class="input_wrap">
                                                <input type="radio" name="role_id" id="r1002" value="1002"> 
                                                <label for="r1002">영업대행</label>
                                            </div>
                                            <div class="input_wrap">
                                                <input type="radio" name="role_id" id="r1003" value="1003"> 
                                                <label for="r1003">대리점</label>
                                            </div>
                                            <div class="input_wrap">
                                                <input type="radio" name="role_id" id="r1004" value="1004"> 
                                                <label for="r1004">가맹점</label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <!-- tr>
                                    <th>사용유무</th>
                                    <td>
                                        <div class="radiobox">
                                            <div class="input_wrap">
                                                <input type="radio" name="use_yn" id="use_y" checked value="Y"> 
                                                <label for="use_y">사용</label>
                                            </div>
                                            <div class="input_wrap">
                                                <input type="radio" name="use_yn" id="use_n" value="N"> 
                                                <label for="use_n">사용안함</label>
                                            </div>
                                        </div>
                                    </td>
                                </tr-->
                            </tbody>
                        </table>
                        <div class="btn_box">
                            <a href="javascript:frmAdd();" class="a_btn a_btn_blue go_pw_change">등록</a>
                        </div>					
                    </div>				
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){
            // 팝업 오픈
            $('.register_btn, .img_set').on('click',function(){
                $('.dim').fadeIn();
                $('.ip_setup').show();
            });
        });
    </script>
