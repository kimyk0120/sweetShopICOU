package com.sweetk.mobile.api.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sweetk.mobile.api.vo.AppApiCouponVo;
import com.sweetk.mobile.api.vo.AppApiEventVo;
import com.sweetk.mobile.api.vo.AppApiShopVo;
import com.sweetk.mobile.api.vo.AppApiSiDoVo;
import com.sweetk.mobile.api.vo.AppApiSiGuGunVo;

import org.apache.ibatis.annotations.Param;

public interface AppApiMapper {

	public void user_insert(Map reqMap) ;
	public void user_update(Map reqMap) ;
	public int user_check(Map reqMap);
	public String getUserSeq(Map reqMap);
	public List<AppApiShopVo> mainShopList(Map reqMap) throws Exception;
	public List<AppApiEventVo> mainEventList(Map reqMap) throws Exception;
	public List<AppApiCouponVo> mainMyCouponList(Map reqMap) throws Exception;

	public void myCouponDelete(Map reqMap);
	public void myCouponUseDelete(Map reqMap);
	public void viewLogInsert(Map reqMap);
	public void locationInsert(Map reqMap);

	public List<AppApiSiDoVo> sidoList(Map reqMap) throws Exception;

	public List<AppApiSiGuGunVo> sigugunList(Map reqMap) throws Exception;
}
