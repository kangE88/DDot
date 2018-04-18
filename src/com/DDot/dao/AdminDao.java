package com.DDot.dao;

import java.util.List;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;

public interface AdminDao {

	public List<MemberDto> userlist(MemberParam param);
	
	public int userwritecount(String nickname);
	
	public List<BbsDto> userbbslist(BbsParam param);
	
	public int userbbscount(String nickname);
	
	public void modifypoint(AttendDto adto);
	
	public void deleteuserbbs(int seq);
	
	public int usercommcount(String nickname);
	
	public List<CommDto> usercommlist(BbsParam param);
	
	public int getusercount(MemberParam param);
}
