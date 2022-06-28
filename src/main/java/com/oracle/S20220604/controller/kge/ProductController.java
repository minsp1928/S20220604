package com.oracle.S20220604.controller.kge;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;
import com.oracle.S20220604.model.Review;
import com.oracle.S20220604.service.kge.Paging;
import com.oracle.S20220604.service.kge.ProductService;

@Controller
public class ProductController {
   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
   
   @Autowired
   private ProductService ps;
   // 내 상품 목록    
   @RequestMapping(value = "/myProductList")
   public String myProductList(HttpServletRequest request, Product product, Model model) {
      System.out.println("[ProductController myProductList] Start...");
      
      String user_id = request.getSession().getAttribute("sessionId").toString();
      List<Product> listMyProduct = ps.listMyProduct(user_id);
      System.out.println("[ProductController myProductList] listMyProduct.size()" + listMyProduct.size());
      int listSize = listMyProduct.size();
      model.addAttribute("listMyProduct", listMyProduct);
      model.addAttribute("listSize"     , listSize);
      return "productKge/myProductList";
   }
   
//   상품 등록 시작하기(대분류 get)
   @GetMapping(value = "/productBoardWriteForm")
   public String productBoardWriteForm(HttpServletRequest request, Product product, Member member, Model model) {
      System.out.println("[ProductController productBoardWriteForm] Start...");
      
      //대분류만 Get
      List<Product_Info> proInfoTy1List = ps.proinfoSelect();
      for(Product_Info product_Info : proInfoTy1List) {
         System.out.println("[ProductController productBoardWriteForm product_Info.getPro_type1-->"+product_Info.getPro_type1());
         System.out.println("[ProductController productBoardWriteForm product_Info.getPro_content-->"+product_Info.getPro_content());
         
      }
      System.out.println("[ProductController productBoardWriteForm] proInfoTy1List.size->"+proInfoTy1List.size());
      model.addAttribute("proInfoTy1List", proInfoTy1List);
      return "productKge/productBoardWrite";
   }
   
//   중분류 get(아작스 사용)
   @ResponseBody // 아작스 사용하려면 이걸 걸어줘야 한다.
   @RequestMapping(value = "/type2")
   public List<Product_Info> type2(int pro_type1) {
      System.out.println("[ProductController type2] Start...");
      List<Product_Info> protype2List = ps.type2Select(pro_type1);
      for(Product_Info product_Info2 : protype2List) {
         System.out.println("[ProductController productBoardWrite product_Info2.getPro_type2-->"+product_Info2.getPro_type2());
         System.out.println("[ProductController productBoardWrite product_Info2.getPro_content-->"+product_Info2.getPro_content());
      }
      System.out.println("[ProductController type2 protype2List.size()->]"+protype2List.size());
      return protype2List;
   }
   
//   상품 등록하기
   @RequestMapping(value = "productWrite", method=RequestMethod.POST)
   public String productWrite(HttpServletRequest  request,  MultipartFile pro_photoImg, MultipartFile pro_picImg, Product product, Model model, String user_id) 
      throws Exception {
      
      System.out.println("[ProductController productWrite] Start...");
      String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
      
      user_id = request.getSession().getAttribute("sessionId").toString();
      
      // 가져온 사진 파일에 관한 것
      logger.info("originalName: " + pro_photoImg.getOriginalFilename());
      logger.info("size: " + pro_photoImg.getSize());
      logger.info("contentType: " + pro_photoImg.getContentType());
      logger.info("uploadPath: " + uploadPath);
      
      String savedPro_photo = uploadFile(pro_photoImg.getOriginalFilename(), pro_photoImg.getBytes(), uploadPath);
      String savedPro_pic = uploadFile(pro_picImg.getOriginalFilename(), pro_picImg.getBytes(), uploadPath);
      
      product.setUser_id(user_id);
      product.setPro_photo(savedPro_photo);
      product.setPro_pic(savedPro_pic);
      
      System.out.println("[ProductController productWrite] product.getUser_id()->"+product.getUser_id());
      System.out.println("[ProductController productWrite] product.getPro_num()->"+product.getPro_num());
      System.out.println("[ProductController productWrite] product.getPro_title()->"+product.getPro_title());
      System.out.println("[ProductController productWrite] product.getPro_price()->"+product.getPro_price());
      System.out.println("[ProductController productWrite] product.getPro_type1()->"+product.getPro_type1());
      System.out.println("[ProductController productWrite] product.getPro_type2()->"+product.getPro_type2());
      System.out.println("[ProductController productWrite] product.getPro_write()->"+product.getPro_write());
      System.out.println("[ProductController productWrite] product.getPro_photo()->"+product.getPro_photo());
      System.out.println("[ProductController productWrite] product.getPro_pic()->"+product.getPro_pic());
      System.out.println("[ProductController productWrite] product.getAmount()->"+product.getAmount());
      
      //사진 제외한 DB에 넣을 정보들 logic
      int result = ps.productInsert(product);
      if (result > 0) return "redirect:myProductList";
      else {
         model.addAttribute("msg", "입력 실패 확인해 보세요");
         return "productBoardWriteForm";
      }
   }
   
//   UUID 만들기
   private String uploadFile(String originalName, byte[] fileData , String uploadPath) throws Exception {
         System.out.println("[ProductController uploadFile] Start...");
         
         // universally unique identifier 
           UUID uid = UUID.randomUUID();
         // requestPath = requestPath + "/resources/image";
          System.out.println("uploadPath->"+uploadPath);
          // Directory 생성 
         File fileDirectory = new File(uploadPath);
         if (!fileDirectory.exists()) {
            fileDirectory.mkdirs();
            System.out.println("업로드용 폴더 생성 : " + uploadPath);
         }

          String savedName = uid.toString() + "_" + originalName;
          logger.info("savedName: " + savedName);
          File target = new File(uploadPath, savedName);
//          File target = new File(requestPath, savedName);
          FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
          // Service ---> DAO 연결 
          return savedName;
   }
   
//   상품 삭제하기(아작스 사용)(pro_Status 변경)
   @ResponseBody
   @RequestMapping(value = "ProductDelete")
   public String ProductDelete(int pro_num) {
      System.out.println("[ProductController ProductDelete] Start...");
      System.out.println("[ProductController ProductDelete] pro_num->"+pro_num);
      int deleteProduct = ps.delete(pro_num);
      String deleteProductStr = Integer.toString(deleteProduct);
      return deleteProductStr;
   }
//   상품 목록 리스트 (대분류 번호에 따른)-->얘를 호출할 떄 pro_type1 + pro_type2 (from 민서)
   @GetMapping(value = "/productBoard")
   public String productList(Product product, String currentPage, Model model) {
      System.out.println("[ProductController productList] Start...");
      System.out.println("currentPage -> "+currentPage);
      // 상품 목록 리스트 - 상품 갯수
      int total = ps.total(product);
      int pro_type1 = 0;
      Paging pg = new Paging(total, currentPage);
      product.setStart(pg.getStart());
      product.setEnd(pg.getEnd());
      
      System.out.println("pg.getStart"+pg.getStart());
      System.out.println("product.getStart"+product.getStart());
      
      // 상품 목록 리스트 - 상품 목록
      List<Product> listProduct = ps.listProduct(product);
      
      System.out.println("[ProductController productList] kkk listProduct.size()-->" + listProduct.size());
      for(Product product2 : listProduct) {
         System.out.println("[ProductController productList]  product2.getPro_type1()-->" + product2.getPro_type1());
         System.out.println("[ProductController productList]  product2.getPro_type2()-->" + product2.getPro_type2());

      }
      if  ( listProduct.size() > 0 ) pro_type1 = listProduct.get(0).getPro_type1();
      model.addAttribute("pro_type1", pro_type1);
      model.addAttribute("product", product);
      model.addAttribute("listProduct", listProduct);
      model.addAttribute("pg", pg);
      model.addAttribute("total", total);
      return "productKge/productBoard";
   }
   
//   상품 상세 페이지(Product 테이블 전체 + Basket 테이블 전체 + Member 테이블 일부)
   @RequestMapping(value = "/productDetails")
   public String productDetails(int pro_num, Model model, HttpServletRequest request) {
      System.out.println("[ProductController productDetails] Start...");
      System.out.println("[ProductController productDetails] pro_num..."+pro_num);
//      String user_id = request.getSession().getAttribute("sessionId").toString();
      System.out.println("[ProductController productDetails] pro_num..22."+pro_num);
      //String user_id = null;
      
      //-->리뷰 관련(시환)
      int CheckUser = 0;
      int CountPersonalReview = 0;
      int CountBuy = 0;
      Review review = new Review();
      List<Review> SearchforUpdate = new ArrayList<Review>(); // <-- 리뷰 관련(시환)
      
      //-->review(시환)
      if(request.getSession().getAttribute("sessionId") != null) {
         String user_id = request.getSession().getAttribute("sessionId").toString();
      
         CheckUser = 1;
         review.setPro_num(pro_num);
         review.setUser_id(user_id);
         
         CountPersonalReview = ps.CountPersonalReview(review);
         CountBuy = ps.CountBuy(review);
         System.out.println("[ProductController productDetails] CountPersonalReview->"+CountPersonalReview);
         SearchforUpdate = ps.SearchforUpdate(review);
         model.addAttribute("user_id", user_id);
      }else {
         CheckUser = 0;
      }
      
//      user_id = "namwoo";
      
      System.out.println("ProductController productDetails pro_num : "+ pro_num);
      List<Review> searchReview = ps.SearchReview(pro_num);
      int reviewCount = searchReview.size();
      List<String> memberPic = new ArrayList<String>();
      memberPic = ps.SearchMbPic(pro_num);
      //<--review(시환)
      
      
      Product product = ps.detail(pro_num);
      System.out.println("[ProductController productDetails after] product->"+product.getPro_pic());
      System.out.println("ProductController productDetails product : "+ product.getPro_title());
      System.out.println("ProductController productDetails product : "+ product.getPro_photo());
      System.out.println("ProductController productDetails CountPersonalReview : "+ CountPersonalReview);
      
      model.addAttribute("product", product);
      
      
      //--> review(시환)
      model.addAttribute("CountBuy", CountBuy);
      model.addAttribute("memberPic", memberPic);
      model.addAttribute("SearchforUpdate", SearchforUpdate);
      model.addAttribute("CheckUser", CheckUser);
      model.addAttribute("CountPersonalReview", CountPersonalReview);
      model.addAttribute("pro_num", pro_num);
      model.addAttribute("reviewCount", reviewCount);
      model.addAttribute("searchReview", searchReview);
      //<--review(시환)
      return "productKge/productDetails";
      
   }
   
//   상품 수정하기 시작
   @RequestMapping(value = "/productModifyForm")
   public String productModifyForm(int pro_num, Model model) {
      System.out.println("[ProductController productModifyForm] Start..");
      Product product = ps.detail(pro_num);
      System.out.println("[ProductController productModifyForm] getPro_title->"+product.getPro_title());
      System.out.println("[ProductController productModifyForm] getPro_price->"+product.getPro_price());
      model.addAttribute("product", product);
      return "productKge/productBoardModify";
   }
   
   
//   check_Product(위시리스트)에 상품 넣기
   @ResponseBody // 아작스 사용하려면 이걸 걸어줘야 한다.
   @RequestMapping(value = "/inputCheckProduct")
   public int inputCheckProduct(Product product) {
      System.out.println("[ProductController inputCheckProduct] Start...");
      System.out.println("[ProductController inputCheckProduct] user_id->"+product.getUser_id());
      System.out.println("[ProductController inputCheckProduct] user_id->"+product.getPro_num());
      
      int inCheck = ps.inCheck(product);
      System.out.println("[ProductController inputCheckProduct] inCheck->"+inCheck);
      
      return inCheck;
   }
   
//   상품 수정페이지에서 중분류 get(아작스 사용)
   @ResponseBody // 아작스 사용하려면 이걸 걸어줘야 한다.
   @RequestMapping(value = "/modifyType2")
   public List<Product_Info> modifyType2(int pro_type1) {
      System.out.println("[ProductController type2] Start...");
      List<Product_Info> modifyProtype2List = ps.type2Select(pro_type1);
      for(Product_Info product_Info2 : modifyProtype2List) {
         System.out.println("[ProductController productBoardWrite product_Info2.getPro_type2-->"+product_Info2.getPro_type2());
         System.out.println("[ProductController productBoardWrite product_Info2.getPro_content-->"+product_Info2.getPro_content());
      }
      System.out.println("[ProductController type2 protype2List.size()->]"+modifyProtype2List.size());
      return modifyProtype2List;
   }
   
//   수정한 상품 db에 insert 하기
   @RequestMapping(value = "ModifyProduct", method=RequestMethod.POST)
   public String ModifyProduct(HttpServletRequest  request,  MultipartFile pro_photoImg, MultipartFile pro_picImg, Product product, Model model) 
      throws Exception {
      
      System.out.println("[ProductController ModifyProduct] Start...");
      String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
      
      String user_id="lover27"; // 하드 코딩용
      // 가져온 사진 파일에 관한 것
      logger.info("originalName: " + pro_photoImg.getOriginalFilename());
      logger.info("size: " + pro_photoImg.getSize());
      logger.info("contentType: " + pro_photoImg.getContentType());
      logger.info("uploadPath: " + uploadPath);
      
      String savedPro_photo = uploadFile(pro_photoImg.getOriginalFilename(), pro_photoImg.getBytes(), uploadPath);
      String savedPro_pic = uploadFile(pro_picImg.getOriginalFilename(), pro_picImg.getBytes(), uploadPath);
      
//      request.getSession().setAttribute("sessionId", user_id);
      
//      String user_id = request.getSession().getAttribute("sessionId").toString(); // 세션에서 아이디 가져오기
      product.setUser_id(user_id);
      product.setPro_photo(savedPro_photo);
      product.setPro_pic(savedPro_pic);
      
      System.out.println("[ProductController ModifyProduct] product.getUser_id()->"+product.getUser_id());
      System.out.println("[ProductController ModifyProduct] product.getPro_num()->"+product.getPro_num());
      System.out.println("[ProductController ModifyProduct] product.getPro_title()->"+product.getPro_title());
      System.out.println("[ProductController ModifyProduct] product.getPro_price()->"+product.getPro_price());
      System.out.println("[ProductController ModifyProduct] product.getPro_type1()->"+product.getPro_type1());
      System.out.println("[ProductController ModifyProduct] product.getPro_type2()->"+product.getPro_type2());
      System.out.println("[ProductController ModifyProduct] product.getPro_write()->"+product.getPro_write());
      System.out.println("[ProductController ModifyProduct] product.getPro_photo()->"+product.getPro_photo());
      System.out.println("[ProductController ModifyProduct] product.getPro_pic()->"+product.getPro_pic());
      System.out.println("[ProductController ModifyProduct] product.getAmount()->"+product.getAmount());
      
      //사진 제외한 DB에 넣을 정보들 logic
      int result = ps.productUpdate(product);
      if (result > 0) return "forward:myProductList";
      else {
         model.addAttribute("msg", "입력 실패 확인해 보세요");
         return "redirect/productModifyForm";
      }
   }
   
//   장바구니 추가하기(메인 장바구니에 user_id가 있는지 확인하는 logic)
   @ResponseBody // 아작스 사용하려면 이걸 걸어줘야 한다.
   @RequestMapping(value = "/inputBasket")
   public int inputBasket(Product product) {
      int insertBasket =0;
      System.out.println("[ProductController inputBasket] Start...");
      
      System.out.println("[ProductController inputBasket] product.getUser_id()"+product.getUser_id());
      System.out.println("[ProductController inputBasket] product.getPro_num()"+product.getPro_num());
      System.out.println("[ProductController inputBasket] product.getQuantity()"+product.getQuantity());
      
      //Main_basket에 user_id가 존재하면 해당 장바구니 번호 받아오기
      int mBasket = ps.basketMain(product);
      System.out.println("[ProductController inputBasket] mBasket->"+mBasket);
      
      if (mBasket > 0) { // 장바구니 번호 받아왔으면, 장바구니 안에 상품 넣기
         System.out.println("[ProductController inputBasket] Start...");
         product.setBasket_num(mBasket);
         insertBasket = ps.basketInsert(product);
         System.out.println("[ProductController inputBasket] productBasket->"+insertBasket);
      } 
      else { // main_basket 만들고, basket에 상품 넣는 로직
         System.out.println("[ProductController inputBasket] Create Main_basket & Insert Basket Start...");
         insertBasket = ps.createPut(product);
      }
      return insertBasket;
   }
   
//   상품 목록을 최신순에 맞혀서 정렬하기 logic
   @RequestMapping(value = "/changeAllignmentNewest")
   public String changeAllignmentNewest(Product product, String currentPage, Model model) {
      System.out.println("[ProductController changeAllignmentNewest] Start...");
      System.out.println("[ProductController changeAllignmentNewest] product.getPro_type1()" + product.getPro_type1());
      System.out.println("[ProductController changeAllignmentNewest] product.getPro_type2()" + product.getPro_type2());
      
      
      // 상품 목록 리스트 - 상품 갯수
      int total = ps.total(product);
      int pro_type1 = 0;
      Paging pg = new Paging(total, currentPage);
      product.setStart(pg.getStart());
      product.setEnd(pg.getEnd());
      
      // 상품 목록 리스트 - 상품 목록(최신순 정렬)
      List<Product> listProductNewest = ps.listProductNewest(product);
      
      System.out.println("[ProductController productList] kkk listProductNewest.size()-->" + listProductNewest.size());
      for(Product product2 : listProductNewest) {
         System.out.println("[ProductController productList]  product2.getPro_type1()-->" + product2.getPro_type1());
         System.out.println("[ProductController productList]  product2.getPro_type2()-->" + product2.getPro_type2());

      }
      if  ( listProductNewest.size() > 0 ) pro_type1 = listProductNewest.get(0).getPro_type1();
      model.addAttribute("pro_type1", pro_type1);
      model.addAttribute("product", product);
      model.addAttribute("listProduct", listProductNewest);
      model.addAttribute("pg", pg);
      model.addAttribute("total", total);
      return "productKge/productBoard";
      
   }
   
//   상품 목록을 최저가순에 맞혀서 정렬하기 logic
   @RequestMapping(value = "/changeAllignmentLowest")
   public String changeAllignmentLowest(Product product, String currentPage, Model model) {
      System.out.println("[ProductController changeAllignmentLowest] Start...");
      System.out.println("[ProductController changeAllignmentLowest] product.getPro_type1()" + product.getPro_type1());
      System.out.println("[ProductController changeAllignmentLowest] product.getPro_type2()" + product.getPro_type2());
      
      
      // 상품 목록 리스트 - 상품 갯수
      int total = ps.total(product);
      int pro_type1 = 0;
      Paging pg = new Paging(total, currentPage);
      product.setStart(pg.getStart());
      product.setEnd(pg.getEnd());
      
      // 상품 목록 리스트 - 상품 목록(최저가순 정렬)
      List<Product> listProductLowest = ps.listProductLowest(product);
      
      System.out.println("[ProductController productList] kkk changeAllignmentLowest.size()-->" + listProductLowest.size());
      for(Product product2 : listProductLowest) {
         System.out.println("[ProductController productList]  product2.getPro_type1()-->" + product2.getPro_type1());
         System.out.println("[ProductController productList]  product2.getPro_type2()-->" + product2.getPro_type2());

      }
      if  ( listProductLowest.size() > 0 ) pro_type1 = listProductLowest.get(0).getPro_type1();
      model.addAttribute("pro_type1", pro_type1);
      model.addAttribute("product", product);
      model.addAttribute("listProduct", listProductLowest);
      model.addAttribute("pg", pg);
      model.addAttribute("total", total);
      return "productKge/productBoard";
   }
   
//   상품 목록을 최고가순에 맞혀서 정렬하기 logic
   @RequestMapping(value = "/changeAllignmentHighest")
   public String changeAllignmentHighest(Product product, String currentPage, Model model) {
      System.out.println("[ProductController changeAllignmentHighest] Start...");
      System.out.println("[ProductController changeAllignmentHighest] product.getPro_type1()" + product.getPro_type1());
      System.out.println("[ProductController changeAllignmentHighest] product.getPro_type2()" + product.getPro_type2());
      
      
      // 상품 목록 리스트 - 상품 갯수
      int total = ps.total(product);
      int pro_type1 = 0;
      Paging pg = new Paging(total, currentPage);
      product.setStart(pg.getStart());
      product.setEnd(pg.getEnd());
      
      // 상품 목록 리스트 - 상품 목록(최고가순에 정렬)
      List<Product> listProductHighest = ps.listProductHighest(product);
      
      System.out.println("[ProductController productList] kkk changeAllignmentLowest.size()-->" + listProductHighest.size());
      for(Product product2 : listProductHighest) {
         System.out.println("[ProductController changeAllignmentHighest]  product2.getPro_type1()-->" + product2.getPro_type1());
         System.out.println("[ProductController changeAllignmentHighest]  product2.getPro_type2()-->" + product2.getPro_type2());

      }
      if  ( listProductHighest.size() > 0 ) pro_type1 = listProductHighest.get(0).getPro_type1();
      model.addAttribute("pro_type1", pro_type1);
      model.addAttribute("product", product);
      model.addAttribute("listProduct", listProductHighest);
      model.addAttribute("pg", pg);
      model.addAttribute("total", total);
      return "productKge/productBoard";
   }
   
