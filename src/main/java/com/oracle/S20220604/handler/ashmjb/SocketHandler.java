package com.oracle.S20220604.handler.ashmjb;

import java.util.HashMap;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.oracle.S20220604.model.Message;
import com.oracle.S20220604.model.ReadCheck;
import com.oracle.S20220604.service.ashmjb.MessageService;
import com.oracle.S20220604.service.ashmjb.ReadCheckService;

@Component
public class SocketHandler extends TextWebSocketHandler {
   
   @Autowired
   private MessageService ms;
//   String uploadPath = "upload/";
   private String FILE_UPLOAD_PATH = "";
   //웹소켓 세션을 담아둘 맵
//         세션ID       세션 객체
   HashMap<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
   
   // 웹소켓 세션 ID와 Member를 담아둘 맵
   HashMap<String, String> sessionUserMap = new HashMap<String, String>();
   
   // 웹소켓 세션 ID과 Member을 담아둘 JSONObject
   JSONObject jsonUser = null;
   
   @Autowired
   private ReadCheckService rs;
   
   // 메소드는 메시지를 수신하면 실행
   public void handleTextMessage(WebSocketSession session, TextMessage message ) {
      // 메시지 발송
      String msg = message.getPayload();
      System.out.println("9. SocketHandler handleTextMessage msg => "+ msg);
      
      JSONObject jsonObj = jsonToObjectParser(msg); // 여기서 제이선으로 다시 파싱해줌
      // type을 Get 하여 분기
      String msgType = (String) jsonObj.get("type");
      
      
      System.out.println("10. SocketHandler handleTextMessage msg Type -> "+ msgType);
      
      switch(msgType) {
      // 전체 Message
      case "message":
      jsonUser = new JSONObject(sessionUserMap);
      System.out.printf("JSONUser: %s", jsonUser);
      //전송 대상을 기준으로 분기
      
      String yourName = "ALL";
      System.out.println("SocketHandler handleTextMessage yourName -> "+ yourName);

      String msgUserName = (String)jsonObj.get("userName");
      String msgContent = (String)jsonObj.get("msg");
      String mrn   = (String) jsonObj.get("room_num");
      int msgRoomNum = Integer.parseInt(mrn) ;
      String mty   = (String) jsonObj.get("room_type");
      int msgRoomType = Integer.parseInt(mty);
      String msgPic = (String) jsonObj.get("imgSrc");
      String otherName = (String) jsonObj.get("otherName");
      System.out.println(msgPic+"<-------------------------msgPic");
      System.out.println(msgContent+"<----------------------------msgContent");
      Message msgserv = new Message();
//      ReadCheck rc = new ReadCheck();
      msgserv.setContent(msgContent);
      msgserv.setSend_user_id(msgUserName);
      msgserv.setRoom_num(msgRoomNum);
      msgserv.setMsg_type(msgRoomType);
      msgserv.setMsg_pic(msgPic);
//      rc.setRoom_num(msgRoomNum);
//      rc.setRead(0);
//      rc.setUser_id(msgUserName);
      int result = ms.insert(msgserv);
      System.out.println(result);
//      int readCheckInsertMe = rs.insertMe(rc);
//      System.out.println(readCheckInsertMe);
//      rc.setRead(1);
//      rc.setUser_id(otherName);
//      int readCheckInsertOther = rs.insertOther(rc);
//      System.out.println(readCheckInsertOther);
      //전체
      if(yourName.equals("ALL")) {
         for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            try {
               System.out.println("message key -> "+ key);
               System.out.println("message wss -> "+ wss);
               wss.sendMessage(new TextMessage(jsonObj.toJSONString()));
            } catch (Exception e) {
               // TODO: handle exception
            }
         }
      }else { // 개인 전송 대상자 (yourName 은 개인 sessionID)
         // 상대방
         System.out.println("개인 전송 대상자 상대방 sessionID -> "+ yourName);
         WebSocketSession wss1 = sessionMap.get(yourName);
         try {
            wss1.sendMessage(new TextMessage(jsonObj.toJSONString()));
         } catch (Exception e) { // 웹소켓 세션은 가져올수 있으니까. 그거로 세션은 내부적으로가져옴
            // TODO: handle exception
         }
         
         //나에게도 보내줘
         String meName = (String) jsonObj.get("sessionId");
         WebSocketSession wss2 = sessionMap.get(meName);
         System.out.println("개인 전송 대상지 나 -->"+ meName);
         
         try {
            wss2.sendMessage(new TextMessage(jsonObj.toJSONString()));
         } catch (Exception e) {
            // TODO: handle exception
         }
         
      }
      break;
      
      // session UserMap에 User등록
      case "userSave": // user세이브로 들어오면 세션 아이디와 (서버에 등록된 ) 유저 네임을 가지고 세션유저맵에 저장함
         // sessionUserMap에 sessionId와 userName을 등록
         String sessionId = (String) jsonObj.get("sessionId");
         String userName = (String) jsonObj.get("userName");
         String saveStauts = (String) jsonObj.get("saveStatus");// 삭제를 처리하기위세 세이브 스테이터스를 추가했다.
         FILE_UPLOAD_PATH = (String) jsonObj.get("userContext");// 삭제를 처리하기위세 세이브 스테이터스를 추가했다.
//         신규 등록 (status가 )
         if (saveStauts.equals("Create")) {
            sessionUserMap.put(sessionId, userName);   // 이렇게 맵에 저장 해쉬맵이니까 메모리에 저장됨
            System.out.println("11.==================================================");   
               System.out.println("== sessionUserMap 저장내용 조회하여 arrayJsonUser에   ==");
               System.out.println("==  각각의 JSONObject jsonUser로  변환                           ==");
               System.out.println("== 1. type : userSave                          ==");
               System.out.println("== 2. sessionId : sessionUserMap.sessionId     ==");
               System.out.println("== 3. userName  : sessionUserMap.userName      ==");
               System.out.println("== 4. FILE_UPLOAD_PATH  : FILE_UPLOAD_PATH               ==");
               System.out.println("==    FILE_UPLOAD_PATH  ==>"+FILE_UPLOAD_PATH);
               System.out.println("=================================================");
         }
         // Delete일때
         else { // Delete일때
            System.out.println("handleTextMessage userDelete start...");
            System.out.println("handleTextMessage userDelete session.getId() -> "+ session.getId());
            // 웹소켓 종료
            sessionMap.remove(session.getId()); // 키를 빼는거니까 remove는 맵에서 삭제하는거고 그럼 키가 빠지니까 그 해당 row가 다 삭제되게됨
            sessionUserMap.remove(session.getId());   // 이렇게 세션맵에서 키를 빼고, 세션유저맵에서 키를 빼면 그 해당 유저가 완전히 없어지게되는거지
         }
         
            JSONArray arrayJsonUser = new JSONArray(); // 맵에 저장된걸 제이선어레이를 이용함
            System.out.println("== 1. type : userSave                          ==");
            Iterator<String> mapIter = sessionUserMap.keySet().iterator(); // 키셋을 만들면 타입 세션아이디 유저네임이 키가되고 :뒤에게 값이 됨
            // 돌려가셤서 이터레이터로 작업함
           // 이터레이터 안에 키값들이 배열처럼 들어가있음, 배열은 아닌데 배열처럼 -> 이터레이터 많이들 쓴다. 이거도 디자인패턴중하나
            // 삭제 됬을떄 그 사람이 else에서 빠진채로 이터레이터 돌아가면 빠진 채로 있는사람들만 돌아가서 맵에 담기게 됨
            System.out.println("== 2. sessionId : sessionUserMap.sessionId     ==");
            System.out.println("== 3. userName : sessionUserMap.userName       ==");
            while(mapIter.hasNext()) { // while로 돌려가면서 값을 빼옴
               String key = mapIter.next();
               String value = sessionUserMap.get(key);
               System.out.println("Key :Value ---> "+ key + " : "+ value);
               jsonUser = new JSONObject();
               jsonUser.put("type", "userSave"); // 타입을 userSavefㅏ고 하고
               jsonUser.put("sessionId", key); // sessionId를 키로
               jsonUser.put("userName", value); // userName을 밸류로 올림
               arrayJsonUser.add(jsonUser); // 올라간거를 어레이 제이선 유저(배열이다)로 어팬드 해둠
               // 돌아간것을 어레이로 묶어둠
            }
            System.out.println("12 ======== session을 Get하여 User 내용 전송 =====");
            System.out.printf("13. arrayJsonUser: %s", arrayJsonUser);
            
            // 전체에 User등록을 하게함
            for(String key : sessionMap.keySet()) { // 누가 어떤 세션을 갖고있는지 알고있으니 이걸 웹세션으로 받아줌 이건연결한 세션아이디 그걸알면 통신할수있음
               // key를 가져오면 진짜 맵에 세션에 있는 인스턴스를 가져온다/
               WebSocketSession wss = sessionMap.get(key);
               try {// 세션을 가진애한데 어레이 제이션 유저 해주면 가져온 내용을 그대로 전달하고
               wss.sendMessage(new TextMessage(arrayJsonUser.toJSONString()));
               // 서버에 등록된 모든 유저들에게 메세지로 알려줌
               System.out.println("14. wss.sendMessage(new TextMessage(arrayJsonUser.toJSONString()))이후");
               } catch (Exception e) { 
               System.out.println(" 전체에 User등록 Exception-> "+ e.getMessage());
            }
            }break;
            default: 
               System.out.println("--------- case default ------");
               break;
      }
      System.out.println("switch closed");
      
   }
   
   /*  이건 컴파일러가 일반적으로 경고하는 내용 중   "이건 하지마"하고 제외시킬 때 쓰임
   //   따라서 어떤 경고를 제외시킬지 옵션
   //   1. all : 모든 경고를 억제
   //   2. cast : 캐스트 연산자 관련 경고 억제
   //   3. dep-ann : 사용하지 말아야 할 주석 관련 경고 억제
   //   4. deprecation : 사용하지 말아야 할 메소드 관련 경고 억제
   //   5. fallthrough : switch문에서의 break 누락 관련 경고 억제
   //   6. finally : 반환하지 않는 finally 블럭 관련 경고 억제
   //   7. null : null 분석 관련 경고 억제
   //   8. rawtypes : 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제
   //   9. unchecked : 검증되지 않은 연산자 관련 경고 억제
   //   10. unused : 사용하지 않는 코드 관련 경고 억제 */

   // 웹 소켓 연결이 되면 동작            
   @SuppressWarnings("unchecked") // 이렇게 해두면 밑에 노란불 알림뜨는것 없어진다.
   public void afterConnectionEstablished(WebSocketSession session) throws Exception{
      System.out.println("2. SocketHandler afterCOnnectionEstablished start...");
      // 웹소켓에 연결이 되면 동작
      super.afterConnectionEstablished(session);  
      // 아버지한테 연결해달라하고 -- 여기가 바인딩에 해당 진짜 연결은 여기서 된다. 세션이 열린것
      // 이걸 선언하기 전에는 getId가 없다. 연결이 안됬으니까.
      //연결 소켓을 mAP에 등록 여기서 진짜로 연결하고 연결한 정보를 아래 세션맵에다 저장을하고
      // 연결이 되어야만 세션에 아이디가 생긴다. 
      
      sessionMap.put(session.getId(), session); // 그걸 맵에다 저장해두겟다 
      // 세션맵은 위에 선언한 세션맵이고 해쉬맵은 메모링에 달고다니려고 쓰는거고 
      JSONObject jsonObj = new JSONObject();
      // 대상 : Client
      // 질문 ? 갑자기 왜 제이선에 put한거지?? 
      jsonObj.put("type", "getId"); //이것들을  json으로 말아서 샌드메시지로 클라이언트로 보냄
   //  여기 type 에 getId넣는거도 하나의 그냥 비지니스다 다른거 넣어도 된다.
      jsonObj.put("sessionId", session.getId()); 
      // SocketServer 가 Client에게 전송
      session.sendMessage(new TextMessage(jsonObj.toJSONString()));
      // 여기서 샌드 메시지 쓰면클라이언트에 전송함 -> 그럼 chat.jsp가 클라이언트로써 받는다.
      // 그럼 이걸 json으로 말아서 전달한다. 
   }
   
   // 웹 소켓이 종료되면 동작
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
      System.out.println("socketHandler afterConnectionClosed start... ");
   }
   
   // handleTextMessage 메소드에 JSON 파일이 들어오면 파싱해주는 함수를추가
   private static JSONObject jsonToObjectParser(String jsonStr) {
      JSONParser parser = new JSONParser();
      JSONObject jsonObj = null;
      try {
         jsonObj = (JSONObject) parser.parse(jsonStr);
      } catch (ParseException e) {
         System.out.println("jsonToObjectParser Exception -> "+e.getMessage());
      }
      return jsonObj;
   }
   
}