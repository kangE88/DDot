package com.DDot.dao;

import java.util.List;

import com.DDot.model.MemberDto;

public interface AdminDao {

	public List<MemberDto> userlist();
	
	public int userwritecount(String nickname);
}