   //리뷰 삭제
      @RequestMapping(value="DeleteReview", method = RequestMethod.POST)
      public String DeleteReview(Review review, Model model){
         System.out.println("DeleteReview start..");
         
         int DeleteReview = ps.DeleteReview(review);
         
         return "forward:/productDetails";
      }
      
      // review insertForm(시환)
      @RequestMapping(value = "insertForm", method = RequestMethod.POST)
        public String uploadForm( HttpServletRequest request, MultipartFile file, Review review, Model model) 
              throws Exception {
         String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
         
         System.out.println("uploadForm POST Start");
         logger.info("originalName: " + file.getOriginalFilename());
          logger.info("size: " + file.getSize());
          logger.info("contentType: " + file.getContentType());
          logger.info("uploadPath: " + uploadPath);
          String savedName1 = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
          logger.info("savedName1: " + savedName1);
          review.setRe_pic(savedName1);
          ps.ReviewInsert(review);
          return "forward:/productDetails";
        }    

        private String uploadFile1(String originalName, byte[] fileData , String uploadPath) 
              throws Exception {
          // universally unique identifier 
           UUID uid = UUID.randomUUID();
         // requestPath = requestPath + "/resources/image";
          System.out.println("uploadPath->"+uploadPath);
          // Directory 생성 
         File fileDirectory = new File(uploadPath);
         if (!fileDirectory.exists()) {
            fileDirectory.mkdirs();
            System.out.println("업로드용 폴더 생성 : " + uploadPath);
         }

          String savedName = uid.toString() + "_" + originalName;
          logger.info("savedName: " + savedName);
          File target = new File(uploadPath, savedName);
//          File target = new File(requestPath, savedName);
          FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
          // Service ---> DAO 연결 
          return savedName;
        }   
        
