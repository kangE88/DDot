package com.DDot.service;

import javax.servlet.http.HttpServletRequest;

import com.DDot.model.AttendDto;
import com.DDot.model.PointDto;

public interface PointService {
	
	public PointDto attendpoint(String nickname);
	public void attendpointup(AttendDto adto);
	public void abcup(String nickname);	
	public void abcdown(String nickname);
	public void updownup(String nickname);	
	public void updowndown(String nickname);
}
