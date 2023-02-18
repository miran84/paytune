<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		
	<script src="/js/pg_manage.js"></script>	
	
	<!-- container -->
			<div class="inner clearfix">
				<div class="col">
				    <strong class="sub_ttl">PG관리</strong>
				</div>
				 
				 <div class="col">
					<div class="view_box login_view_box">
						<button class="register_btn">등록</button>
					</div>
					<form class="table_layout notice_layout setup_layout" name="frm" id="frm" action="" method="post">
					
					<div id="pg_manage_data"></div>
					
					</form>
				 </div>

			</div>
	
    <!-- //container -->
    
    <!-- 로그인 정보 변경 -->
    <div class="popup_wrap">
        <div class="popup popup02 pg_setup">
            <div class="popup_head">
                <strong class="popup_ttl">PG관리 정보추가</strong>
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
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>PG명</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>일반PG 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>수기결제 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>단말기 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>가상계좌 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>실시간계좌이체 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>문화상품권 수수료</th>
                                    <td>
                                        <input type="text" name="" id="">
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
                $('.pg_setup').show();
                $('.popup_main').hide();
            });
            
        });
    </script>
	  



