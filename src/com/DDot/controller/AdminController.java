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
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;
import com.DDot.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="admin.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userlist(Model model, MemberParam param) {
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		System.out.println("start: "+start);
		System.out.println("end: "+end);
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = adminService.getusercount(param);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		System.out.println("list 받기전");
		List<MemberDto> list = adminService.userlist();
		System.out.println("list 받은후");
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
	
	@ResponseBody
	@RequestMapping(value="usercommcount.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int usercommcount(Model model, String nickname) {
		
		int count = adminService.usercommcount(nickname);
		model.addAttribute("count", nickname);
		return count;
	}
	
	
	
	
	@RequestMapping(value="userbbslist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userbbslist(String nickname, Model model) {
		
		List<BbsDto> userbbslist = adminService.userbbslist(nickname);
		model.addAttribute("userbbslist", userbbslist);
		
		return "userbbslist.tiles";
	}
	
	@RequestMapping(value="usercommlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String usercommlist(String nickname, Model model) {
		
		List<CommDto> usercommlist = adminService.usercommlist(nickname);
		model.addAttribute("usercommlist", usercommlist);
		
		return "usercommlist.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteuserbbs.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteuserbbs(String sseq) {
		
		int seq = Integer.parseInt(sseq);
		System.out.println("seq: "+seq);
		adminService.deleteuserbbs(seq);
		
		return "redirect: userbbslist.do";
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
	
	
}
