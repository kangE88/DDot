package com.DDot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.AdminDao;
import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;
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

	@Override
	public List<BbsDto> userbbslist(String nickname) {
		
		return admindao.userbbslist(nickname);
	}

	@Override
	public void modifypoint(AttendDto adto) {
		admindao.modifypoint(adto);
		
	}

	@Override
	public void deleteuserbbs(int seq) {
		admindao.deleteuserbbs(seq);		
	}

	@Override
	public int usercommcount(String nickname) {
		return admindao.usercommcount(nickname);
	}

	@Override
	public List<CommDto> usercommlist(String nickname) {
		return admindao.usercommlist(nickname);
	}

	@Override
	public int getusercount(MemberParam param) {
		return admindao.getusercount(param);
	}

}
