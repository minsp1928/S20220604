package com.oracle.S20220604.controller.pkw;

import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.service.pkw.MyPageService;


@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private MyPageService mp;
	
	
	// 마이페이지 홈화면 (구매자모드)
	@RequestMapping(value="shopperMyPage")
	public String shopperMyPage(MyPageVO mypagevo, String currentPage, Model model) {
		logger.info("MyPageController Start shopperMyPage...");

//		int total = mp.total();
//
//		System.out.println("MyPageController total=>" + total);
//		
//		model.addAttribute("total", total);
//		System.out.println("ok?");
		
//		Paging pg = new Paging(total, currentPage);
//		emp.setStart(pg.getStart());   // 시작시 1
//		emp.setEnd(pg.getEnd());       // 시작시 10 
//		List<Emp> listEmp = es.listEmp(emp); 
//		System.out.println("EmpController list listEmp.size()=>" + listEmp.size());
//		model.addAttribute("listEmp",listEmp);
//		model.addAttribute("pg",pg);
//		model.addAttribute("total", total);
		
		return "myPagePkw/shopperMyPage";
	}
	
	// 마이페이지 홈화면 (판매자모드)
	@RequestMapping(value = "makerMyPage")
	public String makerMyPage(Model model, HttpServletRequest request) {
		//수정폼을 뿌리기위한 조회
		System.out.println("makerMyPage..." );
		String id = (String) request.getSession().getAttribute("sessionId");
		Member memberMp = null;
		if (null != id && !"".equals(id)) {
			
			Member member = new Member();
			member.setUser_id(id);
			memberMp = mp.shopperMyProfile(member);
		} 
		else {
			memberMp = new Member();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		model.addAttribute("member", memberMp);
		System.out.println("memberMp : " + memberMp.toString());	
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaa"+memberMp.getM_level());
		return "myPagePkw/makerMyPage";
	}
	
	
	
	
	// 구매자모드 _주문내역
	@RequestMapping(value = "shopperOrderList")
	public String shopperOrderList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperOrderList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listShopperOrder = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listShopperOrder = mp.listShopperOrder(mypagevo);
			listSize = listShopperOrder.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperOrder = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listShopperOrder.size()" + listShopperOrder.size());
		model.addAttribute("listShopperOrder", listShopperOrder);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperOrderList";
	}
	
	// 구매자모드_주문내역_취소요청
	@RequestMapping(value="shopperOrderListCancel")
	public String shopperOrderListCancel(MyPageVO mypagevo, HttpServletRequest request, Model model) throws Exception{
		mypagevo.setPrev_order_status("1");
		mypagevo.setOrder_status("2");
		
		mp.updatePkwShopperOrderList(mypagevo);
		return "redirect:shopperOrderList";
	}
	
	// 구매자모드_주문내역_구매확정
	@RequestMapping(value="shopperOrderListOk")
	public String shopperOrderListOk(MyPageVO mypagevo, HttpServletRequest request, Model model) throws Exception{
		mypagevo.setPrev_order_status("4");
		mypagevo.setOrder_status("5");
		
		mp.updatePkwShopperOrderList(mypagevo);
		return "redirect:shopperOrderList";
	}

	
	
	// 구매자모드 _취소/환불
	@RequestMapping(value = "shopperRefundList")
	public String shopperRefundList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperRefundList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listShopperRefund = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listShopperRefund = mp.listShopperRefund(mypagevo);
			listSize = listShopperRefund.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperRefund = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listShopperRefund.size()" + listShopperRefund.size());
		model.addAttribute("listShopperRefund", listShopperRefund);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperRefundList";
		
	}
	
	// 구매자모드_구매완료
	@RequestMapping(value = "shopperPurchaseCompletedList")
	public String shopperPurchaseCompletedList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperPurchaseCompletedList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listShopperPurchaseCompleted = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listShopperPurchaseCompleted = mp.listShopperPurchaseCompleted(mypagevo);
			listSize = listShopperPurchaseCompleted.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperPurchaseCompleted = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listShopperPurchaseCompleted.size()" + listShopperPurchaseCompleted.size());
		model.addAttribute("listShopperPurchaseCompleted", listShopperPurchaseCompleted);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperPurchaseCompletedList";
	}
	
	// 구매자모드_좋아요리스트(찜하기 상품 목록)
	@RequestMapping(value = "shopperMyCheckProductList")
	public String shopperMyCheckProductList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperMyCheckProductList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listShopperMyCheckProduct = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listShopperMyCheckProduct = mp.listShopperMyCheckProduct(mypagevo);
			listSize = listShopperMyCheckProduct.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperMyCheckProduct = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listShopperMyCheckProduct.size()" + listShopperMyCheckProduct.size());
		model.addAttribute("listShopperMyCheckProduct", listShopperMyCheckProduct);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperMyCheckProductList";
	}
	
	// 구매자모드_보유쿠폰
	@RequestMapping(value = "shopperMyCouponList")
	public String shopperMyCouponList(Coupon coupon, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperMyCouponList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<Coupon> listShopperMyCoupon = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			coupon.setUser_id(ID);
			listShopperMyCoupon = mp.listShopperMyCoupon(coupon);
			listSize = listShopperMyCoupon.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperMyCoupon = new ArrayList<Coupon>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listShopperMyCoupon.size()" + listShopperMyCoupon.size());
		model.addAttribute("listShopperMyCoupon", listShopperMyCoupon);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperMyCouponList";
	}
	
	// 구매자모드_마이리뷰 리스트
	@RequestMapping(value = "shopperMyReviewList")
	public String shopperMyReviewList(Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start shopperMyReviewList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listShopperMyReview = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			MyPageVO mypagevo = new MyPageVO();
			mypagevo.setUser_id(ID);
			listShopperMyReview = mp.listShopperMyReview(mypagevo);
			listSize = listShopperMyReview.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listShopperMyReview = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		
		System.out.println("MyPageController listShopperMyReview.size()" + listShopperMyReview.size());
		model.addAttribute("listShopperMyReview", listShopperMyReview);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/shopperMyReviewList";
	}
	
	// 소비자모드_마이프로필_수정 폼
	@RequestMapping(value="shopperMyProfile")
	public String shopperMyProfile(Model model, HttpServletRequest request) {
		//수정폼을 뿌리기위한 조회
		System.out.println("EmpController Start shopperMyProfile..." );
		String id = (String) request.getSession().getAttribute("sessionId");
		Member memberMp = null;
		if (null != id && !"".equals(id)) {
			
			Member member = new Member();
			member.setUser_id(id);
			memberMp = mp.shopperMyProfile(member);
		} 
		else {
			memberMp = new Member();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		model.addAttribute("member", memberMp);
		System.out.println("memberMp : " + memberMp.toString());
		return "myPagePkw/shopperMyProfile";
	}
	
	// 소비자모드_마이프로필_저장
	@RequestMapping(value="shopperMyProfileUpdate")
	public String shopperMyProfileUpdate(Member member, HttpSession session, Model model
			, List<MultipartFile> multis, HttpServletRequest request) throws Exception{

		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start");
		logger.info("files : " + multis.toString());
		int i =0;
		for (MultipartFile multi : multis) {
			logger.info("multi.toString : " + multi.toString());
			logger.info("originalName: " + multi.getOriginalFilename());
			logger.info("size: " + multi.getSize());
			logger.info("contentType: " + multi.getContentType());
			logger.info("uploadPath : " + uploadPath);
			String savedName = uploadFile(multi.getOriginalFilename(), multi.getBytes(), uploadPath);
			logger.info("savedName: " + savedName);
			

			if (i == 0) {
				if (0 != multi.getSize()) {
					member.setUser_photo(savedName);	
				}
			}
			else {
				if (0 != multi.getSize()) {
					member.setNick_photo(savedName);	
				}
			}
//			model.addAttribute("savedName", savedName);
		}
//		logger.info("multi.toString : " + multi.toString());
//		logger.info("originalName: " + multi.getOriginalFilename());
	//	logger.info("title : " + title);
//		logger.info("size: " + multi.getSize());
//		logger.info("contentType: " + multi.getContentType());
//		logger.info("uploadPath : " + uploadPath);
//		String savedName = uploadFile(multi.getOriginalFilename(), multi.getBytes(), uploadPath);
//		logger.info("savedName: " + savedName);
//		model.addAttribute("savedName", savedName);
		
		// 수정로직 - 개인정보 저장.
		mp.updatePkwShopperMyProfile(member);
		return "redirect:shopperMyProfile";
	}
	
	private String uploadFile(String originalName, byte[] fileData, String uploadPath)
			throws Exception {
		UUID uid = UUID.randomUUID();
	//	requestPath = requestPath + "/resources/image";
		System.out.println("uploadPath->" + uploadPath);
	//	Directory 생성
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdir();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName;
		logger.info("savedName: " + savedName);
		File target = new File(uploadPath, savedName);
	//	File target = new File(requestPath, savedName);
		FileCopyUtils.copy(fileData, target);	//org.springframework.util.FileCopyUtils
		// Service ---> DAO 연결
		return savedName;
		
	}
	
	
	// 판매자모드 _주문내역
	@RequestMapping(value = "makerOrderList")
	public String makerOrderList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start makerOrderList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listMakerOrder = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listMakerOrder = mp.listMakerOrder(mypagevo);
			listSize = listMakerOrder.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listMakerOrder = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listMakerOrder.size()" + listMakerOrder.size());
		model.addAttribute("listMakerOrder", listMakerOrder);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/makerOrderList";
	}
	
	// 판매자_주문내역_출고
	@RequestMapping(value="makerOrderListOk")
	public String makerOrderListOk(MyPageVO mypagevo, HttpServletRequest request, Model model) throws Exception{
		mypagevo.setPrev_order_status("1");
		mypagevo.setOrder_status("4");
		
		mp.updatePkwMakerOrderList(mypagevo);
		return "redirect:makerOrderList";
	}
	
	// 판매자_주문내역_취소승인
	@RequestMapping(value="makerOrderListCancel")
	public String makerOrderListCancel(MyPageVO mypagevo, HttpServletRequest request, Model model) throws Exception{
		mypagevo.setPrev_order_status("2");
		mypagevo.setOrder_status("3");
		
		mp.updatePkwMakerOrderList(mypagevo);
		return "redirect:makerOrderList";
	}

	// 판매자모드_취소
	@RequestMapping(value = "makerRefundList")
	public String makerRefundList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start makerRefundList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listMakerRefund = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listMakerRefund = mp.listMakerRefund(mypagevo);
			listSize = listMakerRefund.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listMakerRefund = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listMakerRefund.size()" + listMakerRefund.size());
		model.addAttribute("listMakerRefund", listMakerRefund);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/makerRefundList";
	}
	
	// 판매자모드_완료
	@RequestMapping(value = "makerSellCompleteList")
	public String makerSellCompleteList(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start makerSellCompleteList...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> listMakerSellCompleteList = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			listMakerSellCompleteList = mp.listMakerSellCompleteList(mypagevo);
			listSize = listMakerSellCompleteList.size();
			System.out.println("######### ID : " + ID);
		}
		else {
			listMakerSellCompleteList = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController listMakerSellCompleteList.size()" + listMakerSellCompleteList.size());
		model.addAttribute("listMakerSellCompleteList", listMakerSellCompleteList);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/makerSellCompleteList";
	}
	
	// 판매자모드_마이프로필_수정 폼
	@RequestMapping(value="makerMyProfile")
	public String makerMyProfile(Model model, HttpServletRequest request) {
		System.out.println("EmpController Start makerMyProfile..." );
		String id = (String) request.getSession().getAttribute("sessionId");
		Member memberMp = null;
		List<MyPageVO> listMakerOrder = null;
		System.out.println("memberMp.id->" + id);
		if (null != id && !"".equals(id)) {
			System.out.println("memberMp.id->" + id);
			Member member = new Member();
			member.setUser_id(id);
			memberMp = mp.shopperMyProfile(member); // 개인정보

			MyPageVO mypagevo = new MyPageVO();
			mypagevo.setUser_id(id);
			listMakerOrder = mp.listMakerOrder(mypagevo); // 상품목록
			
			System.out.println("memberMp.getSellName->" + memberMp.getSell_name());
		} 
		else {
			memberMp = new Member();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}

		model.addAttribute("member", memberMp);
		model.addAttribute("listMakerOrder", listMakerOrder);
		model.addAttribute("listSize", listMakerOrder.size());
		
		return "myPagePkw/makerMyProfile";
	}
	
	
	// 판매자모드_마이프로필_저장
	@PostMapping(value="makerMyProfileUpdate")
	public String makerMyProfileUpdate(Member member, HttpServletRequest request, Model model) throws Exception{
		// 수정로직 - 개인정보 저장.
		System.out.println("member.getSellname ->" + member.getSell_name());
		System.out.println("START makerMyProfileUpdate Controller");
		String id = (String) request.getSession().getAttribute("sessionId");

		if (null != id && !"".equals(id)) {
			
			member.setUser_id(id);
			mp.updatePkwMakerMyProfile(member);
			return "redirect:makerMyProfile";
		} 
		else {
		
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}		

	}
	
	// 판매자모드_마이프로필 관리자승인요청
		@RequestMapping(value="insertChkLevelMyPage")
		public String insertChkLevelMyPage(MyPageVO mypagevo, HttpServletRequest request, Model model) throws Exception{
			int resultcnt = mp.selectChkLevelMyPage(mypagevo);
			System.out.println("mypagevo"+mypagevo.getUser_id()+"///"+resultcnt);
			mypagevo.setChk(0);
			// 권한신청 데이터가 없을때
			if (resultcnt == 0) {
				//권한신청 등록
				mp.insertChkLevelMyPage(mypagevo);

			}
			// 권한신청 데이터가 있을때
			else {
				//권한신청 수정
				mp.updateChkLevelMyPage(mypagevo);
				
			}
			
			return "redirect:makerMyProfile";
		}
		
	
