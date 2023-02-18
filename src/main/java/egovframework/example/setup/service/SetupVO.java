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
package egovframework.example.setup.service;

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
public class SetupVO extends SetupDefaultVO {

	private static final long serialVersionUID = 1L;

	private int rownum;
	private String state;
	private String store_id;
	private String ceo;
	private String phone_num;
	private String email;
	private String auth_type;
	private String auth_result;
	private String type;
	private String menu_id;
	private String high_menu_id;
	private String menu_nm;
	private String menu_url;
	private String ip;
	private String memo;
	private String use_yn;
	private String bank_code;
	private String bank_nm;
	private int tocnt;
	private int no;
	private String check_yn;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getHigh_menu_id() {
		return high_menu_id;
	}
	public void setHigh_menu_id(String high_menu_id) {
		this.high_menu_id = high_menu_id;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public int getTocnt() {
		return tocnt;
	}
	public void setTocnt(int tocnt) {
		this.tocnt = tocnt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}
	public String getAuth_result() {
		return auth_result;
	}
	public void setAuth_result(String auth_result) {
		this.auth_result = auth_result;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCheck_yn() {
		return check_yn;
	}
	public void setCheck_yn(String check_yn) {
		this.check_yn = check_yn;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
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
