package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.MessageDao;
import com.DDot.model.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	SqlSession sqlSession;

	private String namespace = "DDotMessage.";

	@Override
	public List<MessageDto> getMessageList(MessageDto msgDto) throws Exception {
		List<MessageDto> list = new ArrayList<MessageDto>();		
		list = sqlSession.selectList(namespace + "getMessageList", msgDto);
		return list;

	}

	@Override
	public boolean writeMessage(MessageDto msgDto) throws Exception {
		int count = sqlSession.insert(namespace+"writeMessage", msgDto);
		return count>0?true:false;
	}

	@Override
	public MessageDto getMessage(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getMessage", seq);
	}

	@Override
	public List<MessageDto> getMessagePagingList(Map<String, Object> data) throws Exception {
		List<MessageDto> list = new ArrayList<MessageDto>();
		list = sqlSession.selectList(namespace+"getMessagePagingList", data);
		return list;
	}

	@Override
	public int getMessageCount(Map<String, Object> data) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getMessageCount", data);
		return num;
	}

	@Override
	public boolean deleteMessage(String[] list) {
		int count = sqlSession.update(namespace+"deleteMessage", list);
		return count>0?true:false;
	}

	@Override
	public boolean increaseRead(Map<String, Object> data) {
		int count = sqlSession.update(namespace+"increaseRead", data);
		return count>0?true:false;
	}

	@Override
	public int checkMessage(String nickname) {
		int count = sqlSession.selectOne(namespace+"checkMessage", nickname);
		return count;
	}

}
