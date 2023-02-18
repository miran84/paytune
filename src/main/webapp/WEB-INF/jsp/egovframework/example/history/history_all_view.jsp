<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="/js/history_all_view.js"></script>


        <div class="inner clearfix">
            <div class="col">
                <strong class="sub_ttl">통합승인내역조회</strong>
                <form class="form_layout" name="frm" id="frm" method="post" action="" target="">
                <input type="hidden" name="DAOUTRX" id="DAOUTRX" value="<c:out value="${historyVo.daoutrx}" />">
                <input type="hidden" name="AMOUNT" id="AMOUNT" value="<c:out value="${fn:replace(historyVo.amount, ',', '')}" />">
                <input type="hidden" name="CREATED_ID" id="CREATED_ID" value="${sessionScope.login_id}">
                <input type="hidden" name="CANCELMEMO" id="CANCELMEMO" value="사용자의 인해 일반취소">                
                <input type="hidden" name="CANCELTYPE" id="CANCELTYPE" value="">                
                <input type="hidden" name="cp_type" id="cp_type" value="<c:out value="${historyVo.cp_type}" />">                
                
                <input type="hidden" name="username" id="username" value="<c:out value="${historyVo.cp_type}" />">                
                <input type="hidden" name="productname" id="productname" value="<c:out value="${historyVo.cp_type}" />">                
                <input type="hidden" name="userphone" id="userphone" value="<c:out value="${historyVo.cp_type}" />">                
                    <table>
                        <tbody>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
                                <td class="input_desc" colspan="2">${historyVo.userid }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">요청금액</label></td>
                                <td class="input_desc" colspan="4">${historyVo.amount }원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">승인일자</label></td>
                                <td class="input_desc" colspan="2">${historyVo.authdate }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">취소일자</label></td>
                                <td class="input_desc" colspan="4">${historyVo.canceldate }</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">구매자</label></td>
                                <td class="input_desc" colspan="2">${historyVo.username }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">신용카드금액(원)</label></td>
                                <td class="input_desc" colspan="4">${historyVo.amount }원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
                                <td class="input_desc" colspan="2">${historyVo.commission }%</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">수수료 제외 금액</label></td>
                                <td class="input_desc" colspan="4">${historyVo.commission_total }원</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">카드계열</label></td>
                                <td class="input_desc" colspan="2">${historyVo.cardname }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">승인번호</label></td>
                                <td class="input_desc" colspan="4">${historyVo.authno }</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">할부개월수</label></td>
                                <td class="input_desc" colspan="2">${historyVo.quota eq '00'?'일시불':(historyVo.quota eq '0'?'일시불':historyVo.quota) }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">주문번호</label></td>
                                <td class="input_desc" colspan="4">${historyVo.orderno }</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">터미널ID</label></td>
                                <td class="input_desc" colspan="2">${historyVo.terminalid }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">매출전표</label></td>
                                <td class="input_desc" colspan="4">${historyVo.tax }</td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">고객이름</label></td>
                                <td class="input_desc" colspan="2">${historyVo.username }</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">고객전화번호</label></td>
                                <td class="input_desc" colspan="4">${historyVo.userphone }</td>
                            </tr>            
						    <c:choose>
							    <c:when test="${sessionScope.role_id eq '1001'}">
	                            <tr class="input_box input_box_border">
	                                <td class="input_ttl" colspan="1"><label class="" for="">영업대행</label></td>
	                                <td class="input_desc" colspan="2">${historyVo.business_nm3 }</td>
	                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
	                                <td class="input_desc" colspan="4">${historyVo.business_nm2 }</td>
	                            </tr>                            
									<c:choose>
										<c:when test="${empty historyVo.canceldate}">
				                            <tr class="input_box input_box_border">
				                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
				                                <td class="input_desc" colspan="2">${historyVo.business_nm }</td>
				                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
				                                <td class="input_desc" colspan="4"><input class="width_s" type="text" name="AMOUNT2" id="AMOUNT2" value="">원</td>	                                
				                            </tr>      
										</c:when>
										<c:when test="${!empty historyVo.canceldate}">
				                            <tr class="input_box input_box_border">
				                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
				                                <td class="input_desc" colspan="2">${historyVo.business_nm }</td>
				                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
				                                <td class="input_desc" colspan="4">${historyVo.amountMod }</td>
				                            </tr>      
										</c:when>
									</c:choose>
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1002'}">
									<c:choose>
										<c:when test="${empty historyVo.canceldate}">
				                            <tr class="input_box input_box_border">
				                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
				                                <td class="input_desc" colspan="2">${historyVo.business_nm2 }</td>
				                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
				                                <td class="input_desc" colspan="4">${historyVo.business_nm }</td>
				                            </tr>    				                            
										</c:when>
										<c:when test="${!empty historyVo.canceldate}">
				                            <tr class="input_box input_box_border">
				                                <td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
				                                <td class="input_desc" colspan="2">${historyVo.business_nm2 }</td>
				                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
				                                <td class="input_desc" colspan="4">${historyVo.business_nm }</td>
				                            </tr>   
				                            <tr class="input_box input_box_border">
				                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
				                                <td class="input_desc" colspan="7">${historyVo.amountMod }</td>
				                            </tr> 				                            
										</c:when>
									</c:choose>							    
							    </c:when>
							    <c:when test="${sessionScope.role_id eq '1003'}">
							    	<c:choose>
									<c:when test="${empty historyVo.canceldate}">
			                            <tr class="input_box input_box_border">
			                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
			                                <td class="input_desc" colspan="7">${historyVo.business_nm }</td>
			                            </tr>       
									</c:when>
									<c:when test="${!empty historyVo.canceldate}">
			                            <tr class="input_box input_box_border">
			                                <td class="input_ttl" colspan="1"><label class="" for="">가맹점</label></td>
			                                <td class="input_desc" colspan="2">${historyVo.business_nm }</td>
			                                <td class="input_ttl" colspan="1"><label class="" for="">취소금액</label></td>
			                                <td class="input_desc" colspan="4">${historyVo.amountMod }</td>
			                            </tr>      
									</c:when>	
									</c:choose>
							    </c:when>
						    </c:choose>	
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">지급일</label></td>
                                <td class="input_desc" colspan="7">D+${historyVo.period }</td>
                            </tr> 							    	                        
                            <!-- tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">거래상태</label></td>
                                <td class="input_desc" colspan="2">결제완료</td>
                                <td class="input_ttl" colspan="1"><label class="" for="">수취인주소</label></td>
                                <td class="input_desc" colspan="4"></td>
                            </tr>
                            <tr class="input_box input_box_border">
                                <td class="input_ttl" colspan="1"><label class="" for="">전체취소</label></td>
                                <td class="input_desc" colspan="2"></td>
                                <td class="input_ttl" colspan="1"><label class="" for="">부분취소</label></td>
                                <td class="input_desc" colspan="4"></td>
                            </tr-->
                        </tbody>
                    </table>

                    <div class="btn_box">
		                <!-- a href="#!"class="a_btn a_btn_default" >자동취소</a-->
		                <a href="/history/history_all.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
		                <c:if test="${empty historyVo.canceldate && sessionScope.role_id eq '1001'}">
		                <a href="javascript:fnCardCancel();"class="a_btn a_btn_blue" id="totalCancel">전체취소</a>
		                <a href="javascript:fnCardCancel2();"class="a_btn a_btn_blue" id="partCancel">부분취소</a>
		                </c:if>
		                <a href="javascript:fnCardReceipt('<c:out value="${historyVo.canceltype}" />');"class="a_btn a_btn_blue" >영수증</a>
                        <a href="/history/history_all.do"class="a_btn a_btn_blue_line" >목록</a>
                    </div>
                </form>
            </div>
        </div>


<!-- //container -->

<!-- //wrap -->