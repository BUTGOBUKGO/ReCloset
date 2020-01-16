package com.kh.recloset.helpAndFAQ.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Post implements Serializable{

	private int psnano;
	private int userno;
	private String pstitle;
	private String pscontent ;
	private Date psdate;
	private String pscheck;
	private String userId;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int psnano, int userno, String pstitle, String pscontent, Date psdate, String pscheck) {
		super();
		this.psnano = psnano;
		this.userno = userno;
		this.pstitle = pstitle;
		this.pscontent = pscontent;
		this.psdate = psdate;
		this.pscheck = pscheck;
	}
	

	public Post(int psnano, int userno, String pstitle, String pscontent, Date psdate, String pscheck, String userId) {
		super();
		this.psnano = psnano;
		this.userno = userno;
		this.pstitle = pstitle;
		this.pscontent = pscontent;
		this.psdate = psdate;
		this.pscheck = pscheck;
		this.userId = userId;
	}

	public int getPsnano() {
		return psnano;
	}

	public void setPsnano(int psnano) {
		this.psnano = psnano;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getPstitle() {
		return pstitle;
	}

	public void setPstitle(String pstitle) {
		this.pstitle = pstitle;
	}

	public String getPscontent() {
		return pscontent;
	}

	public void setPscontent(String pscontent) {
		this.pscontent = pscontent;
	}

	public Date getPsdate() {
		return psdate;
	}

	public void setPsdate(Date psdate) {
		this.psdate = psdate;
	}

	public String getPscheck() {
		return pscheck;
	}

	public void setPscheck(String pscheck) {
		this.pscheck = pscheck;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Post [psnano=" + psnano + ", userno=" + userno + ", pstitle=" + pstitle + ", pscontent=" + pscontent
				+ ", psdate=" + psdate + ", pscheck=" + pscheck + ", userId=" + userId + "]";
	}

	
	
	
	
	
	
}
