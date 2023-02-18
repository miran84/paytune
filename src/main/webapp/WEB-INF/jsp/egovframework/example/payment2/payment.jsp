<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script language="javascript" src="https://kspay.ksnet.to/store/KSPayWebV1.4/js/kspay_web.js"></script>
	<script src="/js/payment2.js"></script>
	
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">수기결제(케이에스넷)</strong>
					<form class="form_layout" name="frm" id="frm" method="post"  target="">
					<!-- 0. 공통 환경설정 -->
					<input type="hidden" name="loginId" 		 id="loginId" 		  value="<c:out value="${sessionScope.login_id}" />">
					<input type="hidden" name="mid" 			 id="mid"   		  value="<c:out value='${CPID}' />">
					<input type="hidden" name="productType" 	 id="productType"  	  value="REAL">
					<input type="hidden" name="taxFreeAmount" 	 id="taxFreeAmount"   value="0">
					<input type="hidden" name="interestType" 	 id="interestType"    value="PG">
					<input type="hidden" name="currencyType" 	 id="currencyType"    value="KRW">
						<table>
							<tbody>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">상점ID</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="USERID" placeholder="" id="USERID" value="">
										 <span class="pay_ess">* sms 전송 내역</span>	
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">주문번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="orderNumb" placeholder="주문번호 상세 입력" id="orderNumb" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">결제금액</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="totalAmount" placeholder="숫자만 입력" id="totalAmount" value="" onKeyUp="chk_Number(this);">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>							
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="cardNumb" placeholder="- 제외 입력해주세요." id="cardNumb" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>				
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드유효기간</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="expiryDate" placeholder="YYMM" id="expiryDate" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>								
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">할부 개월</label>
									</td>						   
									<td class="input_desc">
										<select class="width_s" name="installMonth" placeholder="" id="installMonth">
                                            <c:forEach var="i" begin="0" end="12">
												<c:choose>
													<c:when test="${i == 0}">
														<option value="0">일시불</option>
													</c:when>
													<c:when test="${i < 10 && i > 1}">
														<option value="0<c:out value="${i}" />">0<c:out value="${i}" /></option>
													</c:when>
													<c:when test="${i >= 10}">
														<option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
													</c:when>
												</c:choose>
											</c:forEach>											
                                        </select>									 
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">SMS 할부 개월</label>
									</td>						   
									<td class="input_desc">
                                        <span class="checkbox">
                                            <input type="radio" name="sms_quota" value="6" class="input_checkbox" id="sms_quota01" checked>
                                            <label for="sms_quota01">6개월</label>
                                        </span>
                                        <span class="checkbox">
                                            <input type="radio" name="sms_quota" value="12" class="input_checkbox" id="sms_quota02" >
                                            <label for="sms_quota02">12개월</label>
                                        </span>
									</td>
								</tr>														
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">상품명</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="productName" placeholder="구매 상품명 상세 입력" id="productName" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객이름</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="userName" placeholder="" id="userName" value="">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객전화번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="sndMobile" placeholder="" id="sndMobile" value="" onKeyUp="chk_Number(this);">
										 <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">고객이메일</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="userEmail" placeholder="" id="userEmail" value="" >
									</td>
								</tr>
							</tbody>
						</table>

						<div class="btn_box">
							<button type="reset" onclick="fnReset();" class="a_btn a_btn_default">입력 초기화</button>
							<a href="javascript:fnSubmit();" class="a_btn a_btn_blue">관리자 키인결제</a>
							<a href="javascript:fnLinkSubmit();" class="a_btn a_btn_blue_line">결제 링크전송(SMS)</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //container -->

