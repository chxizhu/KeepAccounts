package model;

public class T_charts implements java.io.Serializable { 
	private String category;
	private Double money;
	
	
	
	public T_charts(String category, Double money) {
		super();
		this.category = category;
		this.money = money;
	}
	
	
	public T_charts() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	

	
}
