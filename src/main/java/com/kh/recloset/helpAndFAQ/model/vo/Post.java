package com.kh.recloset.helpAndFAQ.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Post implements Serializable{

	private int psnaNo;
	private int userNo;
	private String psTitle;
	private String psContent;
	private Date psDate;
	private String psCheck;
	private String userId;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int psnaNo, int userNo, String psTitle, String psContent, Date psDate, String psCheck, String userId) {
		super();
		this.psnaNo = psnaNo;
		this.userNo = userNo;
		this.psTitle = psTitle;
		this.psContent = psContent;
		this.psDate = psDate;
		this.psCheck = psCheck;
		this.userId = userId;
	}

	public int getPsnaNo() {
		return psnaNo;
	}

	public void setPsnaNo(int psnaNo) {
		this.psnaNo = psnaNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPsTitle() {
		return psTitle;
	}

	public void setPsTitle(String psTitle) {
		this.psTitle = psTitle;
	}

	public String getPsContent() {
		return psContent;
	}

	public void setPsContent(String psContent) {
		this.psContent = psContent;
	}

	public Date getPsDate() {
		return psDate;
	}

	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}

	public String getPsCheck() {
		return psCheck;
	}

	public void setPsCheck(String psCheck) {
		this.psCheck = psCheck;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Post [psnaNo=" + psnaNo + ", userNo=" + userNo + ", psTitle=" + psTitle + ", psContent=" + psContent
				+ ", psDate=" + psDate + ", psCheck=" + psCheck + ", userId=" + userId + "]";
	}

	
	
	
	
	
	
	
}
