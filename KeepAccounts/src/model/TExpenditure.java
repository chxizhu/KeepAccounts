package model;

import java.sql.Timestamp;

/**
 * TExpenditure entity. @author MyEclipse Persistence Tools
 */

public class TExpenditure implements java.io.Serializable {

	// Fields

	private Integer expenditureid;
	private String userid;
	private Timestamp expendituretime;
	private Double expendituremoney;
	private String expenditurecategory;
	private String expenditureremark;

	// Constructors

	/** default constructor */
	public TExpenditure() {
	}

	/** minimal constructor */
	public TExpenditure(String userid, Timestamp expendituretime,
			Double expendituremoney, String expenditurecategory) {
		this.userid = userid;
		this.expendituretime = expendituretime;
		this.expendituremoney = expendituremoney;
		this.expenditurecategory = expenditurecategory;
	}

	/** full constructor */
	public TExpenditure(String userid, Timestamp expendituretime,
			Double expendituremoney, String expenditurecategory,
			String expenditureremark) {
		this.userid = userid;
		this.expendituretime = expendituretime;
		this.expendituremoney = expendituremoney;
		this.expenditurecategory = expenditurecategory;
		this.expenditureremark = expenditureremark;
	}

	// Property accessors

	public Integer getExpenditureid() {
		return this.expenditureid;
	}

	public void setExpenditureid(Integer expenditureid) {
		this.expenditureid = expenditureid;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getExpenditureremark() {
		return this.expenditureremark;
	}

	public void setExpenditureremark(String expenditureremark) {
		this.expenditureremark = expenditureremark;
	}

}