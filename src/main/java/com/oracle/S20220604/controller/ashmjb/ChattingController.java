package com.oracle.S20220604.controller.ashmjb;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
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
import com.oracle.S20220604.service.ashmjb.Paging;


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
	
	private String resizeImg(String originalFileName) {
		String remakeFileName = "";
		
		String imgOriginalPath= "C:\\Users\\Anhyemi\\Desktop\\defaultChatImg.png";           // 원본 이미지 파일명
        String imgTargetPath= "C:\\Users\\Anhyemi\\Desktop\\testimg\\defaultChatImg3.png";    // 새 이미지 파일명
        String imgFormat = "png";
        int newWidth = 300;
        int newHeight = 300;

        Image image;
        int imageWidth;
        int imageHeight;

        try{
            // 원본 이미지 가져오기
            image = ImageIO.read(new File(imgOriginalPath));

            // 원본 이미지 사이즈 가져오기
            imageWidth = image.getWidth(null);
            imageHeight = image.getHeight(null);

            System.out.println("imageWidth : " + imageWidth);
            System.out.println("imageHeight : " + imageHeight);


            // 이미지 리사이즈
            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
            Image resizeImage = image.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
            System.out.println("reimageWidth : " + resizeImage.getWidth(null));
            System.out.println("reimageHeight : " + resizeImage.getHeight(null));
            // 새 이미지  저장하기
            BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
            Graphics g = newImage.getGraphics();
            g.drawImage(resizeImage, 0, 0, null);
            g.dispose();
            ImageIO.write(newImage, imgFormat, new File(imgTargetPath));

        }catch (Exception e){

            e.printStackTrace();

        }
		
		return remakeFileName;
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
	
	
	
}
