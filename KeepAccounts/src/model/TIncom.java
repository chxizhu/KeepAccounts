package model;

import java.sql.Timestamp;

/**
 * TIncom entity. @author MyEclipse Persistence Tools
 */

public class TIncom implements java.io.Serializable {

	// Fields

		private Integer incomeid;
		private String userid;
		private Timestamp incometime;
		private Double incomemoney;
		private String incomecategory;
		private String incomeoperation;
		private String incomeremark;

		// Constructors

		/** default constructor */
		public TIncom() {
		}

		/** minimal constructor */
		public TIncom(Integer incomeid, String userid, Timestamp incometime,
				Double incomemoney, String incomecategory) {
			this.incomeid = incomeid;
			this.userid = userid;
			this.incometime = incometime;
			this.incomemoney = incomemoney;
			this.incomecategory = incomecategory;
		}

		/** full constructor */
		public TIncom(Integer incomeid, String userid, Timestamp incometime,
				Double incomemoney, String incomecategory, String incomeoperation,
				String incomeremark) {
			this.incomeid = incomeid;
			this.userid = userid;
			this.incometime = incometime;
			this.incomemoney = incomemoney;
			this.incomecategory = incomecategory;
			this.incomeoperation = incomeoperation;
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