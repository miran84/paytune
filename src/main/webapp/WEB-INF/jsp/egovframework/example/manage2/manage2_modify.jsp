<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage2_modify.js"></script>
	<script>
		 getOption('#bank_code', 'bank', 'N', '${manage2Vo.bank_code }');
		 getOption('#high_store_id', 'high_store_id2', 'N', '${manage2Vo.high_store_id }');
	</script>    
<!-- container -->

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">가맹점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="" enctype="multipart/form-data">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="store_id" id="store_id" value="${manage2Vo.store_id }" />
					<input type="hidden" name="role_id" id="role_id" value="1004" />

						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="" placeholder="uwal" id="" value="${manage2Vo.store_id }" disabled></td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="business_nm" placeholder="유월커뮤니케이션" id="business_nm" value="${manage2Vo.business_nm }" disabled></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo" placeholder="김평진" id="ceo" value="${manage2Vo.ceo }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="corp_regist_num" placeholder="107-87-86839" id="corp_regist_num" value="${manage2Vo.corp_regist_num }" disabled></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="ceo_birth" placeholder="1981.12.09" id="ceo_birth" value="${manage2Vo.ceo_birth }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_ss" name="corp_type" placeholder="" id="corp_type" disabled>
											<option value="A" ${manage2Vo.corp_type eq 'A' ?'selected':''}>개인</option>
											<option value="B" ${manage2Vo.corp_type eq 'B' ?'selected':''}>법인</option>
											<option value="C" ${manage2Vo.corp_type eq 'C' ?'selected':''}>비영리 법인</option>
									</select>				
									<c:if test="${!empty manage2Vo.corp_regist_num2}">
									<input class="width_s" type="text" name="corp_regist_num2" placeholder="법인등록번호" id="corp_regist_num2" value="${manage2Vo.corp_regist_num2 }" disabled>
									</c:if>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="business_cond" placeholder="서비스" id="business_cond" value="${manage2Vo.business_cond }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="text" name="industry_type" placeholder="온라인정보제공업" id="industry_type" value="${manage2Vo.industry_type }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="tel" name="tel" placeholder="02-0000-0000" id="tel" value="${manage2Vo.tel }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4"><input class="width_s" type="tel" name="fax" placeholder="02-0000-0000" id="fax" value="${manage2Vo.fax }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="phone_num" placeholder="010-0000-0000" id="phone_num" value="${manage2Vo.phone_num }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="bank_code" placeholder="" id="bank_code" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</select>									
									<input class="width_s" type="text" name="account_num" placeholder="000-000-000000" id="account_num" value="${manage2Vo.account_num }" ${sessionScope.role_id eq '1001'?'':'disabled' }>
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="email" name="email" placeholder="text@test.com" id="email" value="${manage2Vo.email }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm1" placeholder="홍길동" id="person_nm1" value="${manage2Vo.person_nm1 }"> 
									<input class="width_s" type="tel" name="person_phone1" placeholder="010-0000-0000" id="person_phone1" value="${manage2Vo.person_phone1 }"> 
									<input class="width_s" type="text" name="person_email1" placeholder="test@test.com" id="person_email1" value="${manage2Vo.person_email1 }">
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2"><input class="width_380" type="text" name="hompage" placeholder="" id="hompage" value="${manage2Vo.hompage }"></td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm2" placeholder="홍길동" id="person_nm2" value="${manage2Vo.person_nm2 }"> 
									<input class="width_s" type="tel" name="person_phone2" placeholder="010-0000-0000" id="person_phone2" value="${manage2Vo.person_phone2 }"> 
									<input class="width_s" type="text" name="person_email2" placeholder="test@test.com" id="person_email2" value="${manage2Vo.person_email2 }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="text" name="contract_date" placeholder="2020.10.05" id="contract_date" value="${manage2Vo.contract_date }" disabled>
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									<input class="width_ss" type="text" name="person_nm3" placeholder="홍길동" id="person_nm3" value="${manage2Vo.person_nm3 }"> 
									<input class="width_s" type="tel" name="person_phone3" placeholder="010-0000-0000" id="person_phone3" value="${manage2Vo.person_phone3 }"> 
									<input class="width_s" type="text" name="person_email3" placeholder="test@test.com" id="person_email3" value="${manage2Vo.person_email3 }"></td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">CPID</label></td>
									<td class="input_desc" colspan="2">
										<input class="width_s" type="text" name="cpid" placeholder="" id="cpid" value="${manage2Vo.cpid }" >
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label>
									</td>
									<td class="input_desc" colspan="4">
                                        <input class="width_80" type="text" name="zip_code" placeholder="" id="zip_code" value="${manage2Vo.zip_code }" readonly="readonly">
										<button class="btn_search" type="button" onclick="jsDaumPostcode();" style="margin: 0 7px;">
											<img src="../img/btn/btn_search.png" alt="찾기">
										</button> 
										<input class="width_240" type="text" name="address" placeholder="" id="address" value="${manage2Vo.address }" >
                                        <input class="width_s" type="text" name="detail_address" placeholder="" id="detail_address" value="${manage2Vo.detail_address }">
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">터미널ID/단말기번호</label></td>
									<td class="input_desc" colspan="2">
                                        <input class="width_ss" type="text" name="terminal_id" placeholder="" id="terminal_id" value="${manage2Vo.terminal_id }">
                                        <input class="width_ss" type="text" name="imei" placeholder="" id="imei" value="${manage2Vo.imei }">
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
									<td class="input_desc" colspan="4">
									<select class="width_s" name="high_store_id" placeholder="" id="high_store_id" disabled>
									</select>									
									</td>										
								</tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
									<td class="input_desc" colspan="2"><input class="width_s" type="number" name="commission" placeholder="" id="commission" value="${manage2Vo.commission }" ${sessionScope.role_id eq '1001'?'':'disabled' }>%</td>
									<td class="input_ttl" colspan="1"><label class="" for="">세금계산서 발행</label>
									</td>
									<td class="input_desc" colspan="4">
                                        <select class="width_s bill_select"	name="tax" placeholder="" id="tax" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                            <option value="">선택</option>
                                            <option value="Y" ${manage2Vo.tax eq 'Y' ?'selected':'' }>발행</option>
                                            <option value="N" ${manage2Vo.tax eq 'N' ?'selected':'' }>미발행</option>
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
                                       <select class="width_s"	name="period" placeholder="" id="period" ${sessionScope.role_id eq '1001'?'':'disabled' }>
                                            <option value="">선택</option>
                                            <c:forEach var="i" begin="0" end="29">
	                                            <option value="<c:out value="${i}"/>" ${manage2Vo.period == i ?'selected':'' }>D+<c:out value="${i}" /></option>
											</c:forEach>
                                        </select>
                                    </td> 
                                </tr>	 
                                <tr class="input_box input_box_border">        
                                    <td class="input_ttl" colspan="1"><label class="" for="">상태구분</label></td>
									<td class="input_desc" colspan="7">
									<select class="width_ss" name="state" placeholder="" id="state">
											<option value="Y" ${manage2Vo.state eq 'Y'?'selected':''}>사용</option>
											<option value="N" ${manage2Vo.state eq 'N'?'selected':''}>중지</option>
									</select>
									</td>                                       
                                </tr>	
                                <tr class="input_box input_box_border">
                                    <td class="input_ttl" colspan="1"><label for="">패스워드 수정</label></td>
                                    <td class="input_desc" colspan="7">
                                     	<span>패스워드</span>
                                        <input class="width_s" type="password" name="passwd" placeholder="" id="passwd" value="">
                                        <span>/</span>
                                        <span>패스워드</span>
                                        <input class="width_s" type="password" name="repasswd" placeholder="" id="repasswd" value="">
                                    </td>								
								</tr>							
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage2/manage2.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="javascript:fnSubmit();" id="frmMod" class="a_btn a_btn_blue">정보수정</a> <a href="/manage2/manage2.do"
								class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>






