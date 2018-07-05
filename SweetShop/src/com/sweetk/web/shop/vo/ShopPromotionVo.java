package com.sweetk.web.shop.vo;

import java.sql.Timestamp;

public class ShopPromotionVo {

	String promotion_seq;
	String shop_seq;
	String promotion_detail_desc;
	String promotion_start_day;
	String promotion_end_day;
	String promotion_status;
	String img_path;
	String img_file_name;
	String img_org_name;
	Timestamp reg_date;
	Timestamp edit_date;

	public String getPromotion_seq() {
		return promotion_seq;
	}
	public void setPromotion_seq(String promotion_seq) {
		this.promotion_seq = promotion_seq;
	}
	public String getShop_seq() {
		return shop_seq;
	}
	public void setShop_seq(String shop_seq) {
		this.shop_seq = shop_seq;
	}
	public String getPromotion_detail_desc() {
		return promotion_detail_desc;
	}
	public void setPromotion_detail_desc(String promotion_detail_desc) {
		this.promotion_detail_desc = promotion_detail_desc;
	}
	public String getPromotion_start_day() {
		return promotion_start_day;
	}
	public void setPromotion_start_day(String promotion_start_day) {
		this.promotion_start_day = promotion_start_day;
	}
	public String getPromotion_end_day() {
		return promotion_end_day;
	}
	public void setPromotion_end_day(String promotion_end_day) {
		this.promotion_end_day = promotion_end_day;
	}
	public String getPromotion_status() {
		return promotion_status;
	}
	public void setPromotion_status(String promotion_status) {
		this.promotion_status = promotion_status;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getImg_file_name() {
		return img_file_name;
	}
	public void setImg_file_name(String img_file_name) {
		this.img_file_name = img_file_name;
	}
	public String getImg_org_name() {
		return img_org_name;
	}
	public void setImg_org_name(String img_org_name) {
		this.img_org_name = img_org_name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(Timestamp edit_date) {
		this.edit_date = edit_date;
	}

}
