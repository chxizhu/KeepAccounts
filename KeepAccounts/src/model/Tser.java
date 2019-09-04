package model;

/**
 * Tser entity. @author MyEclipse Persistence Tools
 */

public class Tser implements java.io.Serializable {

	// Fields

	private String uid;
	private String uname;
	private Integer password;

	// Constructors

	/** default constructor */
	public Tser() {
	}

	/** full constructor */
	public Tser(String uid, String uname, Integer password) {
		this.uid = uid;
		this.uname = uname;
		this.password = password;
	}

	// Property accessors

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

}