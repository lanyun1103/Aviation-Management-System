package com.model;

/**
 * 储存票信息，包括起点，终点，票价
 * 
 * @author 14215
 *
 */
public class Ticket {
	String qidian;
	String mudi;
	String t1;
	String t2;
	int remaining;
	public Ticket(String qidian, String mudi, String t1, String t2,int remaining, double price) {
		super();
		this.qidian = qidian;
		this.mudi = mudi;
		this.t1 = t1;
		this.t2 = t2;
		this.price = price;
		this.remaining = remaining;
	}

	public String getT1() {
		return t1;
	}

	public void setT1(String t1) {
		this.t1 = t1;
	}

	public String getT2() {
		return t2;
	}

	public void setT2(String t2) {
		this.t2 = t2;
	}

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
