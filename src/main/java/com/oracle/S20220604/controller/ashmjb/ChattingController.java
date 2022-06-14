package com.oracle.S20220604.controller.ashmjb;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;
import com.oracle.S20220604.service.ashmjb.ChattingService;
import com.oracle.S20220604.service.ashmjb.Paging;

import lombok.Getter;
import lombok.Setter;


@RestController
public class ChattingController {
	private static final Logger logger =LoggerFactory.getLogger(ChattingController.class);
	
	private final ChattingService cs;
	@Autowired
	public ChattingController(ChattingService cs) {
		this.cs = cs;
	}
	
	@RequestMapping("/chat") // room_type : 1 or 2
	public ModelAndView chat(HttpServletRequest request, HttpSession session) {
		System.out.println("ChattingController chat start");
		String session_id = (String) request.getSession().getAttribute("session_id");
		System.out.println("session_id : "+session_id);
		if(session_id == null) {
			System.out.println("==null");
			session.setAttribute("session_id", "namwoo");
		}
		
		else if(request.getSession().getAttribute("session_id") != null){
			System.out.println("!=null");
		}
		System.out.println("-------------session.getAttriuser_id----------"+session.getAttribute("user_id"));
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", session.getAttribute("session_id").toString());
		Chatting chatting = new Chatting();
		chatting.setRoom_type(1);
		chatting.setRoom_type2(2);
		chatting.setUser_id(session.getAttribute("session_id").toString());
		List<Chatting> showList =  cs.showList(chatting);
//		List<Chatting> showList = cs.showList(user_id_test);
		System.out.println("chattingcontroller chat showList.size()-> "+ showList.size());
		mv.addObject("showList", showList);
		mv.setViewName("/chatAshmjb/chatRoomMain");
		return mv;
	}
	
	@RequestMapping("/chat1") // room_type : 3
	public ModelAndView chat1(HttpServletRequest request, HttpSession session) {
		System.out.println("ChattingController chat start");
		
		if(request.getSession().getAttribute("session_id") == null) {
			System.out.println("user_id getSession ==null");
			session.setAttribute("session_id", "namwoo");
		}
		
		else if(request.getSession().getAttribute("session_id") != null){
			System.out.println("user_id getSession !=null");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", session.getAttribute("session_id").toString());
		Chatting chatting = new Chatting();
		chatting.setRoom_type(3);
		chatting.setRoom_type2(0);
		System.out.println("user_id"+ session.getAttribute("session_id").toString());
		List<Chatting> showList =  cs.showList(chatting);
		if(showList != null) {
			System.out.println("chattingcontroller chat showList.size()-> "+ showList.size());
		}
		mv.addObject("showList", showList);
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
	public ModelAndView profileCreate() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/chatAshmjb/profileCreate");
		return mv;
	}
	
	@RequestMapping(value="openChatCreate")
	public ModelAndView openChatCreate() {
		System.out.println("ChattingController chat start");
		ModelAndView mv = new ModelAndView();
		mv.addObject("defaultChatImg", "/img/defaultChatImg.png");
		mv.setViewName("/chatAshmjb/openChatCreate");
		return mv;
		
	}

	@PostMapping("createOpenChat")
	public ModelAndView createOpenChat(Chatting chatting, HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("ChattingController createOpenChat Start... ");
		ModelAndView mv = new ModelAndView();
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
//		logger.info(file.getOriginalFilename());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getBytes());
		System.out.println("createOpenChat upload POST Start");
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
		System.out.println("savedName : "+savedName);
		chatting.setPic_change(savedName);
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
	
	
	@RequestMapping(value="test02")
	public ModelAndView test02()  {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/chatAshmjb/test02");
		return mv;
	}
	
	@RequestMapping(value = "openChatList")
	public ModelAndView list(Chatting chatting , String currentPage) {
		logger.info("list Start ... ");
		ModelAndView mv = new ModelAndView();
		int total = cs.total(); // Emp Count 
		// empdao에 토탈을 불러오니까 그 토탈이 몇개더라
		Paging pg = new Paging(total, currentPage);
		chatting.setStart(pg.getStart()); // 시작시 1
		chatting.setEnd(pg.getEnd());// 시작시 10
		List<Chatting> openChatList = cs.openChatList(chatting);
		System.out.println("ChattingController openChatList openChatList.size()-> "+ openChatList.size());
		mv.addObject("openChatList", openChatList);
		mv.addObject("pg",pg);
		mv.addObject("total", total);
		mv.setViewName("/chatAshmjb/openChatList");
		
		return mv;
	}
	
	@RequestMapping(value = "/chatnaeyong")
	public List<Message> chatnaeyong(int room_num) {
		logger.info("chatnaeyong msgnaeyong room_num-> "+room_num);
		List<Message> msgnaeyong = cs.msgnaeyong(room_num);
		System.out.println("msgnaeyong.get(0).getsend_user_id"+msgnaeyong.get(0).getSend_user_id());
		System.out.println("msgnaeyong.get(0).getRoom_num()->"+msgnaeyong.get(0).getRoom_num());
		System.out.println("msgnaeyong.size()->"+msgnaeyong.size());
		return msgnaeyong;
	}
	
	@Getter
	@Setter
	public class UploadFile {
		private MultipartFile fileUpload;
		private String uploadImg;
	}
	
	@RequestMapping(value="imgAjax", method = RequestMethod.POST) 
	public Map<String,Object> uploadFiles(UploadFile uploadFile, HttpServletRequest request) throws Exception{
		System.out.println("tn "+uploadFile.getFileUpload().getOriginalFilename());
		System.out.println("tb "+uploadFile.getFileUpload().getBytes());
		String uploadFolder = request.getSession().getServletContext().getRealPath("/upload/");
		String uploadFileName = "";
		String uploadFilesavedName = "";
		Map<String,Object> resultMap=new HashMap<String,Object>();
		uploadFileName = uploadFile.getFileUpload().getOriginalFilename();
		uploadFilesavedName = uploadFile(uploadFileName, uploadFile.getFileUpload().getBytes(), uploadFolder);
		System.out.println("imgAjaxFileName-> "+uploadFilesavedName);
		String realFileName = "/upload/"+ uploadFilesavedName;
		System.out.println(realFileName + "-------");
		resultMap.put("addr", uploadFolder);
		resultMap.put("fileName", uploadFilesavedName);
		resultMap.put("realFileName", realFileName);
        return resultMap;
		        
    }
		
	
	
}
