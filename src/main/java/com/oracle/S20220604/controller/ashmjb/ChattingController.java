package com.oracle.S20220604.controller.ashmjb;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.service.ashmjb.ChattingService;


@RestController
public class ChattingController {
	private static final Logger logger =LoggerFactory.getLogger(ChattingController.class);
	
	private final ChattingService cs;
	@Autowired
	public ChattingController(ChattingService cs) {
		this.cs = cs;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		System.out.println("ChattingController chat start");
		String user_id = "namwoo";
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("/chatAshmjb/chatRoomMain");
		return mv;
	}
	@RequestMapping("/test")
	public ModelAndView test() {
		System.out.println("ChattingController chat start");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/chatAshmjb/text");
		return mv;
	}
	
	@RequestMapping(value="profileCreate")
	public String profileCreate() {
		
		return "/chatAshmjb/profileCreate";
	}
	
	@RequestMapping(value="openChatCreate")
	public ModelAndView openChatCreate() {
		System.out.println("ChattingController chat start");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/chatAshmjb/openChatCreate");
		return mv;
		
	}

	@PostMapping("createOpenChat")
	public ModelAndView createOpenChat(Chatting chatting, HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("ChattingController createOpenChat Start... ");
		ModelAndView mv = new ModelAndView();
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		
		System.out.println("createOpenChat upload POST Start");
		
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
		
		cs.insert(chatting);
		
//		mv.addObject("savedName", savedName);
		mv.setViewName("redirect:chat");
		return mv;
	}
	public String uploadFile(String originalFilename, byte[] fileData, String uploadPath) throws Exception {

		UUID uid = UUID.randomUUID();
		// requestPath = requestPath + "/resources/image";
		System.out.println("uploadPath -> "+ uploadPath);
		// directory 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdir();
			System.out.println("업로드용 폴더 생상함 : "+ uploadPath);
		}
		String savedName = uid.toString()+"_"+originalFilename;
		logger.info("savedName -> " + savedName);
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
//		 Service ---> Dao 연결
		// 아직 우리 채팅방정보에 사진을 저장하는곳이 없어서 디비 연결안함. 근데 하면 뭘 pk로 잡고 조건걸어서
		// 담아서 보내야하지?
		
		return savedName;
	}
	
	
}
