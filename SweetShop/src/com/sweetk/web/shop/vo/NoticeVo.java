package com.sweetk.web.shop.vo;

import java.sql.Timestamp;

public class NoticeVo {

	String notice_seq;
	String notice_target;
	String notice_title;
	String notice_comment;
	String notice_file;
	String notice_view_count;
	Timestamp reg_date;
	Timestamp edit_date;

	public String getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(String notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_target() {
		return notice_target;
	}
	public void setNotice_target(String notice_target) {
		this.notice_target = notice_target;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_comment() {
		return notice_comment;
	}
	public void setNotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public String getNotice_view_count() {
		return notice_view_count;
	}
	public void setNotice_view_count(String notice_view_count) {
		this.notice_view_count = notice_view_count;
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