        // review updateForm(시환)
        @RequestMapping(value = "updateForm", method = RequestMethod.POST)
        public String uploadForm2(HttpServletRequest request, MultipartFile file, Review review, Model model) 
              throws Exception {
         String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
         
         System.out.println("uploadForm POST Start");
         logger.info("originalName: " + file.getOriginalFilename());
          logger.info("size: " + file.getSize());
          logger.info("contentType: " + file.getContentType());
          logger.info("uploadPath: " + uploadPath);
          String savedName1 = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
          logger.info("savedName1: " + savedName1);
          if(file.getSize() == 0) {
              ps.ReviewUpdate(review);
           }else {
              review.setRe_pic(savedName1);
               ps.ReviewUpdate(review);
           }
          return "forward:/productDetails";
        }    

        private String uploadFile2(String originalName, byte[] fileData , String uploadPath) 
              throws Exception {
          // universally unique identifier 
           UUID uid = UUID.randomUUID();
         // requestPath = requestPath + "/resources/image";
          System.out.println("uploadPath->"+uploadPath);
          // Directory 생성 
         File fileDirectory = new File(uploadPath);
         if (!fileDirectory.exists()) {
            fileDirectory.mkdirs();
            System.out.println("업로드용 폴더 생성 : " + uploadPath);
         }

          String savedName = uid.toString() + "_" + originalName;
          logger.info("savedName: " + savedName);
          File target = new File(uploadPath, savedName);
//          File target = new File(requestPath, savedName);
          FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
          // Service ---> DAO 연결 
          return savedName;
        }   
   }

		
	



		


	





















	

