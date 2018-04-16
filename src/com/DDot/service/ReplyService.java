package com.DDot.service;

import java.util.List;

import com.DDot.model.ReplyDto;

public interface ReplyService {

	boolean writeReplyBbs(ReplyDto reply) throws Exception;
	boolean writeReplyComm(ReplyDto reply) throws Exception;
	
	public List<ReplyDto> getReplyBbsList(int seq) throws Exception;
	public List<ReplyDto> getReplyCommList(int seq) throws Exception;
	
	public boolean updateReply(ReplyDto reply) throws Exception;
	
	public boolean deleteReply(int seq);
	
	public int getReplyBbsCount(int seq) throws Exception;
	public int getReplyCommCount(int seq) throws Exception;
	
}
