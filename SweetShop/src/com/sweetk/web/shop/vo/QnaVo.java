package com.sweetk.web.shop.vo;

import java.sql.Timestamp;

public class QnaVo {

	String qna_seq;
	String qna_target;
	String qna_type;
	String qna_title;
	String qna_comment;
	String qna_shop_name;
	String qna_status;
	String top_qna_seq;
	String qna_writer;
	String qna_writer_seq;
	Timestamp qna_reg_date;
	Timestamp qna_edit_date;

	public String getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(String qna_seq) {
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
	public String getTop_qna_seq() {
		return top_qna_seq;
	}
	public void setTop_qna_seq(String top_qna_seq) {
		this.top_qna_seq = top_qna_seq;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_writer_seq() {
		return qna_writer_seq;
	}
	public void setQna_writer_seq(String qna_writer_seq) {
		this.qna_writer_seq = qna_writer_seq;
	}
	public Timestamp getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(Timestamp qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public Timestamp getQna_edit_date() {
		return qna_edit_date;
	}
	public void setQna_edit_date(Timestamp qna_edit_date) {
		this.qna_edit_date = qna_edit_date;
	}

}
