<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/js/settlement_his_view.js"></script>

        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">지급보류/해제/별도가감</strong>
                <form class="form_layout" name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${fn:replace(settlementVO.amount, ',', '')}" />">
                <input type="hidden" name="daoutrx" id="daoutrx" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="DAOUTRX" id="DAOUTRX" value="<c:out value="${settlementVO.daoutrx}" />">
                <input type="hidden" name="CREATED_ID" id="CREATED_ID" value="<c:out value="${sessionScope.login_id}" />">
                <input type="hidden" name="cpid" id="cpid" value="<c:out value="${settlementVO.cpid}" />">
                <input type="hidden" name="CANCELTYPE" id="CANCELTYPE" value="">       
                 <input type="hidden" name="cp_type" id="cp_type" value="<c:out value="${settlementVO.cp_type}" />">                
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
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.period}" />일</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">승인일자</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.authdate}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">취소일자</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.canceldate}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">은행</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.bank_nm}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">주문번호</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.orderno}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.username}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">상품명</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.productname}" /></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">거래금액</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.amount}" />원</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.commission}" />%</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">부가세</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.vat}" />원</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">지급액</label></td>
                                <td class="input_desc" colspan="4">
								<c:choose>
									<c:when test="${sessionScope.role_id eq '1004'}">
										<c:out value="${settlementVO.commission_total}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1003'}">
										<c:out value="${settlementVO.commission_total2}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1002'}">
										<c:out value="${settlementVO.commission_total3}" />원
									</c:when>
									<c:when test="${sessionScope.role_id eq '1001'}">
										<c:out value="${settlementVO.commission_total4}" />원
									</c:when>
								</c:choose>
                                </td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.business_nm3}" /></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
                                <td class="input_desc" colspan="4"><c:out value="${settlementVO.business_nm2}" /></td>
                            </tr>
							<c:choose>
								<c:when test="${empty settlementVO.canceldate}">
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">상태</label></td>
		                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.state}" /></td>
		                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
		                                <td class="input_desc" colspan="4"><input class="width_s" type="text" name="AMOUNT2" id="AMOUNT2" value="">원</td>	                                
		                            </tr>      
								</c:when>
								<c:when test="${!empty settlementVO.canceldate}">
		                            <tr class="input_box input_box_border">
		                                <td class="input_ttl" colspan="1"><label class="" for="">상태</label></td>
		                                <td class="input_desc" colspan="2"><c:out value="${settlementVO.state}" /></td>
		                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
		                                <td class="input_desc" colspan="4">${settlementVO.amountMod }</td>
		                            </tr>      
								</c:when>
							</c:choose>                           
                        </tbody>
                    </table>

                    <div class="btn_box">
                    	<a href="/settlement/settlement_his.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
                  		<a href="javascript:fnHold();"class="a_btn a_btn_blue" >지급보류해제</a>
		                <c:if test="${empty settlementVO.canceldate && sessionScope.role_id eq '1001' && settlementVO.cp_type ne '3'}">
		                <a href="javascript:fnCardCancel();"class="a_btn a_btn_blue" id="totalCancel">전체취소</a>
		                <a href="javascript:fnCardCancel2();"class="a_btn a_btn_blue" id="partCancel">부분취소</a>
		                </c:if>   
		                <a href="javascript:fnCardReceipt('<c:out value="${settlementVO.canceltype}" />');"class="a_btn a_btn_blue" >영수증</a>
                        <a href="/settlement/settlement_his.do" class="a_btn a_btn_blue_line" >목록</a>
                    </div>
                </form>
            </div>
        </div>


<!-- //container -->

<!-- //wrap -->