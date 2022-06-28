package com.oracle.S20220604.controller.pms;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.UUID;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

import javax.mail.internet.MimeMessage;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.service.kge.Paging;
import com.oracle.S20220604.service.kge.ProductService;
import com.oracle.S20220604.service.pms.MainLoginService;

@Controller

public class MainLoginController {
	
	 @Autowired
	 private MainLoginService ms;
	 
	 @Autowired
	  private ProductService ps; //상품서비스
	 
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 private static final Logger logger = LoggerFactory.getLogger(MainLoginController.class);
	 
	 //--------------------------main----------------------------\\		
	 	@RequestMapping(value = "index") //index
		public String index() {
			
			return "base/index";
		}
		@RequestMapping(value = "header")
		public String header() {
			
			return "base/header";
		}
		@RequestMapping(value = "header2")
		public String header2() {
			
			return "base/header2";
		}
		@RequestMapping(value = "main")  //메인페이지
		   public String main(Product product, String curreuntPage, Model model) {
		      System.out.println("MainLoginController product_bestTop4list Start...");
		      //배너리스트
		      List<Banner> bannerList = ms.bannerList();
		      Banner b1 = bannerList.get(0);
		      Banner b2 = bannerList.get(1);
		      Banner b3 = bannerList.get(2);
		      
		      // 상품 목록 리스트 - 상품 갯수
		      int total2 = ms.total2(product);
		      Paging pg = new Paging(total2, curreuntPage);
		      product.setStart(pg.getStart());
		      product.setEnd(pg.getEnd());
		      
		      // 베스트 상품 목록 리스트 - 상품 목록
		      List<Product> listBest4Product = ms.listBest4Product(product);
		      List<Product> listNew4Product = ms.listNew4Product(product);
		      System.out.println("MainLoginController product_bestTop4list listBest4Product.size()->"+listBest4Product.size());
				
			  for(Product product2 : listBest4Product) {
					  System.out.println("MainLoginController product_bestTop4list product2.getPro_title()->"+product2.getPro_title());  
					  System.out.println("MainLoginController product_bestTop4list product2.getPro_price()->"+product2.getPro_price());  
			  } 
			  for(Product product3 : listNew4Product) {
				  System.out.println("MainLoginController product_newTop4list product2.getPro_title()->"+product3.getPro_title());  
				  System.out.println("MainLoginController product_newTop4list product2.getPro_price()->"+product3.getPro_price());  
 				  System.out.println("MainLoginController product_newTop4list product2.getPro_price()->"+product3.getPro_photo());  
		  } 
			
			  model.addAttribute("bannerList",bannerList);//메인 배너 리스트 (순서대로)
			  System.out.println("MainLoginController bannerList->"+bannerList.size());  

			  model.addAttribute("b1", b1);
			  System.out.println("MainLoginController bannerList  b1->"+ b1);  
			  model.addAttribute("b2", b2);
			  model.addAttribute("b3", b3);
		      model.addAttribute("product", product);
		      model.addAttribute("product_bestTop4list", listBest4Product); //여기서 모델에 전체 리스트를 담아주는것-> 민서는 베스트, 뉴 따로 리스트 만들어야함
		      model.addAttribute("product_newTop4list", listNew4Product); //여기서 모델에 전체 리스트를 담아주는것-> 민서는 베스트, 뉴 따로 리스트 만들어야함
		      model.addAttribute("pg", pg);
		      model.addAttribute("total", total2);
		      return "mainLoginPms/main";// base/index mainLoginPms/main
		   

	}
			@RequestMapping(value = "footer") //푸터
			public String list() {
				
				return "base/footer";
			}
			@RequestMapping(value = "login")	//로그인페이지로 이동
			public String login() {
				
				return "mainLoginPms/login";
			}
			@RequestMapping(value = "findID")	//아이디찾기페이지로 이동
			public String findID() { 
				
				return "mainLoginPms/findID";
			}
			@RequestMapping(value = "findPW")	//비밀번호찾기페이지로 이동
			public String findPW() { 
				
				return "mainLoginPms/findPW";
			}

