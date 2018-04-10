package com.DDot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DDot.model.AttendDto;
import com.DDot.model.BbsDto;
import com.DDot.model.MemberDto;
import com.DDot.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="admin.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userlist(Model model) {
		
		List<MemberDto> list = adminService.userlist();
		model.addAttribute("userlist", list);
		
		return "admin.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="userwritecount.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int userwritecount(Model model, String nickname) {
		
		int count = adminService.userwritecount(nickname);
		model.addAttribute("count", nickname);
		return count;
	}
	
	
	@RequestMapping(value="userbbslist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userbbslist(String nickname, Model model) {
		
		List<BbsDto> userbbslist = adminService.userbbslist(nickname);
		model.addAttribute("userbbslist", userbbslist);
		
		return "adminuserbbslist.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="modifypoint.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifypoint(String nickname, String point) {
		
		AttendDto adto = new AttendDto();
		adto.setNickname(nickname);
		adto.setTable(point);
		
		adminService.modifypoint(adto);
		
		return "redirect: admin.do";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteuserbbs.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteuserbbs(String sseq) {
		
		int seq = Integer.parseInt(sseq);
		System.out.println("seq: "+seq);
		adminService.deleteuserbbs(seq);
		
		return "redirect: userbbslist.do";
	}
	
	
}
