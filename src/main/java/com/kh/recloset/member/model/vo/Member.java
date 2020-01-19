package com.kh.recloset.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
// DB 내용 
	
		private int userNo;
		private int userCodeNo; // 회원구분코드
		private String userId;
		private String userPwd;
		private String userName;    // 회원이름
		private Date birthday;
		private String zipCode;
		private String address1;
		private String address2;
		private String phone;
		private String email;
		private String gender;
		
		/* 판매자회원 정보 */
		private String marketname;  // 상호명
		private String bank;        // 은행명
		private String atholder;    // 예금주
		private String anumber;     // 계좌번호
		private String status;      // 탈퇴여부
		
		public Member() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public Member(int userNo, int userCodeNo, String userId, String userPwd, String userName, Date birthday,
				String zipCode, String address1, String address2, String phone, String email, String gender,
				String marketname, String bank, String atholder, String anumber, String status) {
			super();
			this.userNo = userNo;
			this.userCodeNo = userCodeNo;
			this.userId = userId;
			this.userPwd = userPwd;
			this.userName = userName;
			this.birthday = birthday;
			this.zipCode = zipCode;
			this.address1 = address1;
			this.address2 = address2;
			this.phone = phone;
			this.email = email;
			this.gender = gender;
			this.marketname = marketname;
			this.bank = bank;
			this.atholder = atholder;
			this.anumber = anumber;
			this.status = status;
		}

		public int getUserNo() {
			return userNo;
		}
		public void setUserNo(int userNo) {
			this.userNo = userNo;
		}
		public int getUserCodeNo() {
			return userCodeNo;
		}
		public void setUserCodeNo(int userCodeNo) {
			this.userCodeNo = userCodeNo;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserPwd() {
			return userPwd;
		}
		public void setUserPwd(String userPwd) {
			this.userPwd = userPwd;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public Date getBirthday() {
			return birthday;
		}
		public void setBirthday(Date birthday) {
			this.birthday = birthday;
		}
		public String getZipCode() {
			return zipCode;
		}
		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}
		public String getAddress1() {
			return address1;
		}
		public void setAddress1(String address1) {
			this.address1 = address1;
		}
		public String getAddress2() {
			return address2;
		}
		public void setAddress2(String address2) {
			this.address2 = address2;
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
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getMarketname() {
			return marketname;
		}
		public void setMarketname(String marketname) {
			this.marketname = marketname;
		}
		public String getBank() {
			return bank;
		}
		public void setBank(String bank) {
			this.bank = bank;
		}
		public String getAtholder() {
			return atholder;
		}
		public void setAtholder(String atholder) {
			this.atholder = atholder;
		}
		public String getAnumber() {
			return anumber;
		}
		public void setAnumber(String anumber) {
			this.anumber = anumber;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
	
	
}
