<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/history_fail_view.js"></script>

        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">승인실패조회(단말기 제외)</strong>
                <form class="form_layout" name="frm" id="frm" method="post" action="" target="">
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
                                <td class="input_desc" colspan="2">${historyVo.userid}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">요청금액</label></td>
                                <td class="input_desc" colspan="4">${historyVo.amount}원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">승인일자</label></td>
                                <td class="input_desc" colspan="2">${historyVo.authdate}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">취소일자</label></td>
                                <td class="input_desc" colspan="4">${historyVo.canceldate}</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자</label></td>
                                <td class="input_desc" colspan="2">${historyVo.username}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">신용카드금액(원)</label></td>
                                <td class="input_desc" colspan="4">${historyVo.amount}원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">승인번호</label></td>
                                <td class="input_desc" colspan="2">${historyVo.authno}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">할부개월수</label></td>
                                <td class="input_desc" colspan="4">${historyVo.quota eq '00'?'일시불':(historyVo.quota eq '0'?'일시불':historyVo.quota)}</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">주문번호</label></td>
                                <td class="input_desc" colspan="2">${historyVo.orderno}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자전화번호</label></td>
                                <td class="input_desc" colspan="4">${historyVo.userphone}</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자이메일</label></td>
                                <td class="input_desc" colspan="2">${historyVo.email}</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">실패메세지</label></td>
                                <td class="input_desc" colspan="4">${historyVo.errormessage}</td>
                            </tr>
                            
						    <c:choose>
							    <c:when test="${sessionScope.role_id eq '1001'}">
	                            <tr class="input_box input_box_border">
	                                <td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
	                                <td class="input_desc" colspan="2">${historyVo.business_nm3 }</td>
	                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
	                                <td class="input_desc" colspan="4">${historyVo.business_nm2 }</td>
	                            </tr>                            
	                            <tr class="input_box input_box_border">
	                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
	                                <td class="input_desc" colspan="7">${historyVo.business_nm }</td>
	                            </tr>      
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1002'}">
	                            <tr class="input_box input_box_border">
	                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
	                                <td class="input_desc" colspan="2">${historyVo.business_nm2 }</td>
	                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
	                                <td class="input_desc" colspan="4">${historyVo.business_nm }</td>
	                            </tr>                            
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1003'}">
	                            <tr class="input_box input_box_border">
	                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
	                                <td class="input_desc" colspan="7">${historyVo.business_nm }</td>
	                            </tr>    
							    </c:when>
						    </c:choose>		
						    
                        </tbody>
                    </table>

                    <div class="btn_box">
                    	<a href="/history/history_fail.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
                        <a href="/history/history_fail.do" class="a_btn a_btn_blue" >목록</a>
                    </div>
                </form>
            </div>
        </div>


<!-- //container -->

<!-- //wrap -->