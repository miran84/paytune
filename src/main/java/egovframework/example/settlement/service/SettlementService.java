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

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface SettlementService {

	List<SettlementVO> selectCalendarList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	SettlementVO storeidSearch(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
//	SettlementVO selectCalendarData(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementAllList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementAllListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementAllListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementAllInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	void settlementAllHoldAdd(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	void settlementAllHoldDel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementHisList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementHisListCnt(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	SettlementVO selectSettlementHisInfo(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementHisListExcel(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	
	List<SettlementVO> selectSettlementManageList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
	List<SettlementVO> selectSettlementManageDetailList(SettlementDefaultVO searchSettlementVO) throws IOException, SQLException;
}