	//--------------------------login start----------------------------\\
	/*
	 * @RequestMapping(value = "loginbtn") public void login(Member member, Model
	 * model, HttpServletResponse response, HttpServletRequest request) throws
	 * IOException{//로그인 System.out.println("MainLoginController login Start...");
	 * ms.login(member, response, request);
	 * System.out.println("user_id->"+member.getUser_id());
	 * 
	 * }
	 */
			@RequestMapping(value = "loginbtn")
			public String login(Member member, String user_id, Model model, HttpServletRequest request) {//로그인
				System.out.println("MainLoginController login Start...");
				Member login =ms.login(member);
				System.out.println("MainLoginController login->"+login);
				int result = 0; // 실패시 로그인 창에서 알러트띄우고 싶은데 이거 모델에 넣어야할까?리스판스.겟롸이터써서 아작스에 같이 넣어야하남
				if (login == null) {//로그인 실패시 
					result = 0;
					System.out.println("MainLoginController 아이디 혹은 비번 오류");
					model.addAttribute("result",result);
					model.addAttribute("msg","아이디 혹은 비번 오류");
					return"mainLoginPms/login";
					
				}else {//로그인 성공시 세션유지
					result = 1;
					request.getSession().setAttribute("sessionId", user_id);
					model.addAttribute("Member", login);
					model.addAttribute("user_id", user_id);
					model.addAttribute("result",result);
					System.out.println("MainLoginController login user_id->"+user_id);
					return "base/index";// base/index mainLoginPms/main //로그인.jsp
				}
			
			}
	//-------------------------logout start------------------------\\
			@RequestMapping(value = "logout_button")
			public String logout(HttpServletRequest request) { //로그아웃/*HttpSession session)*/
				System.out.println("MainLoginController logout Start...");
//				session.setAttribute("sessionID", null);
//				session.invalidate();
				request.getSession().invalidate();//세션비우기
				return "base/index";  //base/index mainLoginPms/main
			}
			
	//-------------------------find id start------------------------\\
			
			@RequestMapping(value = "findIdBtn")
			@ResponseBody
			public Member findIdCheck(Member member, Model model) {
				System.out.println("MainLoginController findIdBtn start...");
			    Member member3 = ms.findIdCheck(member);
				if(member3 == null) {
					member3 = new Member();
					System.out.println(member3);
					member3.setUser_id("failUser");
					System.out.println("일치하는 회원정보가 없음 아이디");
				}
				return member3;
						
			}

	//-------------------------find pw start------------------------\\
			
			@RequestMapping("findPwBtn")
			@ResponseBody
			public Member findPwCheck(HttpServletRequest request, Member member, Model model) {
				System.out.println("MainLoginController findPwBtn Start..");
				System.out.println("MainLoginController findPwBtn"+member.getUser_id());
				System.out.println("MainLoginController findPwBtn"+member.getUser_name());
				System.out.println("MainLoginController findPwBtn"+member.getEmail());

				Member member5 = new Member();
				member5 = ms.findPwCheck(member);
				if(member5 != null) {
					System.out.println("비밀번호 찾아옴");
					System.out.println("MainLoginController findPwBtn member.getUser_pw()(just check)->"+member.getUser_pw());
					System.out.println("MainLoginController mailiSending...");
					String tomail = member.getEmail();  //받는 사람이메일
					System.out.println(tomail);
					String setfrom = "sajomarket@gmail.com"; //보내는 사람 이메일
					String title ="[마켓사조] 임시비밀번호가 발급되었습니다 ";      //제목 
					try {
						//Mime : 전자우편 Internet 표준 프로토콜
						MimeMessage message = mailSender.createMimeMessage();//인스턴스(메일센더객체의 크리에이트마임메시지를 하면 인스턴스로 만들 수 있음)
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //헬퍼를 호출해야지(메세지, 트루, 한글화) 인스턴스
						//메일을 보내는 메서드
						messageHelper.setFrom(setfrom); 	 //보내는 사람 생략하면 정상작동안함
						messageHelper.setTo(tomail);		 //받는 사람이메일
						messageHelper.setSubject(title);	 //메일 제목은 생략이 가능하다
						String tempPassword = (int) (Math.random() * 999999)+1+"";
						
						messageHelper.setText("안녕하세요 '"+ member.getUser_name() 
						+"' 회원님! 회원님의 비밀번호가 임시코드로 변경되었습니다. 임시코드  :  " 
						+ tempPassword 
						+" 로그인 후 [내정보] - [비밀번호 변경]에서 수정해 주시기 바랍니다."); //메일 내용
						System.out.println("임시비밀번호 입니다 :"+ tempPassword);
						
						mailSender.send(message);
						model.addAttribute("check", 1); //정상전달	
						
						//임시비밀번호를 db에 비밀번호로 업데이트
//						String user_id = member5.getUser_id();
						member5.setUser_pw(tempPassword);
						System.out.println("임시비밀번호가 들어가시나요-? : "+member5.getUser_pw());
						
						int findPwUp = ms.updateTempPassword(member5); 
						
						                                                                                                          
					} catch (Exception e) {
						//안되는경우 : 보안설정 열어주기, 2단계인증 없애주기, 백신때문에 안갈 수도 있음
						System.out.println(e);//문제가 있을경우
						// model.addAttribute("check",2); //메일전달 실패
						member5.setUser_id("failUser");
					}
					
					
				}else {
					member5 = new Member();
					System.out.println(member5);
					member5.setUser_id("failUser");
					System.out.println("일치하는 회원정보가 없음");
				}
				return member5;	
			}
			
		
	//-------------------------joinAgree start------------------------\\
			@RequestMapping(value = "joinAgree") //회원가입 이용약관동의페이지 1 
			public String joinAgree() {
				System.out.println("MainLoginController joinAgree start");
				return "mainLoginPms/joinAgree";
			}
	//-------------------------joinForm start------------------------\\
			@RequestMapping(value = "joinForm")  //회원가입 (회원정보 등록)
			public String joinForm() {
				System.out.println("MainLoginController joinForm start");
				return "mainLoginPms/joinForm";
			}
			
