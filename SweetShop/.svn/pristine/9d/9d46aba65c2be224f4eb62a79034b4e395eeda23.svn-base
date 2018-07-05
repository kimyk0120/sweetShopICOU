package com.sweetk.mobile.user.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sweetk.mobile.user.vo.UserEventVO;
import com.sweetk.mobile.user.vo.UserShopReviewDetailGradeVO;
import com.sweetk.mobile.user.vo.UserShopReviewGradeVO;
import com.sweetk.mobile.user.vo.UserShopReviewListVO;

public interface UserShopMapper {

	public HashMap<String, String> shop(String shopSeq,String userSeq, double userLat, double userLong);
	
	public List<UserEventVO> shopEventList(String shopSeq,String userSeq) throws Exception;

	public HashMap<String, String> shopReview(String shopSeq);

	public List<UserShopReviewGradeVO> shopReviewGrade(String shopSeq) throws Exception;

	public List<UserShopReviewDetailGradeVO> shopReviewDetail(String shopSeq) throws Exception;

	public List<UserShopReviewListVO> shopReviewList(@Param("shopSeq") int shopSeq , @Param("ord") String ord ,@Param("page") int page) throws Exception;

	public int shopReviewListCount(HashMap lMap) throws Exception;

	public void eventDownloadInsert(String eventSeq,String userSeq) throws Exception;
	
	public void eventUseInsert(String eventSeq,String userSeq) throws Exception;

	public HashMap<String, String> userInfo(String userSeq);

	public void reviewInsert(HashMap lMap) throws Exception;
	public void reviewDetailInsert(String reviewSeq,String reviewDetailType,String reviewDetailGrade) throws Exception;
	public void userInfoUpdateTemp(HashMap lMap) throws Exception;

}
