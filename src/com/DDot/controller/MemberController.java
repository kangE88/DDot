package com.DDot.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.DDot.model.MemberDto;
import com.DDot.model.YesMember;
import com.DDot.service.MemberService;
import com.DDot.util.FUpUtil;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService MemberService;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(Model model) {
		
		logger.info("MemberController login");
		return "login.tiles";
	}

	@RequestMapping(value="regi.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model) {
		logger.info("MemberController regi");
		
		return "regi.tiles";
	}

	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(HttpServletRequest req) {
		return "main.tiles";
	}

/*	@RequestMapping(value="kakaoLogin.do", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest req, HttpServletResponse reps) {
		logger.info("MemberController kakaoLogin");
		
		System.out.println("code==>"+code);
		
		return "main.do";
	}*/
	
	@RequestMapping(value="labatory.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String labatory() {
		
		return "labatory.tiles";
	}
	
	@RequestMapping(value="donate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String donate() {
		
		return "donate.tiles";
	}
/*	
	@RequestMapping(value="attendance.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String attendance() {
		
		return "attendance.tiles";
	}
	*/
	@ResponseBody
	@RequestMapping(value="getID.do", method=RequestMethod.POST)
	public YesMember getID(Model model, MemberDto mem) {
		logger.info("KhMemberController getID");
		
		int count = 0;
		
		try {
			count = MemberService.getID(mem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		YesMember yes = new YesMember();
		
		if(count > 0) {
			yes.setMessage("SUCS");
		}else {
			yes.setMessage("FAIL");
		}
		
		return yes;
		
	}
	
	@ResponseBody
	@RequestMapping(value="getNickname.do", method=RequestMethod.POST)
	public YesMember getNickname(Model model, MemberDto mem) {
		logger.info("KhMemberController getNickname");
		
		int count = 0;
		
		try {
			count = MemberService.getNickname(mem);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		YesMember yes = new YesMember();
		
		if(count > 0) {
			yes.setMessage("SUCS");
		}else {
			yes.setMessage("FAIL");
		}
		
		return yes;
		
	}
	
	@RequestMapping(value="regiAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String regiAf(MemberDto mem, HttpServletRequest req,
			@RequestParam(value="picFile", required=false) MultipartFile picFile, Model model)throws Exception{
		
		mem.setPic(picFile.getOriginalFilename());
				
		//파일 경로(서버)
		//String fupload = req.getServletContext().getRealPath("/upload");
		
		//파일경로(폴더)
		String fupload = "c:\\upload\\"+mem.getId();
		System.out.println("fupload:"+fupload);
		
		
		String f = mem.getPic();
		System.out.println("f==>"+f);
		
		String newFile= FUpUtil.getNewFile(f);
		System.out.println("newFile==>"+newFile);
		
		System.out.println("result==>"+fupload + "/" + newFile);
		
		mem.setPic(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, picFile.getBytes());
			
			// db insert 부분
			MemberService.addmember(mem);
			MemberService.addAttend(mem.getNickname());
			
			logger.info("upload success!!!");
			
		}catch (IOException e) {
			logger.info("upload fail!!!");
		}
		
		
		//MemberService.addmember(mem);
		
		return "login.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="userInfoModify.do", method= {RequestMethod.GET, RequestMethod.POST})
	public boolean userInfoModify(MemberDto mem, HttpServletRequest req,
			@RequestParam(value="picFile", required=false) MultipartFile picFile, Model model)throws Exception{
		logger.info("DDotMemberController userInfoModify");	

		mem.setPic(picFile.getOriginalFilename());

		//파일경로(폴더)
		String fupload = "c:\\upload\\"+mem.getId();
		System.out.println("fupload:"+fupload);
		
		
		String f = mem.getPic();
		
		String newFile= FUpUtil.getNewFile(f);
		
		System.out.println(fupload + "/" + newFile);
		
		mem.setPic(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, picFile.getBytes());
			
			System.out.println(MemberService.userInfoModify(mem));
			
		}catch (IOException e) {
			System.out.println("fail");
		}
		
		req.getSession().setAttribute("login", mem);
		
		// db insert 부분
		return MemberService.userInfoModify(mem);
	}
	
	
	@ResponseBody
	@RequestMapping(value="userInfoModifyNoImage.do", method= {RequestMethod.GET, RequestMethod.POST})
	public boolean userInfoModifyNoImage(MemberDto mem, HttpServletRequest req, Model model)throws Exception{
		logger.info("DDotMemberController userInfoModifyNoImage");	

		MemberDto before_mem = (MemberDto)req.getSession().getAttribute("login");
		
		mem.setPic(before_mem.getPic());
		mem.setPoint(before_mem.getPoint());		
		
		req.getSession().setAttribute("login", mem);
		
		System.out.println(" modi noImage mem===>"+mem.toString());
		
		// db insert 부분
		return MemberService.userInfoModifyNoImage(mem);
	}
	
	//

	@RequestMapping(value="loginAf.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, MemberDto mem, Model model) throws Exception {
		logger.info("MemberController loginAf");
		
		MemberDto login = MemberService.login(mem);
		
		if(login != null && !login.getId().equals("")) {
			System.out.println("loginAf in");
			req.getSession().setAttribute("login", login);
			req.getSession().setAttribute("chatstatus", 0);
			return "redirect:/main.do";
		}else {
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value="userInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userInfo() throws Exception {
		
		return "userInfo.tiles";
	}
	
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		
		return "redirect:/index.jsp";
	}
}













