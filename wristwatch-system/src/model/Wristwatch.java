package model;

public class Wristwatch {
	
	private Integer id;
	private String name;
	private Double price;
	private int qtdPlots;
	private Double plotPrice;
	private String brand_name;
	private String collection_name;
	
	
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getQtdPlots() {
		return qtdPlots;
	}
	public void setQtdPlots(int qtdPlots) {
		this.qtdPlots = qtdPlots;
	}
	public Double getPlotPrice() {
		return plotPrice;
	}
	public void setPlotPrice(Double plotPrice) {
		this.plotPrice = plotPrice;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getCollection_name() {
		return collection_name;
	}
	public void setCollection_name(String collection_name) {
		this.collection_name = collection_name;
	}


}
