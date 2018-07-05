package com.sweetk.scheduler.opt.vo;

public class OZoroVO {
	public int o_reviews_idx = 0;
	public int o_shop_idx = 0;
	public int o_user_idx = 0;
	public int o_user_review_count = 0;//유저별 전체리뷰등록 건수
	public int visit_type = 0;//방문유형
	public float score = 0;
	public int write_date = 0;//2000.01.01 기준으로 날자 차이
	public int o_elit = 0;//용도 모름..
	public int o_age = 0;//용도 모름..
	public double o_avg = 0.0;
	

	public double getO_avg() {
		return o_avg;
	}

	public void setO_avg(double o_avg) {
		this.o_avg = o_avg;
	}

	public int getO_reviews_idx() {
		return o_reviews_idx;
	}

	public void setO_reviews_idx(int o_reviews_idx) {
		this.o_reviews_idx = o_reviews_idx;
	}

	public int getO_shop_idx() {
		return o_shop_idx;
	}

	public void setO_shop_idx(int o_shop_idx) {
		this.o_shop_idx = o_shop_idx;
	}

	public int getO_user_idx() {
		return o_user_idx;
	}

	public void setO_user_idx(int o_user_idx) {
		this.o_user_idx = o_user_idx;
	}

	public int getO_user_review_count() {
		return o_user_review_count;
	}

	public void setO_user_review_count(int o_user_review_count) {
		this.o_user_review_count = o_user_review_count;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getWrite_date() {
		return write_date;
	}

	public void setWrite_date(int write_date) {
		this.write_date = write_date;
	}

	public int getVisit_type() {
		return visit_type;
	}

	public void setVisit_type(int visit_type) {
		this.visit_type = visit_type;
	}

	public int getO_elit() {
		return o_elit;
	}

	public void setO_elit(int o_elit) {
		this.o_elit = o_elit;
	}

	public int getO_age() {
		return o_age;
	}

	public void setO_age(int o_age) {
		this.o_age = o_age;
	}

}
