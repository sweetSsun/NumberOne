package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.NumberOne.dto.BoardDto;
import com.NumberOne.dto.ContactDto;
import com.NumberOne.dto.GonguDto;
import com.NumberOne.dto.MemberDto;
import com.NumberOne.dto.ReplyDto;
import com.NumberOne.dto.ScrapDto;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.dto.ZzimDto;

public interface MemberDao {

	//회원가입 처리
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION ,MADDR, MPROFILE, MMESSAGE, MJOINDATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{mnickname}, #{mphone}, #{memail}, #{mregion}, #{maddr}, #{mprofile}, #{mmessage}, SYSDATE )")
	int insertRegisterWrite(MemberDto member);
	
	//아이디 중복 확인
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectMemberId_ajax(String inputId);
	
	//닉네임 중복 확인
	@Select("SELECT MNICKNAME FROM MEMBERS WHERE MNICKNAME = #{inputNickname}")	
	String selectMemberNickname_ajax(String inputNickname);

	//로그인 요청
	@Select("SELECT MID, MPROFILE, MREGION, MNICKNAME, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	//아이디 찾기 요청
	@Select("SELECT MID FROM MEMBERS WHERE MNAME = #{mname} AND MEMAIL = #{memail}")
	String selectLookforId_ajax(@Param("mname")String checkMname, @Param("memail")String checkMemail);

	//회원정보
	@Select("SELECT MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION, MADDR, MPROFILE, MMESSAGE, MSTATE FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto selectMyInfoMemberView(String loginId);

	//회원정보수정
	@Update("UPDATE MEMBERS SET MPW = #{mpw}, MNAME = #{mname}, MNICKNAME = #{mnickname}, MPHONE = #{mphone}, MEMAIL = #{memail}, MREGION = #{mregion}, MADDR = #{maddr}, "
			+ "MPROFILE = #{mprofile}, MMESSAGE = #{mmessage} WHERE MID = #{mid}")	
	int updateMyInfoMemberModify(MemberDto member);
	
	//마이페이지 회원정보 _ 작성글
	@Select("SELECT BD.BDCODE, BD.BDTITLE, BD.BDMID, TO_CHAR(BD.BDDATE,'YYYY-MM-DD') AS BDDATE, BD.BDCATEGORY, RP.BDREPLY, BD.BDSTATE FROM BOARDS BD left outer join (SELECT RPBDCODE, COUNT (RPBDCODE) AS BDREPLY FROM REPLY WHERE RPSTATE =1 GROUP BY RPBDCODE) RP "
			+ "on BD.BDCODE = RP.RPBDCODE "
			+ "where bdmid= #{loginId} "
			+ "ORDER BY BD.BDCODE DESC" )
	ArrayList<BoardDto> selectMyInfoMemberView_Boards(String loginId);

	//마이페이지 회원정보 _ 댓글 작성한 글	
	@Select("SELECT RP.RPBDCODE, RP.RPCODE, BD.BDTITLE as rpbdtitle, RP.RPCONTENTS, TO_CHAR(RP.RPDATE,'YYYY-MM-DD') AS RPDATE, BD.BDCATEGORY AS RPBDCATEGORY, RP.RPSTATE, BD.BDSTATE  "
			+ "FROM BOARDS BD, REPLY RP "
			+ "WHERE BDCODE = RPBDCODE AND RPMID = #{loginId} "
			+ "ORDER BY RP.RPCODE DESC")
	ArrayList<ReplyDto> selectMyInfoMemberView_Reply(String loginId);

	//회원탈퇴
	@Update("UPDATE MEMBERS SET MSTATE = 2 WHERE MID = #{loginId}")
	int updateMemberWithdraw(@Param("loginId")String loginId);

	//1:1문의 글 번호 생성 (최대값)
	@Select("SELECT NVL(MAX(CTCODE), 'CT00000') FROM CONTACT")
	String selectMaxCtcode();

	//1:1문의 글 작성 요청
	@Insert("INSERT INTO CONTACT (CTCODE, CTTITLE, CTCONTENTS, CTMID, CTDATE) "
			+ "VALUES (#{ctcode}, #{cttitle}, #{ctcontents}, #{ctmid}, SYSDATE) ")
	int insertMyInfoQuestionWrite(ContactDto contact);

	//1:1 문의 내역
	@Select("SELECT CTCODE, CTTITLE, CTCONTENTS, CTMID, TO_CHAR(CTDATE,'YYYY-MM-DD') AS CTDATE, "
			+ "CTANS, TO_CHAR(CTANSDATE,'YYYY-MM-DD HH24:MI') AS CTANSDATE FROM CONTACT WHERE CTMID=#{loginId} ORDER BY CTCODE DESC")
	ArrayList<ContactDto> selectMyInfoQuestionListView(String loginId);

	
	//카카오 가입확인
	@Select("SELECT MID, MPROFILE, MNICKNAME, MREGION, MSTATE FROM MEMBERS WHERE MID = #{mid}")
		MemberDto selectMemberKakao(String mid);

	//팔구 목록
	@Select("SELECT UBTITLE,UBCODE,UBSTATE FROM USEDBOARDS WHERE UBSELLBUY = 'S' AND UBMID = #{loginId}")
	ArrayList<UsedBoardDto> selectMyInfoResellView_Sell(String loginId);
	
	//사구 목록
	@Select("SELECT UBTITLE,UBCODE,UBSTATE FROM USEDBOARDS WHERE UBSELLBUY = 'B' AND UBMID = #{loginId} ")	
	ArrayList<UsedBoardDto> selectMyInfoResellView_Buy(String loginId);
 	
	//마이페이지 스크랩 목록
	@Select("SELECT SC.SCBDCODE, BD.BDTITLE, TO_CHAR(BD.BDDATE,'YYYY-MM-DD') AS BDDATE, M.MNICKNAME ,RP.BDREPLY, SC.SCMID, BD.BDSTATE "
			+ "FROM SCRAP SC "
			+ "LEFT OUTER JOIN BOARDS BD ON BD.BDCODE = SC.SCBDCODE "
			+ "LEFT OUTER JOIN MEMBERS M ON BD.BDMID = M.MID "
			+ "LEFT OUTER JOIN (SELECT RPBDCODE, COUNT (RPBDCODE) AS BDREPLY FROM REPLY WHERE RPSTATE =1 GROUP BY RPBDCODE) RP ON BD.BDCODE = RP.RPBDCODE "
			+ "WHERE SCMID = #{loginId} ORDER BY BD.BDCODE DESC ")
	ArrayList<ScrapDto> selectMyInfoMemberView_scrap(String loginId);

	//찜목록
	@Select("SELECT ZZ.ZZUBCODE, UB.UBTITLE,UB.UBSTATE, UB.UBSELLBUY, M.MNICKNAME, TO_CHAR(UB.UBDATE,'YYYY-MM-DD') AS UBDATE FROM ZZIM ZZ LEFT OUTER JOIN USEDBOARDS UB ON ZZ.ZZUBCODE =  UB.UBCODE LEFT OUTER JOIN MEMBERS M ON UB.UBMID = M.MID WHERE ZZ.ZZMID = #{loginId} ORDER BY UB.UBCODE DESC")
	ArrayList<ZzimDto> selectMyInfoResellView_Zzim(String loginId);

	//닉네임으로 회원정보 가져오기
	@Select("SELECT MID, MPROFILE, MNICKNAME, MREGION, MMESSAGE FROM MEMBERS WHERE MNICKNAME = #{nickname} ")
	MemberDto selectWriteMemberInfo_member(String nickname);

	//마이페이지 미니브라우저 닉네임 별 작성 글 출력
	@Select("SELECT BD.BDCODE, BD.BDTITLE, BD.BDCATEGORY, M.MNICKNAME AS BDNICKNAME, M.MMESSAGE AS BDMESSAGE , M.MPROFILE AS BDMPROFILE, M.MREGION AS BDREGION "
			+ "FROM BOARDS BD, MEMBERS M WHERE BDSTATE = 1 AND BD.BDMID = M.MID AND M.MNICKNAME = #{nickname} ORDER BY BDCODE DESC")
	ArrayList<BoardDto> selectWriteMemberInfo_ajax(String nickname);
	
	//카카오 회원가입 처리
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MNICKNAME, MPHONE, MEMAIL, MREGION, MPROFILE, MJOINDATE, MSTATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{mnickname}, #{mphone}, #{memail}, #{mregion}, #{mprofile}, SYSDATE, 9 )")
	int insertKakaoRegister(MemberDto member);

	//비밀번호 찾기
	@Select("SELECT MPW FROM MEMBERS WHERE MID = #{mid} AND MEMAIL = #{memail}")
	String selectLookforPw_ajax(@Param("mid")String checkMid, @Param("memail")String checkMemail);
	
	//임시 비밀번호로 변경
	@Update ("UPDATE MEMBERS SET MPW = #{mpw} WHERE MID = #{mid} AND MEMAIL = #{memail}")
	void updatePw(@Param("mid")String checkMid, @Param("memail")String checkMemail, @Param("mpw")String temporaryPw);

	//마이페이지 미니브라우저 닉네임 별 작성 댓글 출력
	@Select("SELECT RPBDCODE, RPCONTENTS, BDCATEGORY AS RPBDCATEGORY FROM REPLY RP, MEMBERS M, BOARDS B WHERE RPSTATE =1 AND MID = RPMID AND RPBDCODE = BDCODE AND MNICKNAME = #{nickname} ORDER BY RPBDCODE DESC")
	ArrayList<ReplyDto> selectWriteMemberInfoReply_ajax(String nickname);


	//마이페이지 미니브라우저 중고거래
	@Select("SELECT UB.UBMAINIMG, UB.UBCODE, UB.UBTITLE, GD.GDNAME AS UBGDNAME, GD.GDPRICE, M.MNICKNAME AS UBNICKNAME "
			+ "FROM USEDBOARDS UB,GOODS GD, MEMBERS M "
			+ "WHERE UB.UBSTATE=1 AND UB.UBCODE = GD.GDUBCODE AND UB.UBSELLBUY = 'S' AND UB.UBMID = M.MID AND M.MNICKNAME= #{nickname} ORDER BY UBCODE DESC")
	ArrayList<UsedBoardDto> selectWriteMemberInfoSellBuy_ajax(String nickname);

	//드롭다운 찜목록 조회
	@Select("SELECT UBCODE, RGNAME AS UBRGCODE, UBSELLBUY, MNICKNAME AS UBNICKNAME, UBTITLE, UBMAINIMG, TO_CHAR(UBDATE, 'YYYY-MM-DD HH24:MI:SS') AS UBDATE FROM ZZIM ZZ INNER JOIN USEDBOARDS UB ON ZZ.ZZUBCODE = UB.UBCODE INNER JOIN REGION RG ON UB.UBRGCODE = RG.RGCODE INNER JOIN MEMBERS MB ON UB.UBMID = MB.MID WHERE ZZMID = #{loginId} AND UBSTATE = 1 ORDER BY UB.UBCODE DESC")
	ArrayList<UsedBoardDto> selectZzimList_ajax(String loginId);
	
	// 회원 신고 확인
	@Select("SELECT COUNT(*) FROM WARNINGMEMBERS WHERE WMMID = #{loginId} AND WMEDMID = (SELECT MID FROM MEMBERS WHERE MNICKNAME = #{wmedNickname})")
	int checkMemberWarning_ajax(@Param("loginId") String loginId, @Param("wmedNickname") String wmedNickname);

	// 회원 신고 (상대방 닉네임으로)
	@Insert("INSERT INTO WARNINGMEMBERS VALUES(#{loginId}, (SELECT MID FROM MEMBERS WHERE MNICKNAME = #{wmedNickname}))")
	int insertMemberWarning_ajax(@Param("loginId") String loginId, @Param("wmedNickname") String wmedNickname);

	//이메일 중복 확인
	@Select("SELECT COUNT(MEMAIL) FROM MEMBERS WHERE MEMAIL = #{inputEmail}")	
	int selectMemberEmail_ajax(String inputEmail);
	
	//마이페이지_공구
	@Select("SELECT GGBCODE, NBTITLE AS GGBTITLE, GGDATE, NBSTATE AS GGBSTATE, GGMID FROM NOTICEBOARDS, GONGU WHERE GGBCODE = NBCODE AND GGMID = #{loginId}")
	ArrayList<GonguDto> selectMyInfoGonguView(String loginId);	

	//임시번호 확인 요청
	@Select("SELECT MPW FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	String selectTemporaryNum_ajax(@Param("mid") String mid, @Param("mpw") String mpw);

	// 임시번호 비밀번호로 변경
	@Update ("UPDATE MEMBERS SET MPW = #{mpw} WHERE MID = #{mid}")
	int updateTemporaryNum(@Param("mid")String mid, @Param("mpw")String mpw);
	
	
}

	





