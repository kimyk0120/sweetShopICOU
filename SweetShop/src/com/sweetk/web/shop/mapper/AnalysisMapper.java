package com.sweetk.web.shop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface AnalysisMapper {

	public int shop_around_count(@Param("shop_seq") int shop_seq,
								 @Param("start_date") String start_date,
								 @Param("end_date") String end_date);

	public int shop_interest_count(@Param("shop_seq") int shop_seq,
								   @Param("start_date") String start_date,
								   @Param("end_date") String end_date);

	public int shop_buy_count(@Param("shop_seq") int shop_seq,
							  @Param("start_date") String start_date,
							  @Param("end_date") String end_date);

	public HashMap<String, String> shop_around_gender_chart(@Param("shop_seq") int shop_seq,
															@Param("start_date") String start_date,
															@Param("end_date") String end_date);

	public HashMap<String, String> shop_interest_gender_chart(@Param("shop_seq") int shop_seq,
															@Param("start_date") String start_date,
															@Param("end_date") String end_date);

	public HashMap<String, String> shop_buy_gender_chart(@Param("shop_seq") int shop_seq,
														@Param("start_date") String start_date,
														@Param("end_date") String end_date);

	public HashMap<String, String> shop_around_age_chart(@Param("shop_seq") int shop_seq,
														@Param("start_date") String start_date,
														@Param("end_date") String end_date);

	public HashMap<String, String> shop_interest_age_chart(@Param("shop_seq") int shop_seq,
														@Param("start_date") String start_date,
														@Param("end_date") String end_date);

	public HashMap<String, String> shop_buy_age_chart(@Param("shop_seq") int shop_seq,
													@Param("start_date") String start_date,
													@Param("end_date") String end_date);

	public int shop_review_count(@Param("shop_seq") int shop_seq,
								 @Param("start_date") String start_date,
								 @Param("end_date") String end_date);

	public float shop_review_avg(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public ArrayList<HashMap<String, String>> shop_review_avg_date(@Param("shop_seq") int shop_seq,
										@Param("start_date") String start_date,
										@Param("end_date") String end_date);

	public HashMap<String, String> shop_review_gender(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public HashMap<String, String> shop_review_age(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public HashMap<String, String> shop_review_visit(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public ArrayList<HashMap<String, String>> shop_review_visit_date(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public ArrayList<HashMap<String, String>> shop_review_visit_detail(@Param("shop_seq") int shop_seq,
									@Param("start_date") String start_date,
									@Param("end_date") String end_date);

	public ArrayList<HashMap<String, String>> shop_time_avg (@Param("shop_seq") int shop_seq,
												@Param("start_date") String start_date,
												@Param("end_date") String end_date);

	public ArrayList<HashMap<String, String>> shop_date_avg (@Param("shop_seq") int shop_seq,
												@Param("start_date") String start_date,
												@Param("end_date") String end_date);

	public HashMap<String, String> event_status (@Param("shop_seq") int shop_seq,
												@Param("start_date") String start_date,
												@Param("end_date") String end_date);
	public HashMap<String, String> event_count (@Param("shop_seq") int shop_seq,
															@Param("start_date") String start_date,
															@Param("end_date") String end_date);
	public HashMap<String, String> promotion_count (@Param("shop_seq") int shop_seq,
																@Param("start_date") String start_date,
																@Param("end_date") String end_date);
}
