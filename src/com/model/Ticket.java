package com.model;
/**
 * 储存票信息，包括起点，终点，票价
 * @author 14215
 *
 */
public class Ticket {
	String qidian;
	String mudi;
	double price;
	public String getQidian() {
		return qidian;
	}
	public void setQidian(String qidian) {
		this.qidian = qidian;
	}
	public String getMudi() {
		return mudi;
	}
	public void setMudi(String mudi) {
		this.mudi = mudi;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
