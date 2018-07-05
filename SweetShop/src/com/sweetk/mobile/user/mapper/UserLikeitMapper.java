package com.sweetk.mobile.user.mapper;

import java.util.ArrayList;

import com.sweetk.mobile.user.vo.UserPromotionVO;

public interface UserLikeitMapper {

	int selectLikeCnt(int seq);

	ArrayList<UserPromotionVO> selectLikeList(int seq, double userLat, double userLong, int page, int pageSize);
	
	
}
