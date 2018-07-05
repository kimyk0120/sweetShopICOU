package com.sweetk.mobile.user.vo;

public class AlarmVO {
	
	//session
	private int user_seq;
	
	//alarm
	private String alarm;
	private String event;
	private String promotion;
	private String shop_news;
	private String one_qna;
	private String notice;
	private String category;
	private String alarmValue;
	
	
	//getter ,setter
	
	
	
	public int getUser_seq() {
		return user_seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAlarmValue() {
		return alarmValue;
	}
	public void setAlarmValue(String alarmValue) {
		this.alarmValue = alarmValue;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getShop_news() {
		return shop_news;
	}
	public void setShop_news(String shop_news) {
		this.shop_news = shop_news;
	}
	public String getOne_qna() {
		return one_qna;
	}
	public void setOne_qna(String one_qna) {
		this.one_qna = one_qna;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
}
