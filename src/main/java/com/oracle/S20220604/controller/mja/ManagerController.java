package com.oracle.S20220604.controller.mja;

import java.io.File;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Faq;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberChk;
import com.oracle.S20220604.service.mja.ManagerService;
import com.oracle.S20220604.service.mja.Paging;
 

@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//관리자 메인페이지
	@GetMapping(value = "adminMain")
	public String main( Model model) {
		System.out.println("adminMain으로 이동");
		LocalDate now = LocalDate.now();
		String sysdate = now.toString();
		String minusdate = now.minusDays(6).toString();
		List<Member> member = managerService.newMember();
		int num = member.size();
		List<MemberChk> seller = managerService.approveSeller();
		model.addAttribute("num", num);
		model.addAttribute("sysdate", sysdate);
		model.addAttribute("minusdate", minusdate);
		model.addAttribute("member", member);
		model.addAttribute("seller", seller);
		return "manageMja/adminMain";
	}

	
	//관리자 회원관리
	@GetMapping(value = "memberManage")
	public String memberManage(Model model) {
		System.out.println("mamberManage 컨트롤러");
		int totCnt  = managerService.memberCnt();
		List<Member> memberList = managerService.memberList();
		model.addAttribute("num", totCnt);
		model.addAttribute("memberList", memberList);
		return "manageMja/memberManage";
	}
	
	//회원조회
	@RequestMapping(value = "memberKeyword")
	public String memberKeyword(Member member, Model model) {
		System.out.println("memberKeyword 컨트롤러");
		System.out.println("membersearch :" + member.getSearch());
		List<Member> memberList = managerService.memberKeyword(member);
		//keyword 맞는 count 
		int total = memberList.size();
		System.out.println("memberKeywordCnt : " + total);
		model.addAttribute("num", total);
		model.addAttribute("memberList", memberList);
		return "manageMja/memberManage";
	}
	

	//소비자가 보는 공지
	@RequestMapping(value = "notice")
	public String notice(Board board, String currentPage, Model model) {
		System.out.println("notice 컨트롤러");
	 
		System.out.println("currentPage : " + currentPage);
		//전체 글 
		int total = managerService.boardTotal();
		System.out.println("notice total :"  + total);
		Paging paging = new Paging(total, currentPage);
		board.setStart(paging.getStart());
		board.setEnd(paging.getEnd());
		System.out.println("start : " + board.getStart() + " end : " + board.getEnd());
		List<Board> boardList = managerService.boardList(board);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		model.addAttribute("total", total);
		return "manageMja/notice";
	}
	
	//공지상세보기
	@GetMapping(value = "noticeDetail")
	public String updateNotice(int board_num, Model model) {
		System.out.println("noticeDetail 컨트롤러");
		int result = managerService.noticeHits(board_num);
		if(result > 0) System.out.println("조회수 증가 성공");
		else           System.out.println("조회수 증가 실패");
		Board board = managerService.noticeDetail(board_num);
		model.addAttribute("bd", board);
		return "manageMja/noticeDetail";
	}

	//관리자메인페이지 공지
	@GetMapping(value = "noticeManage")
	public String noticeManage(Board board, String currentPage, Model model) {
		System.out.println("noticeManage 컨트롤러");
		System.out.println("currentPage : " + currentPage);
		//전체 글 
		int total = managerService.boardTotal();
		System.out.println("notice total :"  + total);
		Paging paging = new Paging(total, currentPage);
		board.setStart(paging.getStart());
		board.setEnd(paging.getEnd());
		System.out.println("start : " + board.getStart() + " end : " + board.getEnd());
		List<Board> boardList = managerService.boardList(board);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		model.addAttribute("total", total);
		return "manageMja/noticeManage";
	}
	
	@GetMapping(value = "writeNoticeForm")
	public String writeNoticeForm() {
		System.out.println("writeNoticeForm 컨트롤러");
		return "manageMja/writeNoticeForm";
	}
	
	//관리자 공지 등록
	@GetMapping(value = "writeNotice")
	public String writeNotice(Board board, Model model) {
		System.out.println("writeNotice 컨트롤러");
		int result = managerService.writeNotice(board);
		if(result > 0) 	return  "redirect:noticeManage";
		else 			return 	"forward:writeNotice";
	}
	
	
	//공지수정
	@GetMapping(value = "noticeUpdateForm")
	public String noticeUpdateForm(int board_num, Model model) {
		System.out.println("noticeDetail 컨트롤러");
		Board board = managerService.noticeDetail(board_num);
		model.addAttribute("bd", board);
		return "manageMja/noticeUpdateForm";
	}
	
	
	
	
	//관리자 쿠폰
	@GetMapping(value = "couponManage")
	public String couponManage(Model model) {
		System.out.println("couponManage 컨틀롤러");
		//쿠폰 목록
		List<Coupon> coupons = managerService.coupons();
		model.addAttribute("coupons", coupons);
		return"manageMja/couponManage";
	}
	//쿠폰 발행
	@GetMapping(value = "createCoupon")
	public String createCoupon(Coupon coupon, Model model) {
		System.out.println("createCoupon 컨트롤러");
		System.out.println("coupon" + coupon);
		int result = managerService.createCoupon(coupon);
		if(result > 0 ) return "redirect:couponManage";
		else {
			return "forward:couponManage";
		}	
	}
	

	
	
	//소비자가 보는 1:1 문의
	@RequestMapping(value = "faq")
	public String faq(String user_id, Model model) {
		System.out.println("faq 컨트롤러");
		
		if(user_id.isEmpty()) {
			System.out.println("로그인 안했을때");
			return "manageMja/faqNotLogin";
		} else {
			System.out.println("로그인 했을 때");
			return "manageMja/faqLogin";
		}
	}
	
	
	
	//1:1 문의
	@GetMapping(value = "faqManage")
	public String faqManage(Faq faq, String currentPage, Model model) {
		System.out.println("faqManage 컨트롤러");
		int faqTotal = managerService.faqTotal();
		System.out.println("faqTotal = " + faqTotal);
		Paging paging = new Paging(faqTotal, currentPage);
		faq.setStart(paging.getStart());
		faq.setEnd(paging.getEnd());
		List<Faq> faqs = managerService.faqList();
		model.addAttribute("faqList", faqs);
		model.addAttribute("paging", paging);
		model.addAttribute("num", faqTotal);
		return "manageMja/faqManage";
	}
	
	@GetMapping(value = "faqDetail")
	public String faqDetail(int faq_num, Model model) {
		System.out.println("faqDetail 컨트롤러 시작");
		Faq faq = managerService.faqDetail(faq_num);
		model.addAttribute("faq", faq);
		return "manageMja/faqDetail";
	}
	
	@GetMapping(value = "faqAnswer")
	public String faqAnswer(Faq faq, int login_check, HttpServletRequest request, Model model) {
		System.out.println("faqAnswer 컨트롤러 시작");
		System.out.println("login_check : " + login_check);
		
		if(login_check == 0) {
			int mailResult = mailTransport(request, model, faq);
		}
		int result = managerService.faqAnswer(faq);
		if(result > 0) 	return  "redirect:faqManage";
		else 			return 	"forward:faqDetail";
	}
 
	private int mailTransport(HttpServletRequest request, Model model, Faq faq) {
		System.out.println("비회원 이메일 발송");
		String setFrom = "sajomarket@gmail.com";	//보내는 사람
		String toMail = faq.getFaq_email();
		System.out.println("faq.getEmail() " + toMail);
		String title = "[답변완료]" + faq.getFaq_subject();
		System.out.println(" title" +  title);
		String text = "안녕하세요. MarketSajo입니다. 답변이 완료되었습니다.";
		int result = 0;
		try {
			//Mime 전자 우편
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(text);
			mailSender.send(message);
			result = 1;
		} catch (Exception e) {
			System.out.println("메일 전송 오류 : "  + e.getMessage());
			result = 2;
		}
		
		return result;
	}
	
	//배너
	@RequestMapping(value = "bannerManage")
	public String bannerManage(Model model) {
		System.out.println("bannerManage 컨트롤러");
		List<Banner> banners = managerService.bannerList();
		int num = banners.size();
		model.addAttribute("banners", banners);
		model.addAttribute("num", num);
		return "manageMja/bannerManage";
	}
	
	
	@RequestMapping(value = "createBanner", method = RequestMethod.GET)
	public void createBanner() {
		System.out.println("createBanner tart");
		System.out.println();
	}
	
	@RequestMapping(value = "createBanner")
	public String createBanner(HttpServletRequest request, MultipartFile file, Banner banner, Model model) 
			throws Exception {
		System.out.println("createBanner 컨트롤러");
		String uploadPath = request.getSession().getServletContext().getRealPath("/img/");
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info("uploadPath : " + uploadPath);
		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
		logger.info("saveName :" + saveName); 
		banner.setBn_photo(saveName);
		int result = managerService.createBanner(banner);
		return "redirect:bannerManage";
	}
	
	private String uploadFile(String orignalName, byte[] fileData, String uploadPath)
			throws Exception {
		//universally unique identifier
		UUID uid = UUID.randomUUID();
		System.out.println("uploadPath : " + uploadPath);
		//directory 생성
		File fileDirectory = new File(uploadPath);
		if( !fileDirectory.exists()) {
						//makeDirectory
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		
		String saveName = uid.toString() + " " + orignalName;
		logger.info("saveName : " + saveName);
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);
		
		return saveName;
	}
 
	
	
	
	
}
