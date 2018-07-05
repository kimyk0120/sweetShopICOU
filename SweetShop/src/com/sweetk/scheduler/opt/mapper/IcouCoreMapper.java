package com.sweetk.scheduler.opt.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.sweetk.scheduler.opt.vo.ShopTypeVO;

public interface IcouCoreMapper {
	// 
	public ArrayList<ShopTypeVO> select_hotel_char ();
	public ShopTypeVO select_hotel_char_all ();
	public ArrayList<ShopTypeVO> select_user_char ();
	public ArrayList<ShopTypeVO> select_user_taste ();
	public int select_rated_shop_count ();
	
	public void update_matching_distance(ShopTypeVO shop_type_vo);
	public void update_user_taste(ShopTypeVO shop_type_vo);
	public void insert_opt_data ();
	public void insert_zoro(Map<String, Object> map);
	
	public int select_agg_data_count ();
	public ArrayList<Double> select_agemth();
	public ArrayList<Integer> select_reviews_score();
	public ArrayList<Integer> select_reviews_idx();
	
	public void update_age_mth(int period);
	public void update_oa(double oa, int o_reviews_idx);//Map<String, Object> map);//
}
