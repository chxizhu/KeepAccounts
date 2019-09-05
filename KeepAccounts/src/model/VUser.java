package model;

import java.sql.Timestamp;

/**
 * VUser entity. @author MyEclipse Persistence Tools
 */

public class VUser implements java.io.Serializable {

	// Fields

		private String id;
		private String uid;
		private String uname;
		private Integer password;
		private Timestamp expendituretime;
		private Double expendituremoney;
		private String expenditurecategory;
		private String expenditureoperation;
		private String expenditureremark;
		private Timestamp incometime;
		private Double incomemoney;
		private String incomecategory;
		private String incomeoperation;
		private String incomeremark;

		// Constructors

		/** default constructor */
		public VUser() {
		}

		/** minimal constructor */
		public VUser(String uid, String uname, Integer password,
				Timestamp expendituretime, Double expendituremoney,
				String expenditurecategory, String expenditureoperation,
				Timestamp incometime, Double incomemoney, String incomecategory) {
			this.uid = uid;
			this.uname = uname;
			this.password = password;
			this.expendituretime = expendituretime;
			this.expendituremoney = expendituremoney;
			this.expenditurecategory = expenditurecategory;
			this.expenditureoperation = expenditureoperation;
			this.incometime = incometime;
			this.incomemoney = incomemoney;
			this.incomecategory = incomecategory;
		}

		/** full constructor */
		public VUser(String id, String uid, String uname, Integer password,
				Timestamp expendituretime, Double expendituremoney,
				String expenditurecategory, String expenditureoperation,
				String expenditureremark, Timestamp incometime, Double incomemoney,
				String incomecategory, String incomeoperation, String incomeremark) {
			this.id = id;
			this.uid = uid;
			this.uname = uname;
			this.password = password;
			this.expendituretime = expendituretime;
			this.expendituremoney = expendituremoney;
			this.expenditurecategory = expenditurecategory;
			this.expenditureoperation = expenditureoperation;
			this.expenditureremark = expenditureremark;
			this.incometime = incometime;
			this.incomemoney = incomemoney;
			this.incomecategory = incomecategory;
			this.incomeoperation = incomeoperation;
			this.incomeremark = incomeremark;
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

		public Timestamp getExpendituretime() {
			return this.expendituretime;
		}

		public void setExpendituretime(Timestamp expendituretime) {
			this.expendituretime = expendituretime;
		}

		public Double getExpendituremoney() {
			return this.expendituremoney;
		}

		public void setExpendituremoney(Double expendituremoney) {
			this.expendituremoney = expendituremoney;
		}

		public String getExpenditurecategory() {
			return this.expenditurecategory;
		}

		public void setExpenditurecategory(String expenditurecategory) {
			this.expenditurecategory = expenditurecategory;
		}

		public String getExpenditureoperation() {
			return this.expenditureoperation;
		}

		public void setExpenditureoperation(String expenditureoperation) {
			this.expenditureoperation = expenditureoperation;
		}

		public String getExpenditureremark() {
			return this.expenditureremark;
		}

		public void setExpenditureremark(String expenditureremark) {
			this.expenditureremark = expenditureremark;
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

		public String getIncomeoperation() {
			return this.incomeoperation;
		}

		public void setIncomeoperation(String incomeoperation) {
			this.incomeoperation = incomeoperation;
		}

		public String getIncomeremark() {
			return this.incomeremark;
		}

		public void setIncomeremark(String incomeremark) {
			this.incomeremark = incomeremark;
		}

}