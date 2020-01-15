package com.kh.recloset.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Goods implements Serializable{

	private int goodsno;
	private int categorycode;
	private int userno;
	private String gname;
	private int gprice;
	private String gcolor;
	private String gsize;
	private String gsimple;
	private String gdetail;
	private String gstatus;
	private Date gdate;
	private String gsoldout;
	private String changename;
	
	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	



	public Goods(int goodsno, int categorycode, int userno, String gname, int gprice, String gcolor, String gsize,
			String gsimple, String gdetail, String gstatus, Date gdate, String gsoldout, String changename) {
		super();
		this.goodsno = goodsno;
		this.categorycode = categorycode;
		this.userno = userno;
		this.gname = gname;
		this.gprice = gprice;
		this.gcolor = gcolor;
		this.gsize = gsize;
		this.gsimple = gsimple;
		this.gdetail = gdetail;
		this.gstatus = gstatus;
		this.gdate = gdate;
		this.gsoldout = gsoldout;
		this.changename = changename;
	}






	public String getChangename() {
		return changename;
	}






	public void setChangename(String changename) {
		this.changename = changename;
	}






	public String getGcolor() {
		return gcolor;
	}




	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}




	public String getGsize() {
		return gsize;
	}




	public void setGsize(String gsize) {
		this.gsize = gsize;
	}




	public int getGoodsno() {
		return goodsno;
	}


	public void setGoodsno(int goodsno) {
		this.goodsno = goodsno;
	}


	public int getCategorycode() {
		return categorycode;
	}


	public void setCategorycode(int categorycode) {
		this.categorycode = categorycode;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public String getGname() {
		return gname;
	}


	public void setGname(String gname) {
		this.gname = gname;
	}


	public int getGprice() {
		return gprice;
	}


	public void setGprice(int gprice) {
		this.gprice = gprice;
	}


	public String getGsimple() {
		return gsimple;
	}


	public void setGsimple(String gsimple) {
		this.gsimple = gsimple;
	}


	public String getGdetail() {
		return gdetail;
	}


	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}


	public String getGstatus() {
		return gstatus;
	}


	public void setGstatus(String gstatus) {
		this.gstatus = gstatus;
	}


	public Date getGdate() {
		return gdate;
	}


	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}


	public String getGsoldout() {
		return gsoldout;
	}


	public void setGsoldout(String gsoldout) {
		this.gsoldout = gsoldout;
	}






	@Override
	public String toString() {
		return "Goods [goodsno=" + goodsno + ", categorycode=" + categorycode + ", userno=" + userno + ", gname="
				+ gname + ", gprice=" + gprice + ", gcolor=" + gcolor + ", gsize=" + gsize + ", gsimple=" + gsimple
				+ ", gdetail=" + gdetail + ", gstatus=" + gstatus + ", gdate=" + gdate + ", gsoldout=" + gsoldout
				+ ", changename=" + changename + "]";
	}





	
	
	
}