package com.DDot.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.DDot.service.MessageService;
import com.DDot.singleton.ConnectingUserList;
import com.DDot.util.CheckConnectUser;
import com.DDot.util.FUpUtil;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService MemberService;
	@Autowired
	MessageService msgService;
	
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

	@RequestMapping(value="labatory.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String labatory() {
		
		return "labatory.tiles";
	}
	
	@RequestMapping(value="donate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String donate() {
		
		return "donate.tiles";
	}

	@ResponseBody
	@RequestMapping(value="getID.do", method=RequestMethod.POST)
	public YesMember getID(Model model, MemberDto mem) {
		logger.info("KhMemberController getID");
		
		int count = 0;
		
		try {
			count = MemberService.getID(mem);
		} catch (Exception e) {
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
	@RequestMapping(value="findID.do",  method= {RequestMethod.GET, RequestMethod.POST})
	public String findID(Model model, String email) throws Exception {
		logger.info("MemberController findID");
		
		String id = MemberService.findID(email);
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value="findPWD.do",  method= {RequestMethod.GET, RequestMethod.POST})
	public String findPWD(Model model, MemberDto mem) throws Exception {
		logger.info("MemberController findPWD");
		
		String pwd = MemberService.findPWD(mem);
		
		System.out.println(pwd);
		
		return pwd;
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
		
		String newFile= FUpUtil.getNewFile(f);		
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

		return "login.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="userInfoModify.do", method= {RequestMethod.GET, RequestMethod.POST})
	public boolean userInfoModify(MemberDto mem, HttpServletRequest req,
			@RequestParam(value="picFile", required=false) MultipartFile picFile, Model model)throws Exception{
		logger.info("DDotMemberController userInfoModify");	

		MemberDto before_mem = (MemberDto)req.getSession().getAttribute("login");
		
		mem.setSeq(before_mem.getSeq());
		mem.setPoint(before_mem.getPoint());
		mem.setNickname(before_mem.getNickname());
		mem.setAuth(before_mem.getAuth());
		
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
		
		mem.setSeq(before_mem.getSeq());
		mem.setPoint(before_mem.getPoint());
		mem.setNickname(before_mem.getNickname());
		mem.setPic(before_mem.getPic());
		mem.setAuth(before_mem.getAuth());
			
		req.getSession().setAttribute("login", mem);
		
		// db insert 부분
		return MemberService.userInfoModifyNoImage(mem);
	}
	
	@ResponseBody
	@RequestMapping(value="loginAf.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public boolean loginAf(HttpServletRequest req, MemberDto mem, Model model) throws Exception {
		logger.info("MemberController loginAf");
		
		MemberDto login = MemberService.login(mem);
		
		if(login != null && !login.getId().equals("")) {
			req.getSession().setAttribute("login", login);
			req.getSession().setAttribute("chatstatus", 0);
			int count = msgService.checkMessage(login.getNickname());
			req.getSession().setAttribute("messagecount", count);

			req.getSession().setAttribute(login.getNickname(), new CheckConnectUser());

			return true;
		}else {
			return false;
		}		
	}
	
	@RequestMapping(value="userInfo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userInfo(HttpServletRequest req) throws Exception {
		
		MemberDto mdto = (MemberDto)req.getSession().getAttribute("login");
		
		MemberDto login = MemberService.login(mdto);
		
		req.getSession().setAttribute("login", login);
		
		return "userInfo.tiles";
	}
	
	@RequestMapping(value="userFind.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String findid(HttpServletRequest req) throws Exception {
		
		return "userFind.tiles";
	}

	@RequestMapping(value="userInfo_bbs.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userInfo_bbs(Model model, String nickname) throws Exception {
		
		MemberDto mem = MemberService.getMember(nickname);
		model.addAttribute("mem", mem);
		
		return "userInfo_bbs.tiles";
	}
	
	@RequestMapping(value="logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	/*user point 를 가져오는 부분*/
	@ResponseBody
	@RequestMapping(value="getMemberPoint.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Integer> getMemberPoint(Model model, String nickname)  throws Exception {
		logger.info("KhMemberController getMemberPoint");
		
		Map<String, Integer> getMemberPointMap = new HashMap<String, Integer>();
		getMemberPointMap.put("point", MemberService.getMemberPoint(nickname));

		return getMemberPointMap;
	}
	
	@ResponseBody
	@RequestMapping(value="getConnectUserList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<String> getConnectUserList(Model model)  throws Exception {
		logger.info("KhMemberController getConnectUserList");
		
		for (String str : ConnectingUserList.getInstance().getUserList()) {
			System.out.println(str);
		}
		

		return ConnectingUserList.getInstance().getUserList();
	}
	
}


