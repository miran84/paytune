<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	<script src="/js/manage2_view.js"></script>
<!-- container -->

			<div class="inner clearfix">
				<div class="col">
					<strong class="sub_ttl">가맹점정보</strong>
					<form class="form_layout" name="frm" id="frm" method="post" action="" target="">
					<input type="hidden" name="created_id" id="created_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="updated_id" id="updated_id" value="${sessionScope.login_id}" />
					<input type="hidden" name="store_id" id="store_id" value="${manage2Vo.store_id }" />
					<input type="hidden" name="role_id" id="role_id" value="1004" />

						<table>
							<tbody>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상점ID</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.store_id }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">상호명</label></td>
									<td class="input_desc" colspan="4">${manage2Vo.business_nm }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.ceo }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자등록번호</label></td>
									<td class="input_desc" colspan="4">${manage2Vo.corp_regist_num }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">대표자생년월일</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.ceo_birth }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업자구분</label></td>
									<td class="input_desc" colspan="4">
									${manage2Vo.corp_type eq 'A'?'개인':(manage2Vo.corp_type eq 'B'?'법인':'비영리 법인') }									
									${manage2Vo.corp_regist_num2 }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">업태</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.business_cond }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">업종</label></td>
									<td class="input_desc" colspan="4">${manage2Vo.industry_type }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">전화번호</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.tel }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">FAX</label></td>
									<td class="input_desc" colspan="4">${manage2Vo.fax }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">휴대폰번호</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.phone_num }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산계좌번호</label></td>
									<td class="input_desc" colspan="4">
									${manage2Vo.bank_nm }								
									${manage2Vo.account_num }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1">
									<label class="" for="">Email 주소</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.email }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">계약담당자</label></td>
									<td class="input_desc" colspan="4">
									${manage2Vo.person_nm1 }
									${manage2Vo.person_phone1 }
									${manage2Vo.person_email1 }
									</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">홈페이지 주소</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.hompage }</td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산담당자</label></td>
									<td class="input_desc" colspan="4">
									${manage2Vo.person_nm2 }
									${manage2Vo.person_phone2 }
									${manage2Vo.person_email2 }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">계약일자</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.contract_date }
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">기술담당자</label>
									</td>
									<td class="input_desc" colspan="4">
									${manage2Vo.person_nm3 }
									${manage2Vo.person_phone3 }
									${manage2Vo.person_email3 }</td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">CPID</label></td>
									<td class="input_desc" colspan="2">
									${manage2Vo.cpid }
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">사업장 주소</label>
									</td>
									<td class="input_desc" colspan="4">
                                        ${manage2Vo.zip_code }
										${manage2Vo.address }
                                        ${manage2Vo.detail_address }
                                    </td>
								</tr>
								<tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">터미널ID/단말기번호</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.terminal_id }, ${manage2Vo.imei }
									</td>
									<td class="input_ttl" colspan="1"><label class="" for="">대리점</label></td>
									<td class="input_desc" colspan="4">
									${manage2Vo.high_business_nm }									
									</td>										
								</tr>
                               <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">수수료</label></td>
									<td class="input_desc" colspan="2">${manage2Vo.commission}%</td>
									<td class="input_ttl" colspan="1"><label class="" for="">세금계산서 발행</label>
									</td>
									<td class="input_desc" colspan="4">
                                        ${manage2Vo.tax eq 'Y'?'발행':'미발행'}
                                    </td>
                                </tr>
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">정산방식</label>
									</td>
									<td class="input_desc" colspan="2">
                                        직접결제
                                    </td>
									<td class="input_ttl" colspan="1"><label class="" for="">정산주기</label>
									</td>
									<td class="input_desc" colspan="4">
                                        D+${manage2Vo.period}
                                    </td>
								</tr>															
                                <tr class="input_box input_box_border">
									<td class="input_ttl" colspan="1"><label class="" for="">상태구분</label>
									</td>
									<td class="input_desc" colspan="7">
                                        ${manage2Vo.state eq 'Y'?'사용':'중지'}
                                    </td>
								</tr>															
							</tbody>
						</table>

						<div class="btn_box">
							<a href="/manage2/manage2.do?view_type=L" class="a_btn a_btn_blue_line">이전</a>
							<a href="/manage2/manage2.do" class="a_btn a_btn_default" >목록</a>
						</div>
					</form>
				</div>
			</div>



	<script>
	document.getElementById('go_back').addEventListener('click', () => {
	  window.history.back();
	});

	</script>



