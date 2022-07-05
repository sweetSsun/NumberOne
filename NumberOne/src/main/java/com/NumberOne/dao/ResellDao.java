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


//	관심지역 매개값줘야함
	ArrayList<UsedBoardDto> selectResellBuyList(String loginRegion);


//		관심지역 매개값줘야함
	ArrayList<UsedBoardDto> selectResellSellList(String loginRegion);



	UsedBoardDto selectResellView(@Param("ubcode") String ubcode,  @Param("ubsellbuy") String ubsellbuy, @Param("loginId") String loginId);



	int selectPageTotalCount();



	ArrayList<UsedBoardDto> selectPage_sellList(@Param("selectRegion") String selectRegion, @Param("startRow") int startRow, @Param("endRow") int endRow);



	GoodsDto selectResellView_goods(String ubcode);
	

	
	
}
