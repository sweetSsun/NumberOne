package com.NumberOne.dto;

import lombok.Data;

@Data
public class ZzimDto {
	
	private String zzmid;		//찜한 사람
	private String zzubcode;	//찜한 중고거래 글번호	
	private String zzim_Check;	//찜 여부 체크
	//마이페이지 - 찜 목록 출력으로 추가
	private String ubtitle;		//찜한 글 제목
	private String mnickname;	//원본 글 작성자 닉네임
	private String ubdate;		// 원본 글 작성 날짜

}
