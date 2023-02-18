<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
    <script src="/js/mypage_info.js"></script>
    <script>
	    getOption('#bank_code', 'bank', 'N', '${sessionScope.sessionLoginAction.bank_code }');
    </script>

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">정보수정</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="store_id" id="store_id" value="${sessionScope.login_id }" />
					<input type="hidden" name="role_id" id="role_id" value="${sessionScope.role_id }" />
					<input type="hidden" name="login_first" id="login_first" value="N" />
						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="" placeholder="" id="" value="${sessionScope.sessionLoginAction.store_id }" disabled></td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="business_nm" placeholder="" id="business_nm" value="${sessionScope.sessionLoginAction.business_nm }" ></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo" placeholder="" id="ceo" value="${sessionScope.sessionLoginAction.ceo }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="corp_regist_num" placeholder="000-00-00000" id="corp_regist_num" value="${sessionScope.sessionLoginAction.corp_regist_num }" ></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo_birth" placeholder="yyyy-mm-dd" id="ceo_birth" value="${sessionScope.sessionLoginAction.ceo_birth }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="corp_type" placeholder="" id="corp_type" >
										<option value="A" ${sessionScope.sessionLoginAction.corp_type eq 'A' ?'selected':''}>개인</option>
										<option value="B" ${sessionScope.sessionLoginAction.corp_type eq 'B' ?'selected':''}>법인</option>
										<option value="C" ${sessionScope.sessionLoginAction.corp_type eq 'C' ?'selected':''}>비영리 법인</option>
									</select>				
									<c:if test="${!empty sessionScope.sessionLoginAction.corp_regist_num2}">
									<input class="width_s" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2" value="${sessionScope.sessionLoginAction.corp_regist_num2 }" >
									</c:if>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="business_cond" placeholder="" id="business_cond" value="${sessionScope.sessionLoginAction.business_cond }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="industry_type" placeholder="" id="industry_type" value="${sessionScope.sessionLoginAction.industry_type }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${sessionScope.sessionLoginAction.tel }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${sessionScope.sessionLoginAction.fax }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${sessionScope.sessionLoginAction.phone_num }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="bank_code" placeholder="" id="bank_code" ${sessionScope.role_id eq '1001'?'':'' }>
									</select>									
									<input class="width_s" type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${sessionScope.sessionLoginAction.account_num }" ${sessionScope.role_id eq '1001'?'':'' }>
									</td>									
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="email" name="email" placeholder="" id="email" value="${sessionScope.sessionLoginAction.email }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm1" placeholder="이름" id="person_nm1" value="${sessionScope.sessionLoginAction.person_nm1 }"> 
									<input class="width_s" type="tel" name="person_phone1" placeholder="연락처" id="person_phone1" value="${sessionScope.sessionLoginAction.person_phone1 }"> 
									<input class="width_s" type="e-mail" name="person_email1" placeholder="이메일" id="person_email1" value="${sessionScope.sessionLoginAction.person_email1 }">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_240" type="text" name="hompage" placeholder="" id="hompage" value="${sessionScope.sessionLoginAction.hompage }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm2" placeholder="이름" id="person_nm2" value="${sessionScope.sessionLoginAction.person_nm2 }"> 
									<input class="width_s" type="tel" name="person_phone2" placeholder="연락처" id="person_phone2" value="${sessionScope.sessionLoginAction.person_phone2 }"> 
									<input class="width_s" type="e-mail" name="person_email2" placeholder="이메일" id="person_email2" value="${sessionScope.sessionLoginAction.person_email2 }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="contract_date" placeholder="yyyy-mm-dd" id="contract_date" value="${sessionScope.sessionLoginAction.contract_date }" >
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm3" placeholder="이름" id="person_nm3" value="${sessionScope.sessionLoginAction.person_nm3 }"> 
									<input class="width_s" type="tel" name="person_phone3" placeholder="연락처" id="person_phone3" value="${sessionScope.sessionLoginAction.person_phone3 }"> 
									<input class="width_s" type="e-mail" name="person_email3" placeholder="이메일" id="person_email3" value="${sessionScope.sessionLoginAction.person_email3 }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_80" type="text" name="zip_code" placeholder="" id="zip_code" value="${sessionScope.sessionLoginAction.zip_code }" readonly="readonly">
										<button class="btn_search" type="button" onclick="jsDaumPostcode();" style="margin: 0 7px;">
											<img src="../img/btn/btn_search.png"  alt="찾기">
										</button> 
										<input class="width_240" type="text" name="address" placeholder="" id="address" value="${sessionScope.sessionLoginAction.address }" readonly="readonly">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 세부주소</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_380" type="text" name="detail_address" placeholder="" id="detail_address" value="${sessionScope.sessionLoginAction.detail_address }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">터미널ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="terminal_id" placeholder="" id="terminal_id" value="${sessionScope.sessionLoginAction.terminal_id }">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="commission" placeholder="" id="commission" value="${sessionScope.sessionLoginAction.commission }" ${sessionScope.role_id eq '1001'?'':'disabled' }>%</td>									
								</tr>
								<c:if test="${sessionScope.role_id eq '1002' || sessionScope.role_id eq '1003'}">       
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">지급상태</label></td>
									<td class="input_desc" colspan="7">
									<select class="width_ss" name="tax" placeholder="" id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
										<option value="Y" ${sessionScope.sessionLoginAction.tax eq 'Y' ?'selected':''}>세금계산서</option>
										<option value="N" ${sessionScope.sessionLoginAction.tax eq 'N' ?'selected':''}>원천징수</option>
									</select>										
		                            <input type="hidden" name="period" id="period" value="30" />
									</td>
								</tr>					
	                            </c:if>               
	                            <c:if test="${sessionScope.role_id eq '1004'}">        											
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">세금계산서 발행</label></td>
									<td class="input_desc" colspan="2">
									<select class="width_ss" name="tax" placeholder="" id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
										<option value="Y" ${sessionScope.sessionLoginAction.tax eq 'Y' ?'selected':''}>발행</option>
										<option value="N" ${sessionScope.sessionLoginAction.tax eq 'N' ?'selected':''}>미발행</option>
									</select>	
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산주기</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="period" placeholder="" id="period" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                        <c:forEach var="i" begin="1" end="30">
                                            <option value="<c:out value="${i}" />" ${i == sessionScope.sessionLoginAction.period ? 'selected':''}><c:out value="${i==1?'당':i}" />일</option>
                                        </c:forEach>
									</select>
									</td>									
								</tr>
								</c:if>      
							</tbody>
						</table>

						<div class="btn_box">
							<a href="javascript:fnSubmit();" class="a_btn a_btn_blue">수정하기</a> 
							<a href="${sessionScope.MAIN}" class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>


	<!-- //container -->

	<!-- //wrap -->


