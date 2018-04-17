package com.DDot.dao;

import java.util.List;
import java.util.Map;

import com.DDot.model.MessageDto;

public interface MessageDao {

	public List<MessageDto> getMessageList(MessageDto msgDto) throws Exception;
	
	boolean writeMessage(MessageDto msgDto) throws Exception;
		
	public MessageDto getMessage(int seq) throws Exception;
	
	public List<MessageDto> getMessagePagingList(Map<String, Object> data) throws Exception;
	
	public int getMessageCount(Map<String, Object> data) throws Exception;
	
	public boolean deleteMessage(String[] list);
	
	public boolean increaseRead(Map<String, Object> data);
	
	public int checkMessage(String nickname);
}
