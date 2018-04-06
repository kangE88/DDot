package com.DDot.service;

import javax.servlet.http.HttpServletRequest;

import com.DDot.model.AttendDto;
import com.DDot.model.PointDto;

public interface PointService {
	
	public PointDto attendpoint(String nickname);
	public void attendpointup(AttendDto adto);
}
