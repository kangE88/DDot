package com.DDot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.MessageDao;
import com.DDot.model.MessageDto;
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
	public List<MessageDto> getMessagePagingList(Map<String, Object> data) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessagePagingList(data);
	}

	@Override
	public int getMessageCount(Map<String, Object> data) throws Exception {
		// TODO Auto-generated method stub
		return msgDao.getMessageCount(data);
	}


	@Override
	public boolean increaseRead(Map<String, Object> data) {
		return msgDao.increaseRead(data);
	}

	@Override
	public boolean deleteMessage(String[] list) {
		return msgDao.deleteMessage(list);
	}

	@Override
	public int checkMessage(String nickname) {
		return msgDao.checkMessage(nickname);
	}

}
