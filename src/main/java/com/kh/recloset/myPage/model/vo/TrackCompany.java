package com.kh.recloset.myPage.model.vo;

import java.io.Serializable;

public class TrackCompany implements Serializable{

	private String trCode;
	private String trName;
	
	public TrackCompany() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TrackCompany(String trCode, String trName) {
		super();
		this.trCode = trCode;
		this.trName = trName;
	}
	@Override
	public String toString() {
		return "TrackCompany [trCode=" + trCode + ", trName=" + trName + "]";
	}
	public String getTrCode() {
		return trCode;
	}
	public void setTrCode(String trCode) {
		this.trCode = trCode;
	}
	public String getTrName() {
		return trName;
	}
	public void setTrName(String trName) {
		this.trName = trName;
	}
	
	
	
}
