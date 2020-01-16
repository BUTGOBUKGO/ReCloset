package com.kh.recloset.helpAndFAQ.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class HelpAndFAQ implements Serializable{
	
	private int qnaNo;
	private int userNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String qCheck;
	private String userId;
	
	public HelpAndFAQ() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HelpAndFAQ(int qnaNo, int userNo, String qTitle, String qContent, Date qDate, String qCheck) {
		super();
		this.qnaNo = qnaNo;
		this.userNo = userNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qCheck = qCheck;
	}
		
	


	public HelpAndFAQ(int qnaNo, int userNo, String qTitle, String qContent, Date qDate, String qCheck, String userId) {
		super();
		this.qnaNo = qnaNo;
		this.userNo = userNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qCheck = qCheck;
		this.userId = userId;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqCheck() {
		return qCheck;
	}

	public void setqCheck(String qCheck) {
		this.qCheck = qCheck;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "HelpAndFAQ [qnaNo=" + qnaNo + ", userNo=" + userNo + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", qDate=" + qDate + ", qCheck=" + qCheck + ", userId=" + userId + "]";
	}

	

	
	
	
	
	

}
