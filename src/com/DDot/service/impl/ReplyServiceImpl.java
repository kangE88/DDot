package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.ReplyDao;
import com.DDot.model.ReplyDto;
import com.DDot.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDao replyDao;

	@Override
	public boolean writeReplyBbs(ReplyDto reply) throws Exception {
		return replyDao.writeReplyBbs(reply);
	}

	@Override
	public boolean writeReplyComm(ReplyDto reply) throws Exception {
		return replyDao.writeReplyComm(reply);
	}

	@Override
	public List<ReplyDto> getReplyBbsList(int seq) throws Exception {
		return replyDao.getReplyBbsList(seq);
	}

	@Override
	public List<ReplyDto> getReplyCommList(int seq) throws Exception {
		return replyDao.getReplyCommList(seq);
	}

	@Override
	public boolean updateReply(ReplyDto reply) throws Exception {
		return replyDao.updateReply(reply);
	}

	@Override
	public boolean deleteReply(int seq) {
		return replyDao.deleteReply(seq);
	}

	@Override
	public int getReplyBbsCount(int seq) throws Exception {
		return replyDao.getReplyBbsCount(seq);
	}

	@Override
	public int getReplyCommCount(int seq) throws Exception {
		return replyDao.getReplyCommCount(seq);
	}

}
