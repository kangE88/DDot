package com.DDot.service;

import java.util.List;

import com.DDot.model.BbsDto;

public interface BbsService {
	public List<BbsDto> getBbsList(BbsDto bbs) throws Exception;
	
	public List<BbsDto> getBbsList_Subcategory(BbsDto bbs) throws Exception;
	
	boolean writeBbs(BbsDto bbs) throws Exception;
		
	BbsDto getBbs(int seq) throws Exception;
	
	public boolean readCount(int seq) throws Exception;
/*
	public List<BbsDto> getBbsPagingList(BbsParam param) throws Exception;
	public int getBbsCount(BbsParam param) throws Exception;
*/
	boolean updateBbs(BbsDto bbs)throws Exception;
	
}
