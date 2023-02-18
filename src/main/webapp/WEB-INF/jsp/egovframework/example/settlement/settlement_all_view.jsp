<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/js/settlement_all_view.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">통합정산조회</strong>
                <form class="form_layout" name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="daoutrx" id="daoutrx" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="created_id" id="created_id" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="cpid" id="cpid" value="<c:out value="${settlementVO.cpid}" />">
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.userid}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">터미널ID</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.terminalid}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">매입구분</label></td>
                                <td class="input_desc" colspan="2">매입</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">지급일자</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.period}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">승인일자</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.authdate}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">은행</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.bank_nm}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">주문번호</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.orderno}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.username}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">상품명</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.productname}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">거래금액</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.amount}" />원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료율</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.commission}" />%</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.franchisee_commission}" />원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료원가</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.commission2}" />원</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료부가세</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.vat}" />원
                                </td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">지급액</label></td>
                                <td class="input_desc" colspan="2">
								<c:out value="${settlementVO.commission_total}" />원                            
                                </td>
                                <td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.business_nm3}" /></td>
                            </tr>        
						    <c:choose>
							    <c:when test="${sessionScope.role_id eq '1001'}">
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
		                                <td class="input_desc" colspan="7"><c:out value="${settlementVO.business_nm3}" /></td>
		                            </tr>  
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
		                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.business_nm2}" /></td>
		                                <td class="input_ttl" colspan="1"><label class="" for="">상태</label></td>
		                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.state}" /></td>
		                            </tr> 
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1002'}">
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
		                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.business_nm2}" /></td>
		                                <td class="input_ttl" colspan="1"><label class="" for="">상태</label></td>
		                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.state}" /></td>
		                            </tr> 
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1003'}">
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">상태</label></td>
		                                <td class="input_desc" colspan="7"><c:out value="${settlementVO.state}" /></td>
		                            </tr>  
							    </c:when>
						    </c:choose>	

                        </tbody>
                    </table>

                    <div class="btn_box">
                    	<a href="/settlement/settlement_all.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
		                <a href="javascript:fnHold();"class="a_btn a_btn_blue" >지급보류</a>
                        <a href="/settlement/settlement_all.do" class="a_btn a_btn_blue_line" >목록</a>
                    </div>
                </form>
            </div>
        </div>


<!-- //container -->

<!-- //wrap -->