package com.sweetk.web.shop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.sweetk.web.shop.vo.ShopEventVo;
import com.sweetk.web.shop.vo.EventImgVo;


public interface EventMapper {

	public ArrayList<HashMap<String, String>> event_list(@Param("page_num") int page_num,
											 @Param("page_size") int page_size ,
											 @Param("shop_seq") int shop_seq ,
											 @Param("start_date") String start_date ,
											 @Param("end_date") String end_date ,
											 @Param("event_name") String event_name );

	public int event_count(@Param("shop_seq") int shop_seq,
			 			   @Param("start_date") String start_date,
			 			   @Param("end_date") String end_date,
						   @Param("event_name") String event_name);

	public HashMap<String, String> shop(int shop_seq);

	public HashMap<String, String> event(int event_seq);

	public int event_insert(ShopEventVo sev);

	public void event_img_insert(EventImgVo eiv);

	public void event_img_delete(int event_seq);

	public ArrayList<HashMap<String, String>> event_img_list(int event_seq);

	public void event_update(ShopEventVo sev);

	public int event_view_count(@Param("event_seq") int event_seq);

	public int event_down_count(@Param("event_seq") int event_seq);

	public int event_use_count(@Param("event_seq") int event_seq);

	public ArrayList<HashMap<String, String>> event_date_chart(@Param("event_seq") int event_seq);

	public ArrayList<HashMap<String, String>> event_time_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_view_gender_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_down_gender_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_use_gender_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_view_age_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_down_age_chart(@Param("event_seq") int event_seq);

	public HashMap<String, String> event_use_age_chart(@Param("event_seq") int event_seq);

	public void event_delete(int seq);
}
