package com.kh.recloset.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	
	/* 리뷰신고 */
	
	private int reportNo;     //
	private int reportCode;
	private int userNo;        //
	private int reviewNo;       //
	private String rreason;   //
	private Date rdate;       //
	private String rreporter;  //
	private String defendant;
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Report(int reportNo, int reportCode, int userNo, int reviewNo, String rreason, Date rdate, String rreporter,
			String defendant) {
		super();
		this.reportNo = reportNo;
		this.reportCode = reportCode;
		this.userNo = userNo;
		this.reviewNo = reviewNo;
		this.rreason = rreason;
		this.rdate = rdate;
		this.rreporter = rreporter;
		this.defendant = defendant;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getRreason() {
		return rreason;
	}
	public void setRreason(String rreason) {
		this.rreason = rreason;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRreporter() {
		return rreporter;
	}
	public void setRreporter(String rreporter) {
		this.rreporter = rreporter;
	}
	public String getDefendant() {
		return defendant;
	}
	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportCode=" + reportCode + ", userNo=" + userNo + ", reviewNo="
				+ reviewNo + ", rreason=" + rreason + ", rdate=" + rdate + ", rreporter=" + rreporter + ", defendant="
				+ defendant + "]";
	}
	
}
