package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.Paging;
import com.NumberOne.dto.UsedBoardDto;
import com.NumberOne.dto.ZzimDto;

public interface ResellDao {

	String selectMaxNumber_ub();

	String selectMaxNumber_gd();

	int insertResellWrite_gd(GoodsDto gdDto);

	int insertResellWrite_ub(UsedBoardDto ubDto);

	UsedBoardDto selectResellView(UsedBoardDto ubDto);

	int selectPageTotalCount(Paging paging);
	
	int selectTransactionTotalCount(Paging paging);

	ArrayList<GoodsDto> selectResellView_goods(UsedBoardDto ubDto);

	int zzimClick_ajax_delete(ZzimDto zzim);

	int zzimClick_ajax_insert(ZzimDto zzim);

	String selectZzimCheck(@Param("loginId") String loginId, @Param("ubcode") String ubcode);

	String selectRegionCode(String mregion);

	String loadToResellWriteForm(String loginId);

	ArrayList<UsedBoardDto> selectResellPageList(@Param("paging") Paging paging, @Param("pageCheck") String pageCheck);

	String selectMemberId(String keyword);

	ArrayList<UsedBoardDto> selectResellView_memberList(@Param("ubmid") String ubmid, @Param("ubcode") String ubcode);

	ArrayList<UsedBoardDto> selectResellTransactionList(Paging paging);
	
	String checkResellWarning_ajax(@Param("loginId") String loginId, @Param("ubcode") String ubcode);

	int insertResellWarning_ajax(@Param("loginId") String loginId, @Param("ubcode") String ubcode);

	int deleteResellWarning_ajax(@Param("loginId") String loginId, @Param("ubcode") String ubcode);

	int updateResellDelete_gd(UsedBoardDto ubDto);

	int updateResellDelete_ub(UsedBoardDto ubDto);

	int updateResellState_GoodsAjax(GoodsDto gdDto);

	int updateResellState_usedBoardAjax(UsedBoardDto ubDto);
	

	int updateResellModify_ub(UsedBoardDto ubDto);

	int updateResellModify_gd(GoodsDto gdDto);

	
	void delete_gdInsertResult(GoodsDto gdDto);

	void delete_ubInsertResult(UsedBoardDto ubDto);


	

	
	
}