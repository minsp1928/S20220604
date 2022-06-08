package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Banner;

public interface BannerDao {

	List<Banner> bannsers();

	int bannerDelete(int bn_num);

	int createBanner(Banner banner);

}