	//-------------------------join checkId start------------------------\\아이디 중복체크
			@PostMapping(value = "/checkId" )
			public void checkId(HttpServletResponse response, @RequestParam("user_id") String user_id) throws IOException{
				System.out.println("MainLoginController checkId start");
				ms.checkId(user_id, response);
				System.out.println("user_id->"+user_id);
			}
			
	//-------------------------join start------------------------\\
			@RequestMapping(value = "/join", method = RequestMethod.POST)
			public ModelAndView joinInsert( Member member,HttpServletRequest request, MultipartFile multi) throws IOException, Exception {
				System.out.println("MainLoginController joinInsert start");
				System.out.println("이메일을 어떻게 보내니->"+member.getEmail());
				System.out.println("MainLoginController->member.getPhotoChange()"+member.getPhotoChange());
				ModelAndView mv = new ModelAndView();
				String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
				System.out.println("MainLoginController->member.getPhotoChange()"+member.getPhotoChange());
				logger.info("originalName: "+ multi.getOriginalFilename());
//				System.out.println(multi.getOriginalFilename()); //여기서 널값이 들어가서 오류가난더
//				System.out.println(multi.getBytes());
				System.out.println("createOpenChat upload POST Start");
				
				if(multi != null) { 
					String savedName = uploadFile(multi.getOriginalFilename(), multi.getBytes(), uploadPath); //여기서 (사진)파일을 넣는것
					System.out.println("savedName : "+savedName);
					member.setUser_photo(savedName);
					System.out.println("member.getUser_photo()->"+member.getUser_photo());
				}else { //인풋에 파일을 안넣었다면 디폴트 사진을 넣기
					member.setUser_photo(member.getPhotoChange());
					System.out.println("MainLoginController 유저 포토->"+member.getUser_photo());
				}
				
				ms.joinInsert(member);
				System.out.println("이메일이 어떻게 넘어가니->"+member.getEmail());
				mv.setViewName("redirect:login"); 
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

				
				return savedName;
			}
	//---------------------------네이버 아이디로 로그인 도전중---------------------------------

