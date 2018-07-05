package com.sweetk.web.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.sweetk.web.admin.vo.LoginVo;

public interface LoginMapper {

	public int login_check(LoginVo lvo);

	public int login_id_check(LoginVo lvo);

	public ArrayList<LoginVo> loginInfo(LoginVo lvo);

	public ArrayList<HashMap<String, String>> login_user_info(@Param("shop_seq") int shop_seq);

	public void login_update(LoginVo lvo);

	public void login_update_by_shop_seq(LoginVo lvo);

	public void groupConcatMaxLenSet(int a);

	public void login_insert(LoginVo lvo);

	public void login_delete(String id);

	public void login_delete_by_shop_seq(String id);
}
