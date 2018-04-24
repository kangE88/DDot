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
import com.DDot.model.BbsParam;
import com.DDot.model.CommDto;
import com.DDot.model.MemberDto;
import com.DDot.model.MemberParam;
import com.DDot.service.AdminService;
import com.DDot.singleton.ConnectingUserList;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="admin.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userlist(Model model, MemberParam param, String sort) {
		
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();		
		
		System.out.println("start: "+start);
		System.out.println("end: "+end);
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = adminService.getusercount(param);
		model.addAttribute("sort", sort);
		
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		if(sort==null) {
			sort="all";
		}
		List<MemberDto> list = null;
		switch(sort) {
		case "all":
			list = adminService.userlist(param, sort);
			break;
		case "Good":
			list = adminService.userlist(param, sort);
		break;		
		case "Bad":
			list = adminService.userlist(param, sort);
		break;
		}
		
		
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
	public String userbbslist(BbsParam param, Model model, String nickname, String sort) {
		
		param.setNickname(nickname);
		model.addAttribute("nickname", nickname);
		
		int sn = param.getPageNumber();		
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		System.out.println("start: "+start);
		System.out.println("end: "+end);
		System.out.println("userbbslistsort: " + sort);
		
		param.setStart(start);
		param.setEnd(end);		
		
		int totalRecordCount = adminService.userbbscount(nickname);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		
		model.addAttribute("sort", sort);
		if(sort==null) {
			sort="all";
		}
		List<BbsDto> userbbslist = null;
		switch(sort) {
		case "all":
			userbbslist = adminService.userbbslist(param, sort);
			break;
		case "Good":
			userbbslist = adminService.userbbslist(param, sort);
		break;
		
		case "Bad":
			userbbslist = adminService.userbbslist(param, sort);
		break;
		}
		
		model.addAttribute("userbbslist", userbbslist);
		
		return "userbbslist.tiles";
	}
	
	@RequestMapping(value="usercommlist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String usercommlist(BbsParam param, String nickname, Model model, String sort) {
		
		param.setNickname(nickname);
		model.addAttribute("nickname", nickname);
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		System.out.println("start: "+start);
		System.out.println("end: "+end);
		
		param.setStart(start);
		param.setEnd(end);		
		
		int totalRecordCount = adminService.usercommcount(nickname);
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sort", sort);
		if(sort==null) {
			sort="all";
		}
		List<CommDto> usercommlist = null;
		switch(sort) {
		case "all":
			usercommlist = adminService.usercommlist(param, sort);
			break;
		case "Good":
			usercommlist = adminService.usercommlist(param, sort);
		break;
		
		case "Bad":
			usercommlist = adminService.usercommlist(param, sort);
		break;
		}
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
	
	@ResponseBody
	@RequestMapping(value="useronoff.do", method= {RequestMethod.GET, RequestMethod.POST})
	public boolean useronoff(String nickname) {
	
	boolean b = false;
	
	b = ConnectingUserList.getInstance().getUserList().contains(nickname);
	
	return b;
	}
}
