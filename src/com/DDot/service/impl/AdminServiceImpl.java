package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.AdminDao;
import com.DDot.model.MemberDto;
import com.DDot.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao admindao;
	
	@Override
	public List<MemberDto> userlist() {
		// TODO Auto-generated method stub
		return admindao.userlist();
	}

	@Override
	public int userwritecount(String nickname) {
		
		return admindao.userwritecount(nickname);
	}

}
