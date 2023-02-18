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
package egovframework.example.settlement.service;

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
public class SettlementVO extends SettlementDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;

	private String rownum;
	private int tocnt;
	private String no;
	private String daoutrx;
	private String store_id;
	private String auth_id;
	private String userid;
	private String hold_yn;
	private String orderno;
	private String username;
	private String productname;
	private String amount;
	private String vat;
	private String vat2;
	private String vat3;
	private String hold;
	private String authdate;
	private String canceldate;
	private String start_date;
	private String end_date;
	private String start_end_date;
	private String cardname;
	private String cardcode;
	private String cardno;
	private String quota;
	private String terminal_id;
	private String terminalid;
	private String imei;
	private String commission;
	private String commission2;
	private String commission3;
	private String franchisee_commission;
	private String commission_total;
	private String commission_total2;
	private String commission_total3;
	private String commission_total4;
	private String business_nm;
	private String business_nm2;
	private String business_nm3;
	private String tax;
	private String tax2;
	private String amount2;
	private String bank_nm;
	private String period;
	private String state;
	private String canceltype;
	private String status;
	private String ym;
	private String sun;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String cpid;
	private String no_cpid;
	private String cp_type;
	private String amount_sum;
	private String period_date;
	private String period_date2;
	private String period_date3;
	private String settlement;
	private String settlement2;
	private String settlement3;
	private String commission_cost;
	private String total_cnt;
	private String total_approval;
	private String total_cancel_sum;
	private String total_approval_cnt;
	private String total_cancel_cnt;
	private String total_settlement;
	private String total_settlement2;
	private String total_settlement3;
	private String total_vat;
	private String total_vat2;
	private String total_vat3;
	private String total_amount;
	private String total_amount2;
	private String total_amount3;
	private String d_amount;
	private String d_cancel_sum;
	private int d_total_cnt;
	private String d_approval_cnt;
	private String d_cancel_cnt;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTocnt() {
		return tocnt;
	}

	public void setTocnt(int tocnt) {
		this.tocnt = tocnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getDaoutrx() {
		return daoutrx;
	}

	public void setDaoutrx(String daoutrx) {
		this.daoutrx = daoutrx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getHold_yn() {
		return hold_yn;
	}

	public void setHold_yn(String hold_yn) {
		this.hold_yn = hold_yn;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getVat() {
		return vat;
	}

	public void setVat(String vat) {
		this.vat = vat;
	}

	public String getHold() {
		return hold;
	}

	public void setHold(String hold) {
		this.hold = hold;
	}

	public String getAuthdate() {
		return authdate;
	}

	public void setAuthdate(String authdate) {
		this.authdate = authdate;
	}
	
	public String getCanceldate() {
		return canceldate;
	}

	public void setCanceldate(String canceldate) {
		this.canceldate = canceldate;
	}

	public String getCardname() {
		return cardname;
	}

	public void setCardname(String cardname) {
		this.cardname = cardname;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public String getTerminalid() {
		return terminalid;
	}

	public void setTerminalid(String terminalid) {
		this.terminalid = terminalid;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getCommission2() {
		return commission2;
	}

	public void setCommission2(String commission2) {
		this.commission2 = commission2;
	}

	public String getCommission3() {
		return commission3;
	}

	public void setCommission3(String commission3) {
		this.commission3 = commission3;
	}
	
	public String getFranchisee_commission() {
		return franchisee_commission;
	}

	public void setFranchisee_commission(String franchisee_commission) {
		this.franchisee_commission = franchisee_commission;
	}

	public String getCommission_total() {
		return commission_total;
	}

	public void setCommission_total(String commission_total) {
		this.commission_total = commission_total;
	}

	public String getCommission_total2() {
		return commission_total2;
	}

	public void setCommission_total2(String commission_total2) {
		this.commission_total2 = commission_total2;
	}

	public String getCommission_total3() {
		return commission_total3;
	}

	public void setCommission_total3(String commission_total3) {
		this.commission_total3 = commission_total3;
	}

	public String getCommission_total4() {
		return commission_total4;
	}

	public void setCommission_total4(String commission_total4) {
		this.commission_total4 = commission_total4;
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

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTax2() {
		return tax2;
	}

	public void setTax2(String tax2) {
		this.tax2 = tax2;
	}

	public String getAmount2() {
		return amount2;
	}

	public void setAmount2(String amount2) {
		this.amount2 = amount2;
	}

	public String getBank_nm() {
		return bank_nm;
	}

	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCanceltype() {
		return canceltype;
	}

	public void setCanceltype(String canceltype) {
		this.canceltype = canceltype;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getYm() {
		return ym;
	}

	public void setYm(String ym) {
		this.ym = ym;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getTue() {
		return tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getWed() {
		return wed;
	}

	public void setWed(String wed) {
		this.wed = wed;
	}

	public String getThu() {
		return thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getFri() {
		return fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public String getSat() {
		return sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	
	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getStart_end_date() {
		return start_end_date;
	}

	public void setStart_end_date(String start_end_date) {
		this.start_end_date = start_end_date;
	}

	public String getTerminal_id() {
		return terminal_id;
	}

	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}

	public String getCpid() {
		return cpid;
	}

	public void setCpid(String cpid) {
		this.cpid = cpid;
	}

	public String getNo_cpid() {
		return no_cpid;
	}

	public void setNo_cpid(String no_cpid) {
		this.no_cpid = no_cpid;
	}

	public String getCp_type() {
		return cp_type;
	}

	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}

	public String getAmount_sum() {
		return amount_sum;
	}

	public void setAmount_sum(String amount_sum) {
		this.amount_sum = amount_sum;
	}

	public String getPeriod_date() {
		return period_date;
	}

	public void setPeriod_date(String period_date) {
		this.period_date = period_date;
	}

	public String getPeriod_date2() {
		return period_date2;
	}

	public void setPeriod_date2(String period_date2) {
		this.period_date2 = period_date2;
	}

	public String getPeriod_date3() {
		return period_date3;
	}

	public void setPeriod_date3(String period_date3) {
		this.period_date3 = period_date3;
	}

	public String getSettlement() {
		return settlement;
	}

	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}

	public String getVat2() {
		return vat2;
	}

	public void setVat2(String vat2) {
		this.vat2 = vat2;
	}

	public String getVat3() {
		return vat3;
	}

	public void setVat3(String vat3) {
		this.vat3 = vat3;
	}

	public String getSettlement2() {
		return settlement2;
	}

	public void setSettlement2(String settlement2) {
		this.settlement2 = settlement2;
	}

	public String getSettlement3() {
		return settlement3;
	}

	public void setSettlement3(String settlement3) {
		this.settlement3 = settlement3;
	}

	public String getCommission_cost() {
		return commission_cost;
	}

	public void setCommission_cost(String commission_cost) {
		this.commission_cost = commission_cost;
	}

	public String getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(String total_cnt) {
		this.total_cnt = total_cnt;
	}

	public String getTotal_approval() {
		return total_approval;
	}

	public void setTotal_approval(String total_approval) {
		this.total_approval = total_approval;
	}

	public String getTotal_cancel_sum() {
		return total_cancel_sum;
	}

	public void setTotal_cancel_sum(String total_cancel_sum) {
		this.total_cancel_sum = total_cancel_sum;
	}

	public String getTotal_approval_cnt() {
		return total_approval_cnt;
	}

	public void setTotal_approval_cnt(String total_approval_cnt) {
		this.total_approval_cnt = total_approval_cnt;
	}

	public String getTotal_cancel_cnt() {
		return total_cancel_cnt;
	}

	public void setTotal_cancel_cnt(String total_cancel_cnt) {
		this.total_cancel_cnt = total_cancel_cnt;
	}

	public String getTotal_settlement() {
		return total_settlement;
	}

	public void setTotal_settlement(String total_settlement) {
		this.total_settlement = total_settlement;
	}

	public String getTotal_settlement2() {
		return total_settlement2;
	}

	public void setTotal_settlement2(String total_settlement2) {
		this.total_settlement2 = total_settlement2;
	}

	public String getTotal_settlement3() {
		return total_settlement3;
	}

	public void setTotal_settlement3(String total_settlement3) {
		this.total_settlement3 = total_settlement3;
	}

	public String getTotal_vat() {
		return total_vat;
	}

	public void setTotal_vat(String total_vat) {
		this.total_vat = total_vat;
	}

	public String getTotal_vat2() {
		return total_vat2;
	}

	public void setTotal_vat2(String total_vat2) {
		this.total_vat2 = total_vat2;
	}

	public String getTotal_vat3() {
		return total_vat3;
	}

	public void setTotal_vat3(String total_vat3) {
		this.total_vat3 = total_vat3;
	}

	public String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}

	public String getTotal_amount2() {
		return total_amount2;
	}

	public void setTotal_amount2(String total_amount2) {
		this.total_amount2 = total_amount2;
	}

	public String getTotal_amount3() {
		return total_amount3;
	}

	public void setTotal_amount3(String total_amount3) {
		this.total_amount3 = total_amount3;
	}

	public String getD_amount() {
		return d_amount;
	}

	public void setD_amount(String d_amount) {
		this.d_amount = d_amount;
	}

	public String getD_cancel_sum() {
		return d_cancel_sum;
	}

	public void setD_cancel_sum(String d_cancel_sum) {
		this.d_cancel_sum = d_cancel_sum;
	}

	public int getD_total_cnt() {
		return d_total_cnt;
	}

	public void setD_total_cnt(int d_total_cnt) {
		this.d_total_cnt = d_total_cnt;
	}

	public String getD_approval_cnt() {
		return d_approval_cnt;
	}

	public void setD_approval_cnt(String d_approval_cnt) {
		this.d_approval_cnt = d_approval_cnt;
	}

	public String getD_cancel_cnt() {
		return d_cancel_cnt;
	}

	public void setD_cancel_cnt(String d_cancel_cnt) {
		this.d_cancel_cnt = d_cancel_cnt;
	}


	
	
}
