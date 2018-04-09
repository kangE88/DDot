package com.DDot.service;

import java.util.List;

import com.DDot.model.MemberDto;

public interface AdminService {

	public List<MemberDto> userlist();
	
	public int userwritecount(String nickname);
}
