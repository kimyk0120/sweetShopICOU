package com.sweetk.mobile.user.vo;

import java.sql.Date;

public class NoticeQnAVO {
	
	//session
	private int user_seq;
	
	// notice
	private int notice_seq;
	private String notice_target;
	private String notice_title;
	private String notice_comment;
	private int notice_view_count;
	private String notice_file;
	private Date reg_date;
	private Date edit_date;
	
	// qna
	private int qna_seq;
	private String qna_target;
	private String qna_type;
	private String qna_title;
	private String qna_comment;
	private String qna_shop_name;
	private String qna_status;
	private int top_qna_seq;
	private String qna_writer;
	private int qna_writer_seq;
	private Date qna_reg_date;
	private Date qna_edit_date;
	private int rnum;
	
	
	//getter, setter
	
	
	public int getQna_seq() {
		return qna_seq;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getQna_target() {
		return qna_target;
	}

	public void setQna_target(String qna_target) {
		this.qna_target = qna_target;
	}

	public String getQna_type() {
		return qna_type;
	}


	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}


	public String getQna_title() {
		return qna_title;
	}




	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}




	public String getQna_comment() {
		return qna_comment;
	}




	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}




	public String getQna_shop_name() {
		return qna_shop_name;
	}




	public void setQna_shop_name(String qna_shop_name) {
		this.qna_shop_name = qna_shop_name;
	}




	public String getQna_status() {
		return qna_status;
	}




	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}




	public int getTop_qna_seq() {
		return top_qna_seq;
	}




	public void setTop_qna_seq(int top_qna_seq) {
		this.top_qna_seq = top_qna_seq;
	}




	public String getQna_writer() {
		return qna_writer;
	}




	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}




	public int getQna_writer_seq() {
		return qna_writer_seq;
	}




	public void setQna_writer_seq(int qna_writer_seq) {
		this.qna_writer_seq = qna_writer_seq;
	}




	public Date getQna_reg_date() {
		return qna_reg_date;
	}




	public void setQna_reg_date(Date qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}




	public Date getQna_edit_date() {
		return qna_edit_date;
	}




	public void setQna_edit_date(Date qna_edit_date) {
		this.qna_edit_date = qna_edit_date;
	}




	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
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
	public int getNotice_view_count() {
		return notice_view_count;
	}
	public void setNotice_view_count(int notice_view_count) {
		this.notice_view_count = notice_view_count;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(Date edit_date) {
		this.edit_date = edit_date;
	}
	
}
