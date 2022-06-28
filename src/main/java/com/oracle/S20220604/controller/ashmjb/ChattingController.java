package com.oracle.S20220604.controller.ashmjb;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.oracle.S20220604.model.Participant;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.ReadCheck;
import com.oracle.S20220604.service.ashmjb.ChattingService;
import com.oracle.S20220604.service.ashmjb.Paging;
import com.oracle.S20220604.service.ashmjb.ReadCheckService;

import lombok.Getter;
import lombok.Setter;


@RestController
public class ChattingController {
   private static final Logger logger =LoggerFactory.getLogger(ChattingController.class);
   @Autowired
   private ReadCheckService rs;
   @Autowired
   private final ChattingService cs;
   @Autowired
   public ChattingController(ChattingService cs) {
      this.cs = cs;
   }
   
   @RequestMapping("/chat") // room_type : 1 or 2
   public ModelAndView chat(HttpServletRequest request, Chatting chatting , String currentPage) {
      ModelAndView mv = new ModelAndView();
      if(request.getSession().getAttribute("sessionId") != null) {
         System.out.println("ChattingController chat start");
         String session_id = (String) request.getSession().getAttribute("sessionId");
         System.out.println("ChattingController chat session_id : "+session_id);
         mv.addObject("user_id", session_id);
         System.out.println("chatting.getKeyword()=> "+chatting.getKeyword());
         chatting.setRoom_type(1);
         chatting.setRoom_type2(2);
         chatting.setUser_id(session_id);
         
         if(chatting.getKeyword() != null) {
            chatting.setUser_id(session_id);
            List<Chatting> keywordList =  cs.keywordList(chatting);
            System.out.println("chattingcontroller chat showList.size()-> "+ keywordList.size());
            mv.addObject("showList", keywordList);
         }else {
            
            List<Chatting> showList =  cs.showList(chatting);
            System.out.println("chattingcontroller chat showList.size()-> "+ showList.size());
            mv.addObject("showList", showList);
         }
         
         int total = cs.ListTotal(chatting);
         Paging pg = new Paging(total, currentPage);
         
         mv.setViewName("/chatAshmjb/chatRoomMain");
         return mv;
      }
      else {
         mv.setViewName("/mainLoginPms/login");
         return mv;
      }
   }
   
   @RequestMapping("/chat1") // room_type : 3
   public ModelAndView chat1(HttpServletRequest request, Chatting chatting) {
      ModelAndView mv = new ModelAndView();
      if(request.getSession().getAttribute("sessionId") != null) {
         System.out.println("ChattingController chat1 판매자와채팅 start");
         
         String session_id = (String) request.getSession().getAttribute("sessionId");
         
         mv.addObject("user_id", session_id);
         chatting.setRoom_type(3);
         chatting.setRoom_type2(0);
         chatting.setUser_id(session_id);
         
         System.out.println("user_id"+ session_id);
         
         if(chatting.getKeyword() != null) {
            List<Chatting> keywordList =  cs.keywordList(chatting);
            System.out.println("chattingcontroller chat showList.size()-> "+ keywordList.size());
            mv.addObject("showList", keywordList);
         }else {
            List<Chatting> showList =  cs.showList(chatting);
            if(showList != null) {
               System.out.println("chattingcontroller chat showList.size()-> "+ showList.size());
            }
            mv.addObject("showList", showList);
         }
         mv.setViewName("/chatAshmjb/chatRoomMain");
         return mv;
      }
      else {
         mv.setViewName("/mainLoginPms/login.jsp");
         return mv;
      }
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
//      logger.info(file.getOriginalFilename());
      
      System.out.println(file.getOriginalFilename());
      System.out.println(file.getBytes());
      System.out.println("createOpenChat upload POST Start");
      String user_id = request.getSession().getAttribute("sessionId").toString();
      String savedName = "";
      System.out.println("createOpenChat file.getOriginalFilename()->"+file.getOriginalFilename());
      if(!file.getOriginalFilename().isEmpty()) {
          savedName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
      }
      else {
         savedName = "defaultChatImg.png";
      }
      System.out.println("savedName : "+savedName);
      chatting.setPic_change(savedName);
      chatting.setUser_id(user_id);
      cs.insert(chatting);
      cs.insertparticipant(chatting);
//      mv.addObject("savedName", savedName);
      mv.setViewName("redirect:openChatList");
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
      System.out.println("originalFilename -> "+originalFilename);
      String savedName = "";
      File target = null;
      savedName = uid.toString()+"_"+originalFilename;
      logger.info("savedName -> " + savedName);
      target = new File(uploadPath, savedName);
      FileCopyUtils.copy(fileData, target);
      return savedName;
   }
   
