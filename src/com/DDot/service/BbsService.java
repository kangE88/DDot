package com.DDot.service;

import java.util.List;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.BbsParam1;
import com.DDot.model.CommDto;

public interface BbsService {
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
	public int getusericonc(int seq);
	
	public int boardsearchcount(AttendDto adto);
	public int commsearchcount(AttendDto adto);
	public List<BbsDto> boardlist(BbsParam param);
	public List<CommDto> commlist(BbsParam1 param1);
	
}
