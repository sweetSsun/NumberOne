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
	private String ubsellbuy;
	private String ubstate;		//글 상태
	
	public String getZzmid() {
		return zzmid;
	}
	public void setZzmid(String zzmid) {
		this.zzmid = zzmid;
	}
	public String getZzubcode() {
		return zzubcode;
	}
	public void setZzubcode(String zzubcode) {
		this.zzubcode = zzubcode;
	}
	public String getZzim_Check() {
		return zzim_Check;
	}
	public void setZzim_Check(String zzim_Check) {
		this.zzim_Check = zzim_Check;
	}
	public String getUbtitle() {
		return ubtitle;
	}
	public void setUbtitle(String ubtitle) {
		this.ubtitle = ubtitle;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getUbdate() {
		return ubdate;
	}
	public void setUbdate(String ubdate) {
		this.ubdate = ubdate;
	}
	public String getUbsellbuy() {
		return ubsellbuy;
	}
	public void setUbsellbuy(String ubsellbuy) {
		this.ubsellbuy = ubsellbuy;
	}
	@Override
	public String toString() {
		return "ZzimDto [zzmid=" + zzmid + ", zzubcode=" + zzubcode + ", zzim_Check=" + zzim_Check + ", ubtitle="
				+ ubtitle + ", mnickname=" + mnickname + ", ubdate=" + ubdate + ", ubsellbuy=" + ubsellbuy + "]";
	}	
	
	
	
	
	
	
}
