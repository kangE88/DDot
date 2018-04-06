package com.DDot.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DDot.model.AttendDto;
import com.DDot.model.MemberDto;
import com.DDot.model.PointDto;
import com.DDot.service.PointService;

@Controller
public class PointController {

	@Autowired
	PointService pointService;
	
	@RequestMapping(value="attendance.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String attendance(Model model,HttpServletRequest req) {
		
		MemberDto mdto = (MemberDto)req.getSession().getAttribute("login");
		String nickname = mdto.getNickname();
		System.out.println("nickname: " + nickname);
		PointDto pdto = pointService.attendpoint(nickname);
		model.addAttribute("pdto", pdto);
		return "attendance.tiles";
	}
	
	@RequestMapping(value="attendanceAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String attendanceAf(Model model,HttpServletRequest req) {
		
		MemberDto mdto = (MemberDto)req.getSession().getAttribute("login");
		
		String nickname = mdto.getNickname();
		
		String day = String.valueOf(new Date().getDate());
		if(day.length()<2) {
			day = "0"+day;
		}
		day = "day"+day;
		
		System.out.println("day: " + day);
		
		AttendDto adto = new AttendDto();
		adto.setNickname(nickname);
		adto.setTable(day);
		
		pointService.attendpointup(adto);
		
		return "redirect: attendance.do";
	}
}
