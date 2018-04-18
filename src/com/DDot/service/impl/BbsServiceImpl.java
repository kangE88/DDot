package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.BbsDao;
import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.BbsParam1;
import com.DDot.model.CommDto;
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

	@Override
	public List<BbsDto> getBbsPagingList(BbsParam param) throws Exception {
		return bbsDao.getBbsPagingList(param);
	}

	@Override
	public int getBbsCount(BbsParam param) throws Exception {
		return bbsDao.getBbsCount(param);
	}

	@Override
	public List<BbsDto> getBbsPagingList_Subcategory(BbsParam param) throws Exception {
		return bbsDao.getBbsPagingList_Subcategory(param);
	}

	@Override
	public int getBbsCount_Subcategory(BbsParam param) throws Exception {
		return bbsDao.getBbsCount_Subcategory(param);
	}

	@Override
	public boolean deleteBbs(int seq) {
		return bbsDao.deleteBbs(seq);
		
	}

	@Override
	public int getusericon(int seq) {
		return bbsDao.getusericon(seq);
	}

	@Override
	public int getusericonc(int seq) {	
		return bbsDao.getusericonc(seq);
	}

	@Override
	public int boardsearchcount(AttendDto adto) {
		return bbsDao.boardsearchcount(adto);
	}

	@Override
	public int commsearchcount(AttendDto adto) {
		return bbsDao.commsearchcount(adto);
	}

	@Override
	public List<BbsDto> boardlist(BbsParam param) {
		return bbsDao.boardlist(param);
	}

	@Override
	public List<CommDto> commlist(BbsParam1 param1) {
		return bbsDao.commlist(param1);
	}

}
