package com.kh.recloset.sellerInfo.model.vo;
 
import java.io.Serializable;
import java.sql.Date;
 
public class Review implements Serializable{
   
   private int reviewNo;
   private int orderNo;
   private int orderGoodsNo;
   private int userNo;
   private int sellerUserNo;
   private String rTitle;
   private String rContent;
   private int rating;
   private Date rDate;
   private String status;
   private String userName;
   private String gName;
   private String gColor;
   private String gSize;
   private int gPrice;
   private String changeName;
   private String userId;
   private String ratingStar;
   
   public Review() {
      super();
      // TODO Auto-generated constructor stub
   }

   public Review(int reviewNo, int orderNo, int orderGoodsNo, int userNo, int sellerUserNo, String rTitle,
         String rContent, int rating, Date rDate, String status, String userName, String gName, String gColor,
         String gSize, int gPrice, String changeName, String userId, String ratingStar) {
      super();
      this.reviewNo = reviewNo;
      this.orderNo = orderNo;
      this.orderGoodsNo = orderGoodsNo;
      this.userNo = userNo;
      this.sellerUserNo = sellerUserNo;
      this.rTitle = rTitle;
      this.rContent = rContent;
      this.rating = rating;
      this.rDate = rDate;
      this.status = status;
      this.userName = userName;
      this.gName = gName;
      this.gColor = gColor;
      this.gSize = gSize;
      this.gPrice = gPrice;
      this.changeName = changeName;
      this.userId = userId;
      this.ratingStar = ratingStar;
      
   }

   @Override
   public String toString() {
      return "Review [reviewNo=" + reviewNo + ", orderNo=" + orderNo + ", orderGoodsNo=" + orderGoodsNo + ", userNo="
            + userNo + ", sellerUserNo=" + sellerUserNo + ", rTitle=" + rTitle + ", rContent=" + rContent
            + ", rating=" + rating + ", rDate=" + rDate + ", status=" + status + ", userName=" + userName
            + ", gName=" + gName + ", gColor=" + gColor + ", gSize=" + gSize + ", gPrice=" + gPrice
            + ", changeName=" + changeName + ", userId=" + userId + ", ratingStar=" + ratingStar + "]";
   }

   public int getReviewNo() {
      return reviewNo;
   }

   public void setReviewNo(int reviewNo) {
      this.reviewNo = reviewNo;
   }

   public int getOrderNo() {
      return orderNo;
   }

   public void setOrderNo(int orderNo) {
      this.orderNo = orderNo;
   }

   public int getOrderGoodsNo() {
      return orderGoodsNo;
   }

   public void setOrderGoodsNo(int orderGoodsNo) {
      this.orderGoodsNo = orderGoodsNo;
   }

   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public int getSellerUserNo() {
      return sellerUserNo;
   }

   public void setSellerUserNo(int sellerUserNo) {
      this.sellerUserNo = sellerUserNo;
   }

   public String getrTitle() {
      return rTitle;
   }

   public void setrTitle(String rTitle) {
      this.rTitle = rTitle;
   }

   public String getrContent() {
      return rContent;
   }

   public void setrContent(String rContent) {
      this.rContent = rContent;
   }

   public int getRating() {
      return rating;
   }

   public void setRating(int rating) {
      this.rating = rating;
   }

   public Date getrDate() {
      return rDate;
   }

   public void setrDate(Date rDate) {
      this.rDate = rDate;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getgName() {
      return gName;
   }

   public void setgName(String gName) {
      this.gName = gName;
   }

   public String getgColor() {
      return gColor;
   }

   public void setgColor(String gColor) {
      this.gColor = gColor;
   }

   public String getgSize() {
      return gSize;
   }

   public void setgSize(String gSize) {
      this.gSize = gSize;
   }

   public int getgPrice() {
      return gPrice;
   }

   public void setgPrice(int gPrice) {
      this.gPrice = gPrice;
   }

   public String getChangeName() {
      return changeName;
   }

   public void setChangeName(String changeName) {
      this.changeName = changeName;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getRatingStar() {
      return ratingStar;
   }

   public void setRatingStar(String ratingStar) {
      this.ratingStar = ratingStar;
   }

   
   
   
}