package com.kh.recloset.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MemSearch implements Serializable{
	
	/* 회원검색 */
	
	private int userNo;        
	private String userId; 
	private	String memType;
	private String phone;
	private String email;
	private String marketName;
	private String status;
	
	private String searchId;
	private int userCodeNo;
	private String userCode;
	


	public MemSearch() {
		super();
		// TODO Auto-generated constructor stub
	}



	public MemSearch(int userNo, String userId, String memType, String phone, String email, String marketName,
			String status, String searchId, int userCodeNo, String userCode) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.memType = memType;
		this.phone = phone;
		this.email = email;
		this.marketName = marketName;
		this.status = status;
		this.searchId = searchId;
		this.userCodeNo = userCodeNo;
		this.userCode = userCode;
	}



	@Override
	public String toString() {
		return "MemSearch [userNo=" + userNo + ", userId=" + userId + ", memType=" + memType + ", phone=" + phone
				+ ", email=" + email + ", marketName=" + marketName + ", status=" + status + ", searchId=" + searchId
				+ ", userCodeNo=" + userCodeNo + ", userCode=" + userCode + "]";
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getMemType() {
		return memType;
	}



	public void setMemType(String memType) {
		this.memType = memType;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getMarketName() {
		return marketName;
	}



	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getSearchId() {
		return searchId;
	}



	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}



	public int getUserCodeNo() {
		return userCodeNo;
	}



	public void setUserCodeNo(int userCodeNo) {
		this.userCodeNo = userCodeNo;
	}



	public String getUserCode() {
		return userCode;
	}



	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	
}
