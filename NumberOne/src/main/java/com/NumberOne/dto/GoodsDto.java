package com.NumberOne.dto;

import lombok.Data;

@Data
public class GoodsDto {
	//상품
	String gdcode;		//상품코드
	String gdubcode;	//글번호(ubcode)
	String gdname;		//싱픔명
	int gdprice;		//상품가격(천만)
	int gdstate;		//상품상태
}
