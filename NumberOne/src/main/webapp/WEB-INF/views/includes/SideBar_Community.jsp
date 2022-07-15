<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">

</style>

</head>

<body>
	
	<!-- 햄버거 -->
	<div id="sidebar-toggleOff">
		<a class="sideOffImg" title="메뉴 축소"><i class="fa fa-bars"></i></a>
	</div>
	
	<!-- 사이드바 -->
	<div id="sidebar">
		
		<!-- 사이드바 닫혔을 때 -->
		<div id="sideclose">
			<div class="sidemenu" style="color: white;">
			
				<div id="sidebar-toggleOn" class="sidetitle_close" style="padding-bottom: 12px; padding-top: 12px; border-color: white; color: white;">
					<span><a class="sideOnImg" title="메뉴 확장"><i class="fa fa-bars"></i></a></span>
				</div>
				
				<div class="sideclose_room">
					<span>
						<a href="selectNoticeBoardList" title="공지방"><i class="fa-solid fa-volume-low"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectRoomList" title="자랑방"><i class="fa-solid fa-house-user"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectFreeBoardList" title="자유방"><i class="fa-solid fa-comments"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectQuestionBoardList" title="질문방"><i class="fa-solid fa-circle-question"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectInfoBoardList" title="정보방"><i class="fa-solid fa-head-side-virus"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectReviewBoardList" title="후기방"><i class="fa-solid fa-pen-to-square"></i></a>
					</span>
				</div>
			</div>
			
			<!-- 지역 드래그앤드롭 넣고싶어용 -->
			<!-- <div class="sideregion">
				<div class="sideregion_title">
					<span>지역</span>
				</div>
						
				<div>
					<table class="sideregion_tags">
						<tr>
							<td><a href="#">전체</a></td>
							<td><a href="#">서울</a></td>
							<td><a href="#">인천</a></td>
						</tr>
						<tr>
							<td><a href="#">경기</a></td>
							<td><a href="#">경상</a></td>
							<td><a href="#">전라</a></td>
						</tr>
						<tr>
							<td><a href="#">충청</a></td>
							<td><a href="#">강원</a></td>
							<td><a href="#">제주</a></td>
						</tr>
					</table>
				</div>
			</div> -->
			
		</div>
		
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">

			<div class="sidemenu">
			
				<div class="sidetitle">
					<span><a href="selectBoardList">커뮤니티</a></span>
				</div>
				
				<div class="sideroom">
					<span>
						<a href="selectNoticeBoardList"><i class="fa-solid fa-volume-low"></i>&nbsp;&nbsp;공지방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectRoomList"><i class="fa-solid fa-house-user"></i>&nbsp;&nbsp;자랑방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
					<!-- 자유방 -->
						<a href="selectCategoryBoardList?searchVal=자유"><i class="fa-solid fa-comments"></i>&nbsp;&nbsp;자유방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
					<!-- 질문방 -->
						<a href="selectCategoryBoardList?searchVal=질문"><i class="fa-solid fa-circle-question"></i>&nbsp;&nbsp;질문방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
					<!-- 정보방 -->
						<a href="selectCategoryBoardList?searchVal=정보"><i class="fa-solid fa-head-side-virus"></i>&nbsp;&nbsp;정보방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectCategoryBoardList?searchVal=후기"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;후기방</a>
					</span>
				</div>
			</div>
			
			<div class="sideregion">
				<div class="sideregion_title">
					<span>지역</span>
				</div>
						
				<div>
					<table class="sideregion_tags">
						<tr>
							<td><a href="selectRegionBoardList">전체</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=SEL">서울</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=ICN">인천</a></td>
						</tr>
						<tr>
							<td><a href="selectDetailBoardList?bdrgcode=GGD">경기</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=GSD">경상</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=JLD">전라</a></td>
						</tr>
						<tr>
							<td><a href="selectDetailBoardList?bdrgcode=CCD">충청</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=GWD">강원</a></td>
							<td><a href="selectDetailBoardList?bdrgcode=JJD">제주</a></td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</div>
		
</body>

<script type="text/javascript">

$('#sidebar-toggleOff').click(function() {    
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, #drop_buy, #drop_sell").removeClass('sideon')
    console.log("off");
});

$('#sidebar-toggleOn').click(function() {
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, #drop_buy, #drop_sell").addClass('sideon')
    console.log("on");
});

</script>

</html>