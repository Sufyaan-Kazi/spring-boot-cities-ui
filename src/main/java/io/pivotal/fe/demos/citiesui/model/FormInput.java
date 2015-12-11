package io.pivotal.fe.demos.citiesui.model;

public class FormInput {
	private String name;
	private Long size = 20L;
	
	public FormInput() {
		
	}
	public FormInput(String name, Long size) {
		this.name = name;
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}

}
