package com.NumberOne.dto;

import java.util.Arrays;

import lombok.Data;

@Data
public class GoodsDto {
	//상품
	private String gdcode;		//상품코드
	private String gdubcode;	//글번호(ubcode)
	private String gdname;		//싱픔명
	private int gdprice;		//상품가격(천만)
	private int gdstate;		//상품상태
	
	private String[] gd_names;  //상품이름 배열
	private int[] gd_price;		//상품가격 배열
    private String[] gd_code;	//상품코드 배열
    private int[] gd_state;		//상품상태 배열
	
	
	public String getGdcode() {
		return gdcode;
	}
	public void setGdcode(String gdcode) {
		this.gdcode = gdcode;
	}
	public String getGdubcode() {
		return gdubcode;
	}
	public void setGdubcode(String gdubcode) {
		this.gdubcode = gdubcode;
	}
	public String getGdname() {
		return gdname;
	}
	public void setGdname(String gdname) {
		this.gdname = gdname;
	}
	public int getGdprice() {
		return gdprice;
	}
	public void setGdprice(int gdprice) {
		this.gdprice = gdprice;
	}
	public int getGdstate() {
		return gdstate;
	}
	public void setGdstate(int gdstate) {
		this.gdstate = gdstate;
	}
	public String[] getGd_names() {
		return gd_names;
	}
	public void setGd_names(String[] gd_names) {
		this.gd_names = gd_names;
	}
	public int[] getGd_price() {
		return gd_price;
	}
	public void setGd_price(int[] gd_price) {
		this.gd_price = gd_price;
	}
	@Override
	public String toString() {
		return "GoodsDto [gdcode=" + gdcode + ", gdubcode=" + gdubcode + ", gdname=" + gdname + ", gdprice=" + gdprice
				+ ", gdstate=" + gdstate + ", gd_names=" + Arrays.toString(gd_names) + ", gd_price="
				+ Arrays.toString(gd_price) + ", gd_code=" + Arrays.toString(gd_code) + ", gd_state="
				+ Arrays.toString(gd_state) + "]";
	}
	
	
	
	
	
}
