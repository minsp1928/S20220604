package com.oracle.S20220604.dao.pms;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;

@Repository
public class MainLoginDaoImpl implements MainLoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public Member selectLogin(Member member) {//로그인
		System.out.println("MainLoginDaoImpl selectLogin start");
		
		/* return session.selectOne("pms_selectLogin", member); */
		try {
			member = session.selectOne("pms_selectLogin", member);
			System.out.println("MainLoginDaoImpl selectLogin user_id->"+member.getUser_id());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl selectLogin Exception->"+e.getMessage());
		}
		return member;
	}

	@Override
	public Member findId(Member member) { //아이디찾기
		System.out.println("MainLoginDaoImpl findId start");
		try {
			member = session.selectOne("pms_findId",member);
			System.out.println("MainLoginDaoImpl user_id->"+member.getUser_id());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl findId Exception->"+e.getMessage());
		}
		return member;
	}

	@Override
	public Member findPw(Member member) { //비밀번호 찾기
		System.out.println("MainLoginDaoImpl findPw start");
		Member m = null;
		try {
			m = session.selectOne("pms_findPw",member);
			System.out.println("MainLoginDaoImpl findPw member.getUser_pw()"+member.getUser_id());
			System.out.println("MainLoginDaoImpl findPw member.getUser_pw()"+member.getUser_pw());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl pms_findPw Exception->"+e.getMessage());
		}
		return m;
	}


	@Override
	public int updateTempPw(Member member5) { //임시비밀번호 업데이트
		System.out.println("MainLoginDaoImpl updateTempPw Start..");
		/* String tempPassword = (String) model.getAttribute("tempPassword"); -> 모델에 담기는지 궁금해서 해봤는디 잘 모르겠음*/
		int findPwUp = 0;
		try {
			System.out.println("try문에 왜 안들어오시죠?");
			System.out.println("MainLoginDaoImpl sql문전에 비번이 들어갑니까? : "+member5.getUser_pw());
			findPwUp =  session.update("pms_updateTempPw", member5);
			System.out.println("MainLoginDaoImpl 왜 비밀번호를 업데이트 못해요? 비번이 뭐에요? : "+member5.getUser_pw());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl updateTempPw Exception->"+e.getMessage());
		}
		return findPwUp;
	}

	@Override
	public Member checkId(String user_id) { //아이디 중복확인
		System.out.println("MainLoginDaoImpl checkId start..");
		
		return session.selectOne("pms_checkId", user_id);
	}

	@Override
	public void joinInsert(Member member) { //회원가입인서트
		System.out.println("MainLoginDaoImpl joinInsert start..");
		
		try {
			session.insert("pms_joinInsert",member); //인서트문이라서 리턴없음
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl joinInsert Exception->" + e.getMessage());
		}
		
		
	}

	@Override
	public void insertMember_NaverID(Member member) { //네이버 회원가입
		System.out.println("MainLoginDaoImpl insertMember_NaverID start..");
		try {
			session.insert("pms_insertMember_NaverID", member);
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl insertMember_NaverID Exception->" + e.getMessage());
		}
		
	}

	@Override
	public List<Product> productBest4list(Product product) {
		System.out.println("MainLoginDaoImpl productBest4list start..");
		List<Product> productBest4list = null;
		try {
			productBest4list = session.selectList("msProductBest4list", product);
			System.out.println("MainLoginDaoImpl productBest4list productBest4list.size()->"+productBest4list.size());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl productBest4list Exception->" + e.getMessage());

		}
		return productBest4list;
	}

	@Override
	public int total2(Product product) {
	  System.out.println("MainLoginDaoImpl total2 Start...");
      int tot = 0;
      System.out.println("try문 들어가기전에 tot 0으로 선언 "+tot);
      
      try {
    	 System.out.println("try문 들어갔을떄 "+tot);
         tot = session.selectOne("msProductTotal", product);
         System.out.println("MainLoginDaoImpl total2 tot->"+tot);
         System.out.println("try문에서 매퍼다녀옴 "+tot);
      } catch (Exception e) {
         System.out.println("MainLoginDaoImpl total2 Exception->"+e.getMessage());
      }
      return tot;
   }

	@Override
	public List<Product> productNew4list(Product product) {
		System.out.println("MainLoginDaoImpl productNew4list start..");
		List<Product> productNew4list = null;
		try {
			productNew4list = session.selectList("msProductNew4list", product);
			System.out.println("MainLoginDaoImpl productBest4list productBest4list.size()->"+productNew4list.size());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl productBest4list Exception->" + e.getMessage());

		}
		return productNew4list;
	}

	@Override
	public List<Product> BestProductlist(Product product) {
		System.out.println("MainLoginDaoImpl BestProductlist start..");
		List<Product> BestProductlist = null;
		try {
			BestProductlist = session.selectList("msProductBestAllList", product);
			System.out.println("MainLoginDaoImpl productBest4list productBest4list.size()->"+BestProductlist.size());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl productBest4list Exception->" + e.getMessage());

		}
		return BestProductlist;
	}

	@Override
	public List<Product> NewProductlist(Product product) {
		System.out.println("MainLoginDaoImpl NewProductlist start..");
		List<Product> NewProductlist = null;
		try {
			NewProductlist = session.selectList("msProductNewAllList", product);
			System.out.println("MainLoginDaoImpl NewProductlist NewProductlist.size()->"+NewProductlist.size());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl NewProductlist Exception->" + e.getMessage());

		}
		return NewProductlist;
	}

	@Override
	public List<Product> searchKeyword(Product product) {
		List<Product> searchKeyword = null;
		System.out.println("MainLoginDaoImpl searchKeyword start...");
		if (product.getKeyword() == null) product.setKeyword("%");
		//서치는 s_job/s_ename으로 들어가니까 키워드만 널값이 아니면된다?
		try {
			System.out.println("product.getSearch --> " + product.getSearch());
			System.out.println("product.getKeyword --> " + product.getKeyword());
			//keyword검색
			//Naming Rule		여러줄	   Map ID		Parameter/ 여러개를 들고오려면 DTO로 가져와야함
			searchKeyword = session.selectList("msSearchKeyword",product);//->매퍼로 이동(폴더)product.xml
			//리스트에 제네릭담아놓은 곳으로 간다   	내이름 이니셜을 넣고 테이블명, 전체, 조별로  네이밍룰을 정할것
			System.out.println("MainLoginDaoImpl searchKeyword.size()->"+searchKeyword.size());//값을 담아왔는지 확인용
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl searchKeyword Exception->"+e.getMessage());
		}
		return searchKeyword;
	}

	@Override
	public List<Banner> bannerList() {
		System.out.println("MainLoginDaoImpl bannerList 시작");
		 List<Banner> bannerList = null;
		try {
			System.out.println("bannerList try문 들어가나용");
			bannerList = session.selectList("msBannerList");
			System.out.println("bannerList try문 나가나용");
			System.out.println("MainLoginDaoImpl bannerList.size()->"+bannerList.size());//값을 담아왔는지 확인용
		} catch (Exception e2) {
			System.out.println("MainLoginDaoImpl bannerList Exception->" + e2.getMessage());
			
		}
		
		return bannerList;
	}
	
	
	
}
