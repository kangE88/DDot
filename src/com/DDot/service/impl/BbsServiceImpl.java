package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.BbsDao;
import com.DDot.model.BbsDto;
import com.DDot.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {

	@Autowired
	BbsDao bbsDao;
	
	@Override
	public List<BbsDto> getBbsList(BbsDto bbs) throws Exception {
		return bbsDao.getBbsList(bbs);
	}

	@Override
	public boolean writeBbs(BbsDto bbs) throws Exception {
		return bbsDao.writeBbs(bbs);
	}

	@Override
	public BbsDto getBbs(int seq) throws Exception {
		return bbsDao.getBbs(seq);
	}

	@Override
	public boolean updateBbs(BbsDto bbs) throws Exception {
		return bbsDao.updateBbs(bbs);
	}

	@Override
	public List<BbsDto> getBbsList_Subcategory(BbsDto bbs) throws Exception {
		return bbsDao.getBbsList_Subcategory(bbs);
	}

	@Override
	public boolean readCount(int seq) throws Exception {
		return bbsDao.readCount(seq);
	}

}
