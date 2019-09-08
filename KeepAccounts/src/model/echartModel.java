package model;

public class echartModel {
	public double value;
	public String name;
	
	
	
	public echartModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public echartModel(double value, String name) {
		super();
		this.value = value;
		this.name = name;
	}
	
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
