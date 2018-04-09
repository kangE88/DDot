package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.MessageDao;
import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;
import com.DDot.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDao msgDao;

	@Override
	public List<MessageDto> getMessageList(MessageDto msgDto) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessageList(msgDto);
	}

	@Override
	public boolean writeMessage(MessageDto msgDto) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.writeMessage(msgDto);
	}

	@Override
	public MessageDto getMessage(int seq) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessage(seq);
	}

	@Override
	public List<MessageDto> getMessagePagingList(MessagePagingDto msgPagingDto) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessagePagingList(msgPagingDto);
	}

	@Override
	public int getMessageCount(MessagePagingDto msgPagingDto) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessageCount(msgPagingDto);
	}

	@Override
	public boolean deleteMessage(int seq) {
		// TODO Auto-generated method stub
		return msgDao.deleteMessage(seq);
	}

}
