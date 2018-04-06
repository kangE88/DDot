package com.DDot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
