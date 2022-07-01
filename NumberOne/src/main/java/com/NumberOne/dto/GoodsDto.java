package com.NumberOne.dto;

import lombok.Data;

@Data
public class GoodsDto {
	//상품
	private String gdcode;		//상품코드
	private String gdubcode;	//글번호(ubcode)
	private String gdname;		//싱픔명
	private int gdprice;		//상품가격(천만)
	private int gdstate;		//상품상태
	
	private String[] gd_names;  //작성된 품목들
}
