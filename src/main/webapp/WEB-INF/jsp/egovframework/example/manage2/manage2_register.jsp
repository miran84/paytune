<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
<c:choose>
 <c:when test="${sessionScope.role_id eq '1001'}">
	getOption('#high_store_id', 'high_store_id2', 'N', '');
 </c:when>
 <c:when test="${sessionScope.role_id eq '1002'}">
	getOption2('#high_store_id', 'high_store_id2', '${sessionScope.login_id}', '', '');
</c:when> 
</c:choose>
</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage2_register.js"></script>

<!-- container -->

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">가맹점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="passwd" id="passwd" value="1111" />
					<input type="hidden" name="role_id" id="role_id" value="1004" />

						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="store_id" placeholder="" id="store_id"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="business_nm" placeholder="" id="business_nm"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo" placeholder="" id="ceo"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="corp_regist_num" placeholder="000-00-00000" id="corp_regist_num"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo_birth" placeholder="yyyy-mm-dd" id="ceo_birth"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="corp_type" placeholder="" id="corp_type">
											<option value="A">개인</option>
											<option value="B">법인</option>
											<option value="C">비영리 법인</option>
									</select>									
									<input class="width_s" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="business_cond" placeholder="" id="business_cond"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="industry_type" placeholder="" id="industry_type"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="tel" name="tel" id="tel"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="tel" name="fax" id="fax"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="phone_num" id="phone_num"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="bank_code" placeholder="" id="bank_code">
									</select>									
									<input class="width_s" type="text" name="account_num" placeholder="" id="account_num">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="email" name="email" id="email"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm1" id="person_nm1"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone1" id="person_phone1"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email1" id="person_email1">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_380" type="text" name="hompage" placeholder="" id="hompage" value="http://"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm2" id="person_nm2"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone2" id="person_phone2"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email2" id="person_email2"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="contract_date" placeholder="yyyy-mm-dd" id="contract_date">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" placeholder="이름" name="person_nm3" id="person_nm3"> 
									<input class="width_s" type="tel" placeholder="연락처" name="person_phone3" id="person_phone3"> 
									<input class="width_s" type="text" placeholder="이메일" name="person_email3" id="person_email3"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">CPID</label></td>
									<td class="input_desc" colspan="2">
                                        <input class="width_s" type="text" name="cpid" placeholder="" id="cpid">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label></td>
									<td class="input_desc" colspan="4">
                                        <input class="width_80" type="text" name="zip_code" placeholder="" id="zip_code" readonly="readonly">
										<button class="btn_search" type="button" onclick="jsDaumPostcode();" style="margin: 0 7px;">
											<img src="../img/btn/btn_search.png"  alt="찾기">
										</button> 
										<input class="width_240" type="text" name="address" placeholder="" id="address" >
                                        <input class="width_s" type="text" name="detail_address" placeholder="" id="detail_address">
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">터미널ID/단말기번호</label></td>
									<td class="input_desc" colspan="2">
                                        <input class="width_ss" type="text" name="terminal_id" placeholder="" id="terminal_id" >
                                        <input class="width_ss" type="text" name="imei" placeholder="" id="imei" >
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">${sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002' ? '대리점':''}</label></td>
									<td class="input_desc" colspan="4">
									<c:choose>
									 <c:when test="${sessionScope.role_id eq '1001' || sessionScope.role_id eq '1002'}">
										<select class="width_s" name="high_store_id" placeholder="" id="high_store_id">
										</select>									
									 </c:when>
									 <c:when test="${sessionScope.role_id eq '1003'}">
									 	<input type="hidden" name="high_store_id" id="high_store_id" value="${sessionScope.login_id}" />
									</c:when> 
									</c:choose>									
									</td>									
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="number" name="commission" placeholder="" id="commission">%</td>
									<td class="input_ttl" colspan="1"><label class="" for="">세금계산서 발행</label>
									</td>
									<td class="input_desc" colspan="4">
                                        <select class="width_s bill_select"	name="tax" placeholder="" id="tax">
                                            <option value="">선택</option>
                                            <option value="Y">발행</option>
                                            <option value="N">미발행</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label class="" for="">정산방식</label></td>
									<td class="input_desc" colspan="2">
                                        <select class="width_s" name="" id="">
                                            <option value="">선택</option>
                                            <option value="">일반정산</option>
                                            <option value="">직접정산</option>
                                        </select>
                                    </td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산주기</label>
									</td>
									<td class="input_desc" colspan="4">
                                       <select class="width_s"	name="period" placeholder="" id="period">
                                            <option value="">선택</option>
                                            <c:forEach var="i" begin="0" end="29">
	                                            <option value="<c:out value="${i}" />">D+<c:out value="${i}" /></option>
											</c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="input_box input_box_border">                               
                                    <td class="input_ttl" colspan="1"><label class="" for="">상태구분</label></td>
                                    <td class="input_desc" colspan="7">
                                    <select class="width_ss" name="state" placeholder="" id="state">
                                            <option value="Y">사용</option>
                                            <option value="N">중지</option>
                                    </select>
                                    </td>                                    
                                </tr>															
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage2/manage2.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="javascript:fnSubmit();" id="frmAdd" class="a_btn a_btn_blue">등록</a> <a href="/manage2/manage2.do" 	class="a_btn a_btn_default">목록</a>
						</div>
					</form>
				</div>
			</div>



