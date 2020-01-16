package com.kh.recloset.seller_statistics.model.vo;

import java.io.Serializable;

public class GenderRatio implements Serializable  {
	
	private String gender;
	private int cnt;
	private double pct;
	
	public GenderRatio(String gender, int cnt, double pct) {
		super();
		this.gender = gender;
		this.cnt = cnt;
		this.pct = pct;
	}
	
	public GenderRatio() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public double getPct() {
		return pct;
	}

	public void setPct(double pct) {
		this.pct = pct;
	}

	@Override
	public String toString() {
		return "GenderRatio [gender=" + gender + ", cnt=" + cnt + ", pct=" + pct + "]";
	}
	
	
}
