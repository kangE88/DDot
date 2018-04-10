package com.DDot.service;

import java.util.List;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.MemberDto;

public interface AdminService {

	public List<MemberDto> userlist();
	
	public int userwritecount(String nickname);
	
	public List<BbsDto> userbbslist(String nickname);
	
	public void modifypoint(AttendDto adto);
	
	public void deleteuserbbs(int seq);
}
