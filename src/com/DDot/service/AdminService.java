package com.DDot.service;

import java.util.List;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;

public interface AdminService {

	public List<MemberDto> userlist(MemberParam param, String sort);
	
	public int getusercount(MemberParam param);
	
	public int userwritecount(String nickname);
	
	public List<BbsDto> userbbslist(BbsParam param,  String sort);
	
	public void modifypoint(AttendDto adto);
	
	public void deleteuserbbs(int seq);
	
	public int usercommcount(String nickname);
	
	public List<CommDto> usercommlist(BbsParam param, String sort);
	
	public int userbbscount(String nickname);
}
