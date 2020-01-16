package com.kh.recloset.admin_statistics.model.vo;

public class SelectAgeRatio {

	private String ageRange;
	private double pct;
	
	public SelectAgeRatio() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SelectAgeRatio(String ageRange, double pct) {
		super();
		this.ageRange = ageRange;
		this.pct = pct;
	}
	
	@Override
	public String toString() {
		return "SelectAgeRatio [ageRange=" + ageRange + ", pct=" + pct + "]";
	}
	public String getAgeRange() {
		return ageRange;
	}
	public void setAgeRange(String ageRange) {
		this.ageRange = ageRange;
	}
	public double getPct() {
		return pct;
	}
	public void setPct(double pct) {
		this.pct = pct;
	}
	
	
}
