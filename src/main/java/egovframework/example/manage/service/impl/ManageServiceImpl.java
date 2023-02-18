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
package egovframework.example.manage.service.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.manage.service.ManageDefaultVO;
import egovframework.example.manage.service.ManageService;
import egovframework.example.manage.service.ManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("manageService")
public class ManageServiceImpl extends EgovAbstractServiceImpl implements ManageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ManageServiceImpl.class);

	/** SampleDAO */
	// TODO mybatis 사용
	@Resource(name="manageMapper")
	private ManageMapper manageDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<ManageVO> selectManageList(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageList(searchManageVO);
	}
	@Override
	public int selectManageListToCnt(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageListToCnt(searchManageVO);
	}
	@Override
	public List<ManageVO> selectManageListExcel(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageListExcel(searchManageVO);
	}
	
	@Override
	public List<ManageVO> selectManageList2(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageList2(searchManageVO);
	}
	@Override
	public int selectManageListToCnt2(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageListToCnt2(searchManageVO);
	}
	@Override
	public List<ManageVO> selectManageList2Excel(ManageDefaultVO searchManageVO) throws IOException, SQLException {
		return manageDAO.selectManageList2Excel(searchManageVO);
	}
	
	@Override
	public ManageVO selectManageInfo(ManageVO vo) throws IOException, SQLException {
		return manageDAO.selectManageInfo(vo);
	}
	
	@Override
	public void manageAdd(ManageVO vo) throws IOException, SQLException {
		manageDAO.manageAdd(vo);
		manageDAO.manageRoleAdd(vo);
	}

	@Override
	public void manageMod(ManageVO vo) throws IOException, SQLException {
		manageDAO.manageMod(vo);
	}

	@Override
	public int manageDel(ManageVO vo) throws IOException, SQLException {
		int i = 0;
		i = manageDAO.managePhoneDel(vo);
		i = manageDAO.manageEmailDel(vo);
		i = manageDAO.manageInquiryeDel(vo);
		i = manageDAO.manageRoleDel(vo);
		i = manageDAO.manageDel(vo);
		return i;
	}
	
}
