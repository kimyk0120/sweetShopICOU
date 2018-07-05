package com.sweetk.mobile.user.mapper;

import java.util.ArrayList;

import com.sweetk.mobile.user.vo.UserPromotionVO;

public interface UserPromotionMapper {

	int selectPromotionCnt(int seq);

	ArrayList<UserPromotionVO> selectPromotionList(int seq, double userLat, double userLong, int page, int pageSize);

	int deleteDownPromotion(int downSeq);

	UserPromotionVO selectPromotionDetail(int userSeq, double userLat, double userLong, int promotionSeq);

	void insertPromotionViewCnt(int promotionSeq, int userSeq);
	
}
