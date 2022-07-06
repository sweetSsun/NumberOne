package com.NumberOne.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.NumberOne.dto.GoodsDto;
import com.NumberOne.dto.UsedBoardDto;

public interface ResellDao {



	String selectMaxNumber_ub();
	
	
	String selectMaxNumber_gd();


	int insertResellWrite_gd(GoodsDto gdDto);


	int insertResellWrite_ub(UsedBoardDto ubDto);


	UsedBoardDto selectResellView(@Param("ubcode") String ubcode, @Param("ubsellbuy") String ubsellbuy);


	int selectPageTotalCount(@Param("mregion") String mregion, @Param("sell_buy") String sell_buy);


	GoodsDto selectResellView_goods(String ubcode);


	int zzimClick_ajax_delete(@Param("zzubcode") String zzubcode, @Param("zzmid") String zzmid);


	int zzimClick_ajax_insert(@Param("zzubcode") String zzubcode, @Param("zzmid") String zzmid);


	String selectZzimCheck(@Param("loginId") String loginId, @Param("ubcode") String ubcode);


	String selectRegionCode(String mRegion);


	String loadToResellWriteForm(String loginId);


	ArrayList<UsedBoardDto> selectResellPageList(@Param("sell_buy") String sell_buy, @Param("mregion") String mregion, @Param("startRow") int startRow, @Param("endRow") int endRow);



	ArrayList<UsedBoardDto> selectResellRegionList_ajax(@Param("mregion") String mregion, @Param("sell_buy") String sell_buy);



	String selectSearchList_ajax(@Param("searchVal") String searchVal, @Param("sell_buy") String sell_buy, @Param("selectRegion") String selectRegion, @Param("searchOp") String searchOp);


}

	