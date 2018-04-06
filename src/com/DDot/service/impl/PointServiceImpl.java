package com.DDot.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DDot.dao.PointDao;
import com.DDot.model.AttendDto;
import com.DDot.model.MemberDto;
import com.DDot.model.PointDto;
import com.DDot.service.PointService;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	PointDao pointDao;
	
	@Override
	public PointDto attendpoint(String nickname) {
		return pointDao.attendpoint(nickname);
	}

	@Override
	public void attendpointup(AttendDto adto) {
		
		pointDao.attendpointup(adto);		
	}

}
