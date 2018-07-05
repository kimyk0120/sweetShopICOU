package com.sweetk.web.shop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.sweetk.web.admin.vo.ShopVo;
import com.sweetk.web.shop.vo.ShopCardVo;
import com.sweetk.web.shop.vo.ShopPromotionVo;


public interface PromotionMapper {

	public ArrayList<HashMap<String, String>> promotion_list(@Param("page_num") int page_num,
													 @Param("page_size") int page_size ,
													 @Param("shop_seq") int shop_seq ,
													 @Param("start_date") String start_date ,
													 @Param("end_date") String end_date ,
													 @Param("promotion_name") String promotion_name );

	public int promotion_count(@Param("shop_seq") int shop_seq,
							   @Param("start_date") String start_date,
							   @Param("end_date") String end_date,
							   @Param("promotion_name") String promotion_name);

	public HashMap<String, String> shop(int shop_seq);

	public HashMap<String, String> promotion(int promotion_seq);

	public void promotion_insert(ShopPromotionVo spv);

	public void promotion_update(ShopPromotionVo spv);

	public String getPromotionSeq(ShopPromotionVo spv);

	public void shop_card_insert(ShopCardVo scv);

	public void shop_card_update(ShopCardVo scv);

	public HashMap<String, String> shop_card(int shop_seq);

	public int promotion_view_count(@Param("promotion_seq") int promotion_seq);

	public int promotion_down_count(@Param("promotion_seq") int promotion_seq);

	public ArrayList<HashMap<String, String>> promotion_date_chart(@Param("promotion_seq") int promotion_seq);

	public ArrayList<HashMap<String, String>> promotion_time_chart(@Param("promotion_seq") int promotion_seq);

	public HashMap<String, String> promotion_view_gender_chart(@Param("promotion_seq") int promotion_seq);

	public HashMap<String, String> promotion_down_gender_chart(@Param("promotion_seq") int promotion_seq);

	public HashMap<String, String> promotion_view_age_chart(@Param("promotion_seq") int promotion_seq);

	public HashMap<String, String> promotion_down_age_chart(@Param("promotion_seq") int promotion_seq);

	public ArrayList<HashMap<String, String>> getPushPromotionUserList();

}
