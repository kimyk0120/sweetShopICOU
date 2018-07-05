package com.sweetk.scheduler.opt.vo;

public class ReviewVO {
	private int userSeq = 0;
	private int shopSeq = 0;
	private String reviewDate = "";
	private float reviewGrade = 0.0f;
	private String reviewVisitType = "";
	private String reviewVisitDate = "";
	private String reviewTitle = "";
	private String reviewComment = "";
	private float reviewDetailGrade1 = 0.0f;
	private float reviewDetailGrade2 = 0.0f;
	private float reviewDetailGrade3 = 0.0f;
	private float reviewDetailGrade4 = 0.0f;
	private float reviewDetailGrade5 = 0.0f;
	private float reviewDetailGrade6 = 0.0f;
	private String writerGender = "";
	private String writerYear = "";
	
	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(int shopSeq) {
		this.shopSeq = shopSeq;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public float getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(float reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public String getReviewVisitType() {
		return reviewVisitType;
	}

	public void setReviewVisitType(String reviewVisitType) {
		this.reviewVisitType = reviewVisitType;
	}

	public String getReviewVisitDate() {
		return reviewVisitDate;
	}

	public void setReviewVisitDate(String reviewVisitDate) {
		this.reviewVisitDate = reviewVisitDate;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public float getReviewDetailGrade1() {
		return reviewDetailGrade1;
	}

	public void setReviewDetailGrade1(float reviewDetailGrade1) {
		this.reviewDetailGrade1 = reviewDetailGrade1;
	}

	public float getReviewDetailGrade2() {
		return reviewDetailGrade2;
	}

	public void setReviewDetailGrade2(float reviewDetailGrade2) {
		this.reviewDetailGrade2 = reviewDetailGrade2;
	}

	public float getReviewDetailGrade3() {
		return reviewDetailGrade3;
	}

	public void setReviewDetailGrade3(float reviewDetailGrade3) {
		this.reviewDetailGrade3 = reviewDetailGrade3;
	}

	public float getReviewDetailGrade4() {
		return reviewDetailGrade4;
	}

	public void setReviewDetailGrade4(float reviewDetailGrade4) {
		this.reviewDetailGrade4 = reviewDetailGrade4;
	}

	public float getReviewDetailGrade5() {
		return reviewDetailGrade5;
	}

	public void setReviewDetailGrade5(float reviewDetailGrade5) {
		this.reviewDetailGrade5 = reviewDetailGrade5;
	}

	public float getReviewDetailGrade6() {
		return reviewDetailGrade6;
	}

	public void setReviewDetailGrade6(float reviewDetailGrade6) {
		this.reviewDetailGrade6 = reviewDetailGrade6;
	}

	public String getWriterGender() {
		return writerGender;
	}

	public void setWriterGender(String writerGender) {
		this.writerGender = writerGender;
	}

	public String getWriterYear() {
		return writerYear;
	}

	public void setWriterYear(String writerYear) {
		this.writerYear = writerYear;
	}

	public String toString(){
		String str = ""+userSeq+", "+shopSeq+", "+reviewDate+", "+reviewGrade+", "+reviewVisitType+", "+reviewVisitDate+", "+reviewTitle+", "+reviewComment
				+", "+reviewDetailGrade1+", "+reviewDetailGrade2+", "+reviewDetailGrade3+", "+reviewDetailGrade4+", "+reviewDetailGrade5+", "+reviewDetailGrade6+", "+writerGender+", "+writerYear;
		return str;
	}
}