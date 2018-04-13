package com.DDot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DDot.dao.MessageDao;
import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;

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
	public List<MessageDto> getMessagePagingList(MessagePagingDto msgPagingDto) throws Exception {
		List<MessageDto> list = new ArrayList<MessageDto>();
		list = sqlSession.selectList(namespace+"getMessagePagingList", msgPagingDto);
		return list;
	}

	@Override
	public int getMessageCount(MessagePagingDto msgPagingDto) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace+"getMessageCount", msgPagingDto);
		return num;
	}

	@Override
	public boolean deleteMessage(int seq) {
		int count = sqlSession.update(namespace+"deleteMessage", seq);
		return count>0?true:false;
	}

	@Override
	public boolean increaseRead(int seq) {
		int count = sqlSession.update(namespace+"increaseRead", seq);
		return count>0?true:false;
	}

}
