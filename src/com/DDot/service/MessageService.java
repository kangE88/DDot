package com.DDot.service;

import java.util.List;

import com.DDot.model.MessageDto;
import com.DDot.model.MessagePagingDto;

public interface MessageService {
	
	public List<MessageDto> getMessageList(MessageDto msgDto) throws Exception;
	
	boolean writeMessage(MessageDto msgDto) throws Exception;
		
	public MessageDto getMessage(int seq) throws Exception;
	
	public List<MessageDto> getMessagePagingList(MessagePagingDto msgPagingDto) throws Exception;
	
	public int getMessageCount(MessagePagingDto msgPagingDto) throws Exception;
	
	public boolean deleteMessage(int seq);
}
