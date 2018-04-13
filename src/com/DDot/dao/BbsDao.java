package com.DDot.dao;

import java.util.List;

import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;

public interface BbsDao {
	public List<BbsDto> getBbsList(BbsDto bbs) throws Exception;
	
	public List<BbsDto> getBbsList_Subcategory(BbsDto bbs) throws Exception;
	
	boolean writeBbs(BbsDto bbs) throws Exception;
		
	BbsDto getBbs(int seq) throws Exception;
	
	public boolean readCount(int seq) throws Exception;

	public List<BbsDto> getBbsPagingList(BbsParam param) throws Exception;
	public int getBbsCount(BbsParam param) throws Exception;
	
	public List<BbsDto> getBbsPagingList_Subcategory(BbsParam param) throws Exception;
	public int getBbsCount_Subcategory(BbsParam param) throws Exception;

	boolean updateBbs(BbsDto bbs)throws Exception;
	
	public boolean deleteBbs(int seq);
	
	public int getusericon(int seq);
	
	
}