   @RequestMapping(value = "openChatList")
   public ModelAndView list(Chatting chatting , String currentPage) {
      logger.info("list Start ... ");
      ModelAndView mv = new ModelAndView();
      int total = cs.OpenChatTotal(); // Emp Count 
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
      List<Message> msgnaeyong = null;
      try {
            logger.info("chatnaeyong msgnaeyong room_num-> "+room_num);
         msgnaeyong = cs.msgnaeyong(room_num);
         System.out.println("msgnaeyong.get(0).getsend_user_id"+msgnaeyong.get(0).getSend_user_id());
         System.out.println("msgnaeyong.get(0).getRoom_num()->"+msgnaeyong.get(0).getRoom_num());
         System.out.println("msgnaeyong.size()->"+msgnaeyong.size());
         System.out.println("msgnaeyong.get(0),getMsg_time() -> "+msgnaeyong.get(0).getMsg_time());
      }catch (NullPointerException e) {
         System.out.println(e.getMessage());
      }catch (IndexOutOfBoundsException e1) {
         System.out.println(e1.getMessage());
      }
      return msgnaeyong;
   }
   
   @RequestMapping(value="/participant")
   public List<Participant> parti(int room_num){
      System.out.println("Chatting Controller parti Start");
      List<Participant> selectParti = null;
      try {
         selectParti = cs.selectParti(room_num);
         for(int i=0; i>selectParti.size(); i++) {
            System.out.println("Chatting Controller participant getUser_id -> "+selectParti.get(i).getUser_id());
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      System.out.println("Chatting Controller parti End");
      return selectParti;
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
   // 오픈채팅리스트에서 방이름 누르면 room_num을 들고 참여자 목록에 인서트
      @RequestMapping(value = "insertParti")
      public ModelAndView insertParti(Participant parti,HttpServletRequest request) {
         ModelAndView mv = new ModelAndView();
         parti.setRoom_num(Integer.parseInt(request.getParameter("room_num")) ); 
         System.out.println("ChattingController parti.getRoom_num : "+ parti.getRoom_num());
         System.out.println("ChattingController createOpenChat Start... ");
         String user_id = (String) request.getSession().getAttribute("sessionId");
         if(request.getSession().getAttribute("sessionId") == null) {
            System.out.println("user_id getSession ==null");
            request.getSession().setAttribute("sessionId", "namwoo");
            parti.setUser_id(user_id);
         }
         else if(request.getSession().getAttribute("sessionId") != null){
            System.out.println("user_id getSession !=null");
            parti.setUser_id(user_id);
         }
         //cs.count(parti);
         
          cs.insertParti(parti);
         mv.setViewName("redirect:openChatList");
         return mv;
      }   
      
      @RequestMapping("chatWithCeller")
      public ModelAndView chatWithCeller(HttpServletRequest request) {
         ModelAndView mv = new ModelAndView();
         System.out.println("ChattingController chatWithCeller Start... ");
         
         String user_id = (String) request.getSession().getAttribute("sessionId");
         // request로 넘겨받은 값 셋팅하기 -- 우선 하드코딩
         int pro_num = Integer.parseInt(request.getParameter("pro_num"));
         String p_pro_user_id = request.getParameter("user_id");
         String pro_title = request.getParameter("pro_title");
         
         Product product = new Product();
         product.setLogin_user_id(user_id);
         product.setPro_num(pro_num);
         product.setUser_id(p_pro_user_id);
         product.setPro_title(pro_title);
         System.out.println("ChattingController chatWithCeller product.getPro_title : "+ product.getPro_title());
         System.out.println("ChattingController chatWithCeller 판매자 ID product.getUser_id : "+ product.getUser_id());
         System.out.println("ChattingController chatWithCeller 로그인 ID product.getLogin_user_id : " + product.getLogin_user_id() );
         
         cs.insertChatWithCeller(product); // 이름은 바꿔도 됨
         mv.setViewName("redirect:chat1");
         return mv;
         
      }
      
      @RequestMapping("chatWithConsumer")
      public ModelAndView chatWithConsumer(HttpServletRequest request) {
         ModelAndView mv = new ModelAndView();
          System.out.println("ChattingController chatWithCeller Start... ");
          String user_id = (String) request.getSession().getAttribute("sessionId");
          String con_user_id = request.getParameter("user_id");
          Participant pt = new Participant();
          pt.setUser_id(user_id);
          pt.setCon_user_id(con_user_id);
          System.out.println("ChattingController chatWithConsumer pt.getUser_id() : "+   pt.getUser_id());
          System.out.println("ChattingController chatWithConsumer 리뷰 ID pt.getCon_user_id() : "+ pt.getCon_user_id());
          
          cs.inChatWithConsumer(pt);
          
          mv.setViewName("redirect:chat");
          return mv;
      }
      @RequestMapping(value="/participant3")
      public List<Participant> parti3(int room_num){
         System.out.println("Chatting Controller parti Start");
         List<Participant> selectParti3 = null;
         try {
            selectParti3 = cs.selectParti3(room_num);
            for(int i=0; i>selectParti3.size(); i++) {
               System.out.println("Chatting Controller participant getUser_id -> "+selectParti3.get(i).getUser_id());
            }
         } catch (Exception e) {
            System.out.println(e.getMessage());
         }
         System.out.println("Chatting Controller parti End");
         return selectParti3;
      }
     /* 
      public int FirstInsertReadCheckMe (ReadCheck rc) {
         System.out.println("실행성공.");
         int result = rs.insertMe(rc);
         return result;
      }
   
      public int FirstInsertReadCheckOther (ReadCheck rc) {
         System.out.println("실행성공.");
         int result = rs.insertOther(rc);
         return result;
      }
   */
}