/*	// 판매자모드_마이프로필 뷰 전용 페이지
	@RequestMapping(value = "makerMyProfileView")
	public String makerMyProfileView(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start makerMyProfileView...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> makerMyProfileView = null;
		List<MyPageVO> listMakerOrder = null;
		int listSize = 0;

		if (null != ID && !"".equals(ID)) {
			mypagevo.setUser_id(ID);
			makerMyProfileView = mp.makerMyProfileView(mypagevo);
			listSize = makerMyProfileView.size();
			System.out.println("######### ID : " + ID);
			
			listMakerOrder = mp.listMakerOrder(mypagevo); // 상품목록
		}
		else {
			makerMyProfileView = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController makerMyProfileView.size()" + makerMyProfileView.size());
		model.addAttribute("makerMyProfileView", makerMyProfileView);
		model.addAttribute("listMakerOrder", listMakerOrder);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/makerMyProfileView";
		
	} */
	
	// 판매자모드_마이프로필 뷰 전용 페이지
	@RequestMapping(value = "makerMyProfileView")
	public String makerMyProfileView(MyPageVO mypagevo, Model model, HttpServletRequest request) {
		System.out.println("MyPageController Start makerMyProfileView...");
		String ID = (String) request.getSession().getAttribute("sessionId");
		List<MyPageVO> makerMyProfileView = null;
		List<MyPageVO> listMakerOrder = null;
		int listSize = 0;
		System.out.println("처음들어올때 mypagevo.getUser_id : " + mypagevo.getUser_id());
		if (null != mypagevo.getUser_id() && !"".equals(mypagevo.getUser_id())) {
			makerMyProfileView = mp.makerMyProfileView(mypagevo);
			listSize = makerMyProfileView.size();
			listMakerOrder = mp.listMakerOrder(mypagevo); // 상품목록
		}
		else if (null == ID || "".equals(ID)) {
			System.out.println("######### ID : 로그인이 필요합니다.");
			return "redirect:/login";
		}
		else {
			makerMyProfileView = new ArrayList<MyPageVO>();
			System.out.println("######### ID : 판매자 선택이 안되었습니다.");
			return "redirect:/login";
		}
		System.out.println("MyPageController makerMyProfileView.size()" + makerMyProfileView.size());
		model.addAttribute("makerMyProfileView", makerMyProfileView);
		model.addAttribute("listMakerOrder", listMakerOrder);
		model.addAttribute("listSize", listSize);
		
		return "myPagePkw/makerMyProfileView";
	}

	
}
