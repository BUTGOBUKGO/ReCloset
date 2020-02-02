package com.kh.recloset.helpAndFAQ.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable{

	private int cNo;
	private int qnaNo;
	private int userNo;
	private String qcContent;
	private String qstatus;
	private Date qcDate;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int cNo, int qnaNo, int userNo, String qcContent, String qstatus, Date qcDate) {
		super();
		this.cNo = cNo;
		this.qnaNo = qnaNo;
		this.userNo = userNo;
		this.qcContent = qcContent;
		this.qstatus = qstatus;
		this.qcDate = qcDate;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
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

	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	public String getQstatus() {
		return qstatus;
	}

	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}

	public Date getQcDate() {
		return qcDate;
	}

	public void setQcDate(Date qcDate) {
		this.qcDate = qcDate;
	}

	@Override
	public String toString() {
		return "Comment [cNo=" + cNo + ", qnaNo=" + qnaNo + ", userNo=" + userNo + ", qcContent=" + qcContent
				+ ", qstatus=" + qstatus + ", qcDate=" + qcDate + "]";
	}

	
	
	
	
}
