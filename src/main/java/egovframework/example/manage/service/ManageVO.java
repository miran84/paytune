/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.manage.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class ManageVO extends ManageDefaultVO {

	private static final long serialVersionUID = 1L;

	private int rownum;
	private String role_id;
	private String store_id;
	private String high_store_id;
	private String passwd;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String high_business_nm;
	private String ceo;
	private String ceo_birth;
	private String corp_regist_num;
	private String corp_regist_num2;
	private String corp_type;
	private String business_cond;
	private String industry_type;
	private String tel;
	private String fax;
	private String phone_num;
	private String email;
	private String contract_date;
	private String bank_code;
	private String bank_nm;
	private String account_num;
	private String state;
	private String hompage;
	private String zip_code;
	private String address;
	private String detail_address;
	private String terminal_id;
	private String person_nm1;
	private String person_phone1;
	private String person_email1;
	private String person_nm2;
	private String person_phone2;
	private String person_email2;
	private String person_nm3;
	private String person_phone3;
	private String person_email3;
	private String tax;
	private String commission;
	private String period;
	private String settlement_type;
	private String created_id;   
	private String created_datetime;    
	private String updated_id;   
	private String updated_datetime;
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getHigh_store_id() {
		return high_store_id;
	}
	public void setHigh_store_id(String high_store_id) {
		this.high_store_id = high_store_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getBusiness_nm() {
		return business_nm;
	}
	public void setBusiness_nm(String business_nm) {
		this.business_nm = business_nm;
	}
	
	public String getBusiness_nm2() {
		return business_nm2;
	}
	public void setBusiness_nm2(String business_nm2) {
		this.business_nm2 = business_nm2;
	}
	public String getBusiness_nm3() {
		return business_nm3;
	}
	public void setBusiness_nm3(String business_nm3) {
		this.business_nm3 = business_nm3;
	}
	public String getHigh_business_nm() {
		return high_business_nm;
	}
	public void setHigh_business_nm(String high_business_nm) {
		this.high_business_nm = high_business_nm;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getCeo_birth() {
		return ceo_birth;
	}
	public void setCeo_birth(String ceo_birth) {
		this.ceo_birth = ceo_birth;
	}
	public String getCorp_regist_num() {
		return corp_regist_num;
	}
	public void setCorp_regist_num(String corp_regist_num) {
		this.corp_regist_num = corp_regist_num;
	}
	public String getCorp_regist_num2() {
		return corp_regist_num2;
	}
	public void setCorp_regist_num2(String corp_regist_num2) {
		this.corp_regist_num2 = corp_regist_num2;
	}
	public String getCorp_type() {
		return corp_type;
	}
	public void setCorp_type(String corp_type) {
		this.corp_type = corp_type;
	}
	public String getBusiness_cond() {
		return business_cond;
	}
	public void setBusiness_cond(String business_cond) {
		this.business_cond = business_cond;
	}
	public String getIndustry_type() {
		return industry_type;
	}
	public void setIndustry_type(String industry_type) {
		this.industry_type = industry_type;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContract_date() {
		return contract_date;
	}
	public void setContract_date(String contract_date) {
		this.contract_date = contract_date;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getBank_nm() {
		return bank_nm;
	}
	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getHompage() {
		return hompage;
	}
	public void setHompage(String hompage) {
		this.hompage = hompage;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public String getTerminal_id() {
		return terminal_id;
	}
	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}
	public String getPerson_nm1() {
		return person_nm1;
	}
	public void setPerson_nm1(String person_nm1) {
		this.person_nm1 = person_nm1;
	}
	public String getPerson_phone1() {
		return person_phone1;
	}
	public void setPerson_phone1(String person_phone1) {
		this.person_phone1 = person_phone1;
	}
	public String getPerson_email1() {
		return person_email1;
	}
	public void setPerson_email1(String person_email1) {
		this.person_email1 = person_email1;
	}
	public String getPerson_nm2() {
		return person_nm2;
	}
	public void setPerson_nm2(String person_nm2) {
		this.person_nm2 = person_nm2;
	}
	public String getPerson_phone2() {
		return person_phone2;
	}
	public void setPerson_phone2(String person_phone2) {
		this.person_phone2 = person_phone2;
	}
	public String getPerson_email2() {
		return person_email2;
	}
	public void setPerson_email2(String person_email2) {
		this.person_email2 = person_email2;
	}
	public String getPerson_nm3() {
		return person_nm3;
	}
	public void setPerson_nm3(String person_nm3) {
		this.person_nm3 = person_nm3;
	}
	public String getPerson_phone3() {
		return person_phone3;
	}
	public void setPerson_phone3(String person_phone3) {
		this.person_phone3 = person_phone3;
	}
	public String getPerson_email3() {
		return person_email3;
	}
	public void setPerson_email3(String person_email3) {
		this.person_email3 = person_email3;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getCommission() {
		return commission;
	}
	public void setCommission(String commission) {
		this.commission = commission;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getSettlement_type() {
		return settlement_type;
	}
	public void setSettlement_type(String settlement_type) {
		this.settlement_type = settlement_type;
	}
	public String getCreated_id() {
		return created_id;
	}
	public void setCreated_id(String created_id) {
		this.created_id = created_id;
	}
	public String getCreated_datetime() {
		return created_datetime;
	}
	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}
	public String getUpdated_id() {
		return updated_id;
	}
	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
	}
	public String getUpdated_datetime() {
		return updated_datetime;
	}
	public void setUpdated_datetime(String updated_datetime) {
		this.updated_datetime = updated_datetime;
	}

	
}
