package com.DDot.dao;

import java.util.List;

import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;

public interface CommDao {
	public List<CommDto> getCommList(CommDto comm) throws Exception;
	
	boolean writeComm(CommDto comm) throws Exception;
		
	public CommDto getComm(int seq) throws Exception;
	
	public boolean readCount(int seq) throws Exception;

	public List<CommDto> getCommPagingList(BbsParam param) throws Exception;
	public int getCommCount(BbsParam param) throws Exception;
	
	boolean updateComm(CommDto comm)throws Exception;
	
	public boolean deleteComm(int seq);
	
}
