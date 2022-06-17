package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Banner;

@Repository
public class BannerDaoImpl implements BannerDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Banner> bannsers() {
		System.out.println("banners dao");
		List<Banner> banners = null;
		try {
			banners = session.selectList("mjBanners");
		} catch (Exception e) {
			System.out.println("banners Err : " + e.getMessage());
		}
		return banners;
	}

	@Override
	public int bannerDelete(int bn_num) {
		System.out.println("banner delete dao");
		int result = 0;
		try {
			result = session.delete("mjBannerDelete", bn_num);
		} catch (Exception e) {
			System.out.println("banner delete Err : " + e.getMessage());
		}
		return result;
	}

	@Override
	public int createBanner(Banner banner) {
		System.out.println("banner create dao");
		int result = 0;
		System.out.println("banner" + banner.getBn_num());
		System.out.println("banner" + banner.getBoard_num());
		System.out.println("banner" + banner.getBn_name());
		System.out.println("banner" + banner.getBn_category());
		System.out.println("banner" + banner.getBn_photo());
		try {
			result = session.insert("mjBannerCreate", banner);
		} catch (Exception e) {
			System.out.println(" createBanner Err : " + e.getMessage());
		}
		return result;
	}

}
