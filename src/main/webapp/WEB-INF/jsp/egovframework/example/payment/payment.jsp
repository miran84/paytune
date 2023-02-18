<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="/js/payment.js"></script>
	<!-- container -->

			<div class="inner clearfix">
				<div class="col">
				 <strong class="sub_ttl">수기결제(페이조아)</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="/payment/cardSugido.do" target="">
					<input type="hidden" name="TAXFREECD" id="TAXFREECD" value="00">
					<input type="hidden" name="PRODUCTTYPE" id="PRODUCTTYPE" value="2">
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
                                         <input class="width_mm" type="text" name="ORDERNO" placeholder="주문번호 상세 입력" id="ORDERNO" value="">
                                         <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<!-- tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">상품구분</label>
									</td>						   
									<td class="input_desc">
										<select class="width_mm" name="PRODUCTTYPE" id="PRODUCTTYPE">
                                            <option value="1" >디지털</option>
                                            <option value="2" selected>실물</option>
                                        </select>
									</td>
								</tr-->
								<!-- tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">과세 비과세 여부</label>
									</td>						   
									<td class="input_desc">
										<select class="width_mm" name="TAXFREECD" id="TAXFREECD">
                                            <option value="00" selected>과세</option>
                                            <option value="01">비과세</option>
                                        </select>
									</td>
								</tr-->
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">결제금액</label>
									</td>						   
									<td class="input_desc">
                                         <input class="width_mm" type="text" name="AMOUNT" placeholder="숫자만 입력" id="AMOUNT" value="" onKeyUp="chk_Number(this);">
                                         <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>							
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="CARDNO" placeholder="- 제외 입력해주세요." id="CARDNO" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>						
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드유효기간</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="EXPIRATIONDATE" placeholder="YYYYMM" id="EXPIRATIONDATE" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">할부 개월</label>
									</td>						   
									<td class="input_desc">
										<select class="width_s" name="QUOTA" placeholder="" id="QUOTA">
                                            <c:forEach var="i" begin="0" end="12">
												<c:choose>
													<c:when test="${i == 0}">
														<option value="00">일시불</option>
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
										<label class="" for="">과금 유형</label>
									</td>						   
									<td class="input_desc">
                                        <span class="checkbox">
                                            <input type="radio" name="BILLTYPE" value="13" class="input_checkbox" id="BILLTYPE01" checked onclick="jsBillType('13');">
                                            <label for="BILLTYPE01">수기일반</label>
                                        </span>
                                        <span class="checkbox">
                                            <input type="radio" name="BILLTYPE" value="18" class="input_checkbox" id="BILLTYPE02" onclick="jsBillType('18');">
                                            <label for="BILLTYPE02">수기비인증</label>
                                        </span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">SMS 할부 개월</label>
									</td>						   
									<td class="input_desc">
                                        <span class="checkbox">
                                            <input type="radio" name="SMS_QUOTA" value="6" class="input_checkbox" id="SMS_QUOTA01" checked>
                                            <label for="SMS_QUOTA01">6개월</label>
                                        </span>
                                        <span class="checkbox">
                                            <input type="radio" name="SMS_QUOTA" value="12" class="input_checkbox" id="SMS_QUOTA02" >
                                            <label for="SMS_QUOTA02">12개월</label>
                                        </span>
									</td>
								</tr>
								<tr class="input_box input_box_border" id="TR_CARDAUTH">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드명의자 주민/사업자번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="CARDAUTH" placeholder="카드명의자 주민 앞6자리/사업자번호 입력(000-00-00000)" id="CARDAUTH" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>
								<tr class="input_box input_box_border" id="TR_CARDPASSWORD">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">카드명의자 비밀번호</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="password" name="CARDPASSWORD" placeholder="카드명의자 비밀번호 입력" id="CARDPASSWORD" value="" onKeyUp="chk_Number(this);">
									</td>
								</tr>
								<!-- tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">상품코드</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="PRODUCTCODE" placeholder="상품코드 입력" id="PRODUCTCODE" value="테스트상품">
									</td>
								</tr-->
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">상품명</label>
									</td>						   
									<td class="input_desc">
                                         <input class="width_mm" type="text" name="PRODUCTNAME" placeholder="구매 상품명 상세 입력" id="PRODUCTNAME" value="">
                                         <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객이름</label>
									</td>						   
									<td class="input_desc">
                                         <input class="width_mm" type="text" name="USERNAME" placeholder="" id="USERNAME" value="">
                                         <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
                                    <!-- 필수값 -->
									<td class="input_ttl">
										<label class="" for="">고객전화번호</label>
									</td>						   
									<td class="input_desc">
                                         <input class="width_mm" type="text" name="USERPHONE" placeholder="" id="USERPHONE" value="" onKeyUp="chk_Number(this);">
                                         <span class="pay_ess">* sms 전송 내역</span>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">고객이메일</label>
									</td>						   
									<td class="input_desc">
										 <input class="width_mm" type="text" name="EMAIL" placeholder="" id="EMAIL" value="" >
									</td>
								</tr>
								<!-- tr class="input_box input_box_border">
									<td class="input_ttl">
										<label class="" for="">링크유효시간 (0~100시간)</label>
									</td>						   
									<td class="input_desc">
										<select class="width_mm" name="VALIDHOUR" id="VALIDHOUR">
                                            <option value="">02 시간</option>
                                        </select>
									</td>
								</tr-->
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

