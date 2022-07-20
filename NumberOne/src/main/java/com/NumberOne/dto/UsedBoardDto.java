package com.NumberOne.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class UsedBoardDto {
	//중고게시판
	private String ubcode;		//글번호
	private String ubrgcode;	//지역코드
	private String ubsellbuy;	//구매 or 판매
	public String[] getUbdetailimg_originList() {
		return ubdetailimg_originList;
	}
	public void setUbdetailimg_originList(String[] ubdetailimg_originList) {
		this.ubdetailimg_originList = ubdetailimg_originList;
	}
	

	private String ubmid;		//작성자
	private String ubtitle;		//제목
	private String ubcontents;	//내용
	private String ubdate;		//작성일
	private String ubmainimg;	//대표사진
	private String ubdetailimg;	//상세사진
	private int ubstate;		//글상태
	
	
	private int ubwarning;		//경고수 (warningBoards 테이블 조인)
	private int ubzzim;			//찜수 (zzim 테이블 조인)
	
	private String ubnickname;	//작성자 닉네임 (members 테이블 조인) 
	private String ubprofile;	//상세페이지 출력용 작성자 프로필사진
	
	private MultipartFile ubmainimgfile;	//대표사진파일
	private MultipartFile[] ubdetailimgfile;	//상세사진파일
	
	private String[] ubdetailimg_list;			//출력용 상세사진목록
	private String[] ubdetailimg_originList;	//수정전 상세사진목록
	private String ubgdname; //마이페이지 출력용 굿즈명
	private int gdprice;	 // 마이페이지 출력용 가격
	
	public String getUbcode() {
		return ubcode;
	}
	public void setUbcode(String ubcode) {
		this.ubcode = ubcode;
	}
	public String getUbrgcode() {
		return ubrgcode;
	}
	public void setUbrgcode(String ubrgcode) {
		this.ubrgcode = ubrgcode;
	}
	public String getUbsellbuy() {
		return ubsellbuy;
	}
	public void setUbsellbuy(String ubsellbuy) {
		this.ubsellbuy = ubsellbuy;
	}
	public String getUbmid() {
		return ubmid;
	}
	public void setUbmid(String ubmid) {
		this.ubmid = ubmid;
	}
	public String getUbtitle() {
		return ubtitle;
	}
	public void setUbtitle(String ubtitle) {
		this.ubtitle = ubtitle;
	}
	public String getUbcontents() {
		return ubcontents;
	}
	public void setUbcontents(String ubcontents) {
		this.ubcontents = ubcontents;
	}
	public String getUbdate() {
		return ubdate;
	}
	public void setUbdate(String ubdate) {
		this.ubdate = ubdate;
	}
	public String getUbmainimg() {
		return ubmainimg;
	}
	public void setUbmainimg(String ubmainimg) {
		this.ubmainimg = ubmainimg;
	}
	public String getUbdetailimg() {
		return ubdetailimg;
	}
	public void setUbdetailimg(String ubdetailimg) {
		this.ubdetailimg = ubdetailimg;
	}
	public int getUbstate() {
		return ubstate;
	}
	public void setUbstate(int ubstate) {
		this.ubstate = ubstate;
	}
	public int getUbwarning() {
		return ubwarning;
	}
	public void setUbwarning(int ubwarning) {
		this.ubwarning = ubwarning;
	}
	public int getUbzzim() {
		return ubzzim;
	}
	public void setUbzzim(int ubzzim) {
		this.ubzzim = ubzzim;
	}
	
	public MultipartFile getUbmainimgfile() {
		return ubmainimgfile;
	}
	public void setUbmainimgfile(MultipartFile ubmainimgfile) {
		this.ubmainimgfile = ubmainimgfile;
	}
	public MultipartFile[] getUbdetailimgfile() {
		return ubdetailimgfile;
	}
	public void setUbdetailimgfile(MultipartFile[] ubdetailimgfile) {
		this.ubdetailimgfile = ubdetailimgfile;
	}
	public String getUbnickname() {
		return ubnickname;
	}
	public void setUbnickname(String ubnickname) {
		this.ubnickname = ubnickname;
	}
	public String[] getUbdetailimg_list() {
		return ubdetailimg_list;
	}
	public void setUbdetailimg_list(String[] ubdetailimg_list) {
		this.ubdetailimg_list = ubdetailimg_list;
	}
	public String getUbprofile() {
		return ubprofile;
	}
	public void setUbprofile(String ubprofile) {
		this.ubprofile = ubprofile;
	}
	public String getUbgdname() {
		return ubgdname;
	}
	public void setUbgdname(String ubgdname) {
		this.ubgdname = ubgdname;
	}
	@Override
	public String toString() {
		return "UsedBoardDto [ubcode=" + ubcode + ", ubrgcode=" + ubrgcode + ", ubsellbuy=" + ubsellbuy + ", ubmid="
				+ ubmid + ", ubtitle=" + ubtitle + ", ubcontents=" + ubcontents + ", ubdate=" + ubdate + ", ubmainimg="

				+ ubmainimg + ", ubdetailimg=" + ubdetailimg + ", ubstate=" + ubstate + ", ubwarning=" + ubwarning
				+ ", ubzzim=" + ubzzim + ", ubnickname=" + ubnickname + ", ubprofile=" + ubprofile + ", ubmainimgfile="
				+ ubmainimgfile + ", ubdetailimgfile=" + Arrays.toString(ubdetailimgfile) + ", ubdetailimg_list="
				+ Arrays.toString(ubdetailimg_list) + ", ubdetailimg_originList="
				+ Arrays.toString(ubdetailimg_originList) + ", ubgdname=" + ubgdname + "]";

	}
	
	
	
	
	
	
	
	
	

}
