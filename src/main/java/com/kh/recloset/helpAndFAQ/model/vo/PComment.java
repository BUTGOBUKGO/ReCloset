package com.kh.recloset.helpAndFAQ.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PComment implements Serializable{

	private int psnacNo;
	private int psnaNo;
	private int userNo;
	private String pcContent;
	private String pcStatus;
	private Date pcDate;
	
	public PComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PComment(int psnacNo, int psnaNo, int userNo, String pcContent, String pcStatus, Date pcDate) {
		super();
		this.psnacNo = psnacNo;
		this.psnaNo = psnaNo;
		this.userNo = userNo;
		this.pcContent = pcContent;
		this.pcStatus = pcStatus;
		this.pcDate = pcDate;
	}

	public int getPsnacNo() {
		return psnacNo;
	}

	public void setPsnacNo(int psnacNo) {
		this.psnacNo = psnacNo;
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

	public String getPcContent() {
		return pcContent;
	}

	public void setPcContent(String pcContent) {
		this.pcContent = pcContent;
	}

	public String getPcStatus() {
		return pcStatus;
	}

	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus;
	}

	public Date getPcDate() {
		return pcDate;
	}

	public void setPcDate(Date pcDate) {
		this.pcDate = pcDate;
	}

	@Override
	public String toString() {
		return "PComment [psnacNo=" + psnacNo + ", psnaNo=" + psnaNo + ", userNo=" + userNo + ", pcContent=" + pcContent
				+ ", pcStatus=" + pcStatus + ", pcDate=" + pcDate + "]";
	}

	
	
}
