package com.kh.recloset.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	
	private int fno;
	private int goodsno;
	private String originname;
	private String changename;
	private String filepath;
	private Date adate;
	private int agrade;
	private String astatus;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int fno, int goodsno, String originname, String changename, String filepath, Date adate,
			int agrade, String astatus) {
		super();
		this.fno = fno;
		this.goodsno = goodsno;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
		this.adate = adate;
		this.agrade = agrade;
		this.astatus = astatus;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getGoodsno() {
		return goodsno;
	}

	public void setGoodsno(int goodsno) {
		this.goodsno = goodsno;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	public int getAgrade() {
		return agrade;
	}

	public void setAgrade(int agrade) {
		this.agrade = agrade;
	}

	public String getAstatus() {
		return astatus;
	}

	public void setAstatus(String astatus) {
		this.astatus = astatus;
	}

	@Override
	public String toString() {
		return "Attachment [fno=" + fno + ", goodsno=" + goodsno + ", originname=" + originname + ", changename="
				+ changename + ", filepath=" + filepath + ", adate=" + adate + ", agrade=" + agrade + ", astatus="
				+ astatus + "]";
	}

	
	
	
	
}