			@RequestMapping(value="/S20220604/mainLoginPms/naverCallback", method=RequestMethod.GET)
			public String callBack(){
				return "mainLoginPms/naverCallback";
				
				
			}
			@RequestMapping(value="naverSave", method=RequestMethod.POST)
			public @ResponseBody String naverSave(@RequestParam("user_id") String user_id, @RequestParam("user_name") String user_name, @RequestParam("email") String email ) {
			System.out.println("#############################################");
			System.out.println(user_id);
			System.out.println(user_name);
			System.out.println(email);
			System.out.println("#############################################");

			Member member = new Member();
			member.setUser_id(user_id);
			member.setUser_name(user_name);
			member.setEmail(email);
		    
			// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
			String result = "no";
		    
			if(member!=null) {
				// member가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
				result = "ok";
			}

			return result;
		    
			}
	//-----------------------------------전체 베스트 상품 목록으로 넘어가기(베스트 정보를 담아서 프로덕트 보드로 넘기기)------------------------------------
			@GetMapping(value = "/productBoardBest")
			public String productBoardBest(Product product, String curreuntPage, Model model) {
		      System.out.println("MainLoginController product_bestTop4list Start...");
		      
		      // 상품 목록 리스트 - 상품 갯수
		      int total2 = ms.total2(product);
		      Paging pg = new Paging(total2, curreuntPage);
		      product.setStart(pg.getStart());
		      product.setEnd(pg.getEnd());
		      
		      // 베스트 상품 목록 리스트 - 상품 목록
		      
		      List<Product> BestProductlist = ms.BestProductlist(product);
		  
		      System.out.println("MainLoginController productBoardBest listBest4Product.size()->"+BestProductlist.size());
				
			  for(Product product2 : BestProductlist) {
					  System.out.println("MainLoginController product_bestTop4list product2.getPro_title()->"+product2.getPro_title());  
					  System.out.println("MainLoginController product_bestTop4list product2.getPro_price()->"+product2.getPro_price());  
			  } 
			
			
			  model.addAttribute("titless",1);  
		      model.addAttribute("product", product);
		      model.addAttribute("listProduct", BestProductlist); //여기서 모델에 전체 리스트를 담아주는것-> 민서는 베스트, 뉴 따로 리스트 만들어야함
		      model.addAttribute("pg", pg);
		      model.addAttribute("total", total2);
		      return "mainLoginPms/bestNewBoard";
			
		}
	//-----------------------------------전체  신상품 목록으로 넘어가기(베스트 정보를 담아서 프로덕트 보드로 넘기기)------------------------------------
			@GetMapping(value = "/productBoardNew")
			public String productBoardNew(Product product, String curreuntPage, Model model) {
			      System.out.println("MainLoginController productBoardNew Start...");
			      
			      
			      // 베스트 상품 목록 리스트 - 상품 목록
			      
			      List<Product> NewProductlist = ms.NewProductlist(product);
			      
			      // 상품 목록 리스트 - 상품 갯수
			      int total2 = ms.total2(product);
			      Paging pg = new Paging(total2, curreuntPage);
			      product.setStart(pg.getStart());
			      product.setEnd(pg.getEnd());
			  
			      System.out.println("MainLoginController productBoardBest listBest4Product.size()->"+NewProductlist.size());
					
				  for(Product product2 : NewProductlist) {
						  System.out.println("MainLoginController NewProductlist product2.getPro_title()->"+product2.getPro_title());  
						  System.out.println("MainLoginController NewProductlist product2.getPro_price()->"+product2.getPro_price());  
				  } 
				
				
				  model.addAttribute("titless",2);
			      model.addAttribute("product", product);
			      model.addAttribute("listProduct", NewProductlist); //여기서 모델에 전체 리스트를 담아주는것-> 민서는 베스트, 뉴 따로 리스트 만들어야함
			      model.addAttribute("pg", pg);
			      model.addAttribute("total", total2);
			      return "mainLoginPms/bestNewBoard";
				
			}
	//-----------------------------------검색------------------------------------
			@RequestMapping(value = "searchKeyword")
			public String searchKeyword(Product product, String curreuntPage, Model model) {
				System.out.println("MainLoginController searchKeyword Start...");
			      System.out.println("MainLoginController product.getKeyword()"+product.getKeyword());
			      // 상품 목록 리스트 - 상품 갯수
			      int total2 = ms.total2(product);
			      Paging pg = new Paging(total2, curreuntPage);
			      product.setStart(pg.getStart());
			      product.setEnd(pg.getEnd());
			      
			      
			      List<Product> searchKeyword = ms.searchKeyword(product);
			  
			      System.out.println("MainLoginController searchKeyword searchKeyword.size()->"+searchKeyword.size());
					
				  for(Product product2 : searchKeyword) {
						  System.out.println("MainLoginController searchKeyword product2.getPro_title()->"+product2.getPro_title());  
						  System.out.println("MainLoginController searchKeyword product2.getPro_price()->"+product2.getPro_price());  
				  } 
						  
			      model.addAttribute("product", product);
			      model.addAttribute("listProduct", searchKeyword); //여기서 모델에 전체 리스트를 담아주는것-> 민서는 베스트, 뉴 따로 리스트 만들어야함
			      model.addAttribute("pg", pg);
			      model.addAttribute("total", total2);
			      return "productKge/productBoard";
				
				}
			
	}//end
