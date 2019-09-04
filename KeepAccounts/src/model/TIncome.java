package model;

import java.sql.Timestamp;



/**
 * TIncome entity. @author MyEclipse Persistence Tools
 */

public class TIncome  implements java.io.Serializable {


    // Fields    

    private Integer incomeid;
    private String userid;
    private Timestamp incometime;
    private Double incomemoney;
    private String incomecategory;
    private String incomeremark;


   // Constructors

   /** default constructor */
   public TIncome() {
   }

	/** minimal constructor */
   public TIncome(Integer incomeid, String userid, Timestamp incometime, Double incomemoney, String incomecategory) {
       this.incomeid = incomeid;
       this.userid = userid;
       this.incometime = incometime;
       this.incomemoney = incomemoney;
       this.incomecategory = incomecategory;
   }
   
   /** full constructor */
   public TIncome(Integer incomeid, String userid, Timestamp incometime, Double incomemoney, String incomecategory, String incomeremark) {
       this.incomeid = incomeid;
       this.userid = userid;
       this.incometime = incometime;
       this.incomemoney = incomemoney;
       this.incomecategory = incomecategory;
       this.incomeremark = incomeremark;
   }

  
   // Property accessors

   public Integer getIncomeid() {
       return this.incomeid;
   }
   
   public void setIncomeid(Integer incomeid) {
       this.incomeid = incomeid;
   }

   public String getUserid() {
       return this.userid;
   }
   
   public void setUserid(String userid) {
       this.userid = userid;
   }

   public Timestamp getIncometime() {
       return this.incometime;
   }
   
   public void setIncometime(Timestamp incometime) {
       this.incometime = incometime;
   }

   public Double getIncomemoney() {
       return this.incomemoney;
   }
   
   public void setIncomemoney(Double incomemoney) {
       this.incomemoney = incomemoney;
   }

   public String getIncomecategory() {
       return this.incomecategory;
   }
   
   public void setIncomecategory(String incomecategory) {
       this.incomecategory = incomecategory;
   }

   public String getIncomeremark() {
       return this.incomeremark;
   }
   
   public void setIncomeremark(String incomeremark) {
       this.incomeremark = incomeremark;
   }
   








}