package model;

import java.sql.Timestamp;

/**
 * VUserBill entity. @author MyEclipse Persistence Tools
 */

public class VUserBill implements java.io.Serializable {

	// Fields

		private String id;
		private String uid;
		private String uname;
		private Integer password;
		private Integer billid;
		private Timestamp billtime;
		private Double money;
		private String category;
		private String operation;
		private String remark;

		// Constructors

		/** default constructor */
		public VUserBill() {
		}

		/** minimal constructor */
		public VUserBill(String uid, String uname, Integer password,
				Integer billid, Timestamp billtime, Double money, String category,
				String operation) {
			this.uid = uid;
			this.uname = uname;
			this.password = password;
			this.billid = billid;
			this.billtime = billtime;
			this.money = money;
			this.category = category;
			this.operation = operation;
		}

		/** full constructor */
		public VUserBill(String id, String uid, String uname, Integer password,
				Integer billid, Timestamp billtime, Double money, String category,
				String operation, String remark) {
			this.id = id;
			this.uid = uid;
			this.uname = uname;
			this.password = password;
			this.billid = billid;
			this.billtime = billtime;
			this.money = money;
			this.category = category;
			this.operation = operation;
			this.remark = remark;
		}

		// Property accessors

		public String getId() {
			return this.id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getUid() {
			return this.uid;
		}

		public void setUid(String uid) {
			this.uid = uid;
		}

		public String getUname() {
			return this.uname;
		}

		public void setUname(String uname) {
			this.uname = uname;
		}

		public Integer getPassword() {
			return this.password;
		}

		public void setPassword(Integer password) {
			this.password = password;
		}

		public Integer getBillid() {
			return this.billid;
		}

		public void setBillid(Integer billid) {
			this.billid = billid;
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