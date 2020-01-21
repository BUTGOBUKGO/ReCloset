package com.kh.recloset.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyPage implements Serializable {

	private int userNo;
	private Date oDate;
	private int orderNo;
	private String gName;
	private int gPrice;
	private String oderChk;
	private String startDate;
	private String endDate;
	private String trackingNo; /* 송장 번호 */
	private String trCode;     /* 택배사 코드 */
	private String trName;     /* 택배사 명 */
	private String changeName;
	
	
	public MyPage() {
		super();
		// TODO Auto-generated constructor stub

	}


	public MyPage(int userNo, Date oDate, int orderNo, String gName, int gPrice, String oderChk, String startDate,
			String endDate, String trackingNo, String trCode, String trName, String changeName) {
		super();
		this.userNo = userNo;
		this.oDate = oDate;
		this.orderNo = orderNo;
		this.gName = gName;
		this.gPrice = gPrice;
		this.oderChk = oderChk;
		this.startDate = startDate;
		this.endDate = endDate;
		this.trackingNo = trackingNo;
		this.trCode = trCode;
		this.trName = trName;
		this.changeName = changeName;
	}


	@Override
	public String toString() {
		return "MyPage [userNo=" + userNo + ", oDate=" + oDate + ", orderNo=" + orderNo + ", gName=" + gName
				+ ", gPrice=" + gPrice + ", oderChk=" + oderChk + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", trackingNo=" + trackingNo + ", trCode=" + trCode + ", trName=" + trName + ", changeName="
				+ changeName + "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getoDate() {
		return oDate;
	}


	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getgName() {
		return gName;
	}


	public void setgName(String gName) {
		this.gName = gName;
	}


	public int getgPrice() {
		return gPrice;
	}


	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}


	public String getOderChk() {
		return oderChk;
	}


	public void setOderChk(String oderChk) {
		this.oderChk = oderChk;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getTrackingNo() {
		return trackingNo;
	}


	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
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


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	
	
	
}