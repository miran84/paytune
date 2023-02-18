<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/setup_bank.js"></script>	
	
	<!-- container -->
			<div class="inner clearfix">
				<div class="col">
				    <strong class="sub_ttl">은행 관리</strong>
				</div>
				 
				 <div class="col">
					<div class="view_box login_view_box">
						<button class="register_btn"> 등록</button>
					</div>
					<form class="table_layout notice_layout setup_layout" name="frm" id="frm" action="" method="post">
					
					<div id="setup_bank_data"></div>
					
					</form>
				 </div>

			</div>
	
    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="popup_wrap">
        <div class="popup popup02 bank_setup">
            <div class="popup_head">
                <strong class="popup_ttl">은행정보 추가</strong>
                <a class="btn_closed" href="javascript:void(0);"><img src="../img/btn/btn_closed.png" alt="닫기" /></a>
            </div>
            <div class="popup_body">
                <div class="popup_inner">
                    <div class="inner_bottom">
                    	<form name="frm2" id="frm2">
                        <table class="popup_list">
                            <tbody>
                                <tr>
                                    <th>코드명</th>
                                    <td>
                                        <input type="text" name="bank_code" id="bank_code">
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        <input type="text" name="bank_nm" id="bank_nm">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                        <div class="btn_box">
                            <a href="javascript:frmAdd();" class="a_btn a_btn_blue go_pw_change">등록</a>
                        </div>					
                    </div>				
                </div>
            </div>
        </div>
    </div>
    <!-- //로그인 정보 변경  -->

    <script>
        $(function(){

            // 팝업 오픈
            $('.register_btn').on('click',function(){
                $('.dim').fadeIn();
                $('.bank_setup').show();
                $('.popup_main').hide();
            });
            
        });
    </script>
	  



