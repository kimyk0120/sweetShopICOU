package com.sweetk.web.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.sweetk.web.admin.vo.ShopVo;

public interface ShopMapper {

	public ArrayList<HashMap<String, String>> shop_list(@Param("page_num") int page_num, @Param("page_size") int page_size ,@Param("shop_name") String shop_name ,@Param("shop_reg_number") String shop_reg_number);

	public int shop_total_count(@Param("shop_name") String shop_name ,@Param("shop_reg_number") String shop_reg_number);

	public HashMap<String, String> shop(String shop_seq);

	public ArrayList<ShopVo> shop_by_name(ShopVo shopvo);

	public int shop_reg_number_check(ShopVo shopvo);

	public int shop_name_check(String shop_name);

	public void shop_update(ShopVo shopvo);

	public void shop_insert(ShopVo shopvo);

	public void shop_delete(String shop_seq);
}
