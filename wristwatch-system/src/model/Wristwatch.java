package model;

public class Wristwatch {
	
	private Integer id;
	private String name;
	private Float price;
	private int qtdPlots;
	private Float plotPrice;
	private String brand_name;
	private String salesman_name;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public int getQtdPlots() {
		return qtdPlots;
	}
	public void setQtdPlots(int qtdPlots) {
		this.qtdPlots = qtdPlots;
	}
	public Float getPlotPrice() {
		return plotPrice;
	}
	public void setPlotPrice(Float plotPrice) {
		this.plotPrice = plotPrice;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getSalesman_name() {
		return salesman_name;
	}
	public void setSalesman_name(String salesman_name) {
		this.salesman_name = salesman_name;
	}


}
