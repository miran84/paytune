<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<script>

$('.dim').fadeIn();
$('.popup_wrap .popup_detail').fadeIn();


var closePopup = function(){
	$('.popup_wrap .popup_detail').fadeOut();
	$('.dim').fadeOut();
}


</script>	

                <div class="popup_wrap">
                    <div class="popup popup_detail">
                        <div class="popup_head">
                            <strong class="popup_ttl">상세보기</strong>
                            <a class="btn_closed" href="javascript:closePopup();"><img src="../img/btn/btn_closed.png" alt="닫기"></a>
                        </div>
                        <div class="popup_body">
                            <div class="popup_inner">
                                <div class="inner_bottom">
                                    <div class="form_layout detail_layout">
                                        <table>
                                            <tbody>
                                                <tr class="input_box input_box_border">
                                                    <td class="input_ttl">
                                                        <label for="">총결제금액</label>
                                                    </td>
                                                    <td class="input_desc"><c:out value="${settlementVO.d_amount}" />원</td>
                                                    <td class="input_ttl">
                                                        <label for="">승인건</label>
                                                    </td>
                                                    <td class="input_desc"><c:out value="${settlementVO.d_approval_cnt}" />건</td>
                                                </tr>
                                                <tr class="input_box input_box_border">
                                                    <td class="input_ttl">
                                                        <label for="">취소금액</label>
                                                    </td>
                                                    <td class="input_desc"><c:out value="${settlementVO.d_cancel_sum}" />원</td>
                                                    <td class="input_ttl">
                                                        <label for="">취소건</label>
                                                    </td>
                                                    <td class="input_desc"><c:out value="${settlementVO.d_cancel_cnt}" />건</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="table_layout">
                                        <table>
                                            <caption>지엠지페이먼트</caption>
                                            <thead>
                                                <tr>
                                                    <th>상점ID</th>
                                                    <th>CPID</th>
                                                    <th>매입구분</th>
                                                    <th>지급일자</th>
                                                    <th>승인일자</th>
                                                    <th>은행</th>
                                                    <th>주문번호</th>
                                                    <th>구매자</th>
                                                    <th>상품명</th>
                                                    <th>거래금액</th>
                                                    <th>수수료율</th>
                                                    
                                                    <th>수수료</th>
                                                    <th>수수료원가</th>
                                                    
                                                    <th>수수료부가세</th>
                                                    <th>지급액</th>
                                                    <th>영업대행</th>
                                                    <th>대리점</th>
                                                    <!-- th>상태</th-->
                                                </tr>
                                            </thead>
                                            <tbody class="">
                                            	<c:forEach var="result" items="${resultList}" varStatus="status">	
                                                <tr>
                                                    <td><c:out value="${result.store_id}" /></td>
                                                    <td><c:out value="${result.cpid}" /></td>
                                                    <td>매입</td>
                                                    <td><c:out value="${result.period_date}" /></td>
                                                    <td><c:out value="${result.authdate}" /></td>
                                                    <td><c:out value="${result.bank_nm}" /></td>
                                                    <td><c:out value="${result.orderno}" /></td>
                                                    <td><c:out value="${result.username}" /></td>
                                                    <td><c:out value="${result.productname}" /></td>
                                                    <td><c:out value="${result.amount}" />원</td>
                                                    <td><c:out value="${result.commission}" />%</td>
                                                    <td><c:out value="${result.franchisee_commission}" />원</td>
                                                    <td><c:out value="${result.commission_cost}" />원</td>
                                                    <td><c:out value="${result.vat}" />원</td>
                                                    <td><c:out value="${result.settlement}" />원</td>
                                                    <td><c:out value="${result.business_nm2}" /></td>
                                                    <td><c:out value="${result.business_nm3}" /></td>
                                                    <!-- td>Y</td-->
                                                </tr>     
                                                </c:forEach>                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="paging">
                                        <ul class="pager_btn">
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="content" jsFunction="fn_link_page2"  />             
                                        </ul>
                                    </div>
                                    <div class="btn_box">
                                        <a href="javascript:closePopup();" class="a_btn a_btn_blue pop_close_btn">확인</a>
                                    </div>					
                                </div>				
                            </div>
                        </div>
                    </div>
                    <div class="dim"></div>
                </div>
