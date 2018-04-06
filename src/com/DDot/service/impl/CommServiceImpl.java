package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.CommDao;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.service.CommService;

@Service
public class CommServiceImpl implements CommService{
	
	@Autowired
	CommDao commDao;

	@Override
	public List<CommDto> getCommList(CommDto comm) throws Exception {
		return commDao.getCommList(comm);
	}

	@Override
	public boolean writeComm(CommDto comm) throws Exception {
		return commDao.writeComm(comm);
	}

	@Override
	public CommDto getComm(int seq) throws Exception {
		return commDao.getComm(seq);
	}

	@Override
	public boolean readCount(int seq) throws Exception {
		return commDao.readCount(seq);
	}

	@Override
	public List<CommDto> getCommPagingList(BbsParam param) throws Exception {
		return commDao.getCommPagingList(param);
	}

	@Override
	public int getCommCount(BbsParam param) throws Exception {
		return commDao.getCommCount(param);
	}

	@Override
	public boolean updateComm(CommDto comm) throws Exception {
		return commDao.updateComm(comm);
	}

	@Override
	public boolean deleteComm(int seq) {
		return commDao.deleteComm(seq);
	}

}
