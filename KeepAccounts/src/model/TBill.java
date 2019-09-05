package model;

import java.sql.Timestamp;

/**
 * TBill entity. @author MyEclipse Persistence Tools
 */

public class TBill implements java.io.Serializable {

	// Fields

		private Integer billid;
		private String userid;
		private Timestamp billtime;
		private Double money;
		private String category;
		private String operation;
		private String remark;

		// Constructors

		/** default constructor */
		public TBill() {
		}

		/** minimal constructor */
		public TBill(Integer billid, String userid, Timestamp billtime,
				Double money, String category, String operation) {
			this.billid = billid;
			this.userid = userid;
			this.billtime = billtime;
			this.money = money;
			this.category = category;
			this.operation = operation;
		}

		/** full constructor */
		public TBill(Integer billid, String userid, Timestamp billtime,
				Double money, String category, String operation, String remark) {
			this.billid = billid;
			this.userid = userid;
			this.billtime = billtime;
			this.money = money;
			this.category = category;
			this.operation = operation;
			this.remark = remark;
		}

		// Property accessors

		public Integer getBillid() {
			return this.billid;
		}

		public void setBillid(Integer billid) {
			this.billid = billid;
		}

		public String getUserid() {
			return this.userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public Timestamp getBilltime() {
			return this.billtime;
		}

		public void setBilltime(Timestamp billtime) {
			this.billtime = billtime;
		}

		public Double getMoney() {
			return this.money;
		}

		public void setMoney(Double money) {
			this.money = money;
		}

		public String getCategory() {
			return this.category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getOperation() {
			return this.operation;
		}

		public void setOperation(String operation) {
			this.operation = operation;
		}

		public String getRemark() {
			return this.remark;
		}

		public void setRemark(String remark) {
			this.remark = remark;
		}

}