package com.kh.recloset.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	
	private int fNo;
	private int goodsNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date aDate;
	private int aGrade;
	private String aStatus;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int fNo, int goodsNo, String originName, String changeName, String filePath, Date aDate,
			int aGrade, String aStatus) {
		super();
		this.fNo = fNo;
		this.goodsNo = goodsNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.aDate = aDate;
		this.aGrade = aGrade;
		this.aStatus = aStatus;
	}

	@Override
	public String toString() {
		return "Attachment [fNo=" + fNo + ", goodsNo=" + goodsNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", aDate=" + aDate + ", aGrade=" + aGrade + ", aStatus="
				+ aStatus + "]";
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public int getaGrade() {
		return aGrade;
	}

	public void setaGrade(int aGrade) {
		this.aGrade = aGrade;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	
	
}
