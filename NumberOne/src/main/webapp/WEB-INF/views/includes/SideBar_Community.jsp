<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<a class="sideOffImg"><i class="fa fa-bars"></i></a>
	</div>
	
	<!-- 사이드바 -->
	<div id="sidebar">
		
		<!-- 사이드바 닫혔을 때 -->
		<div id="sideclose">
			<div class="sidemenu" style="color: white;">
			
				<div id="sidebar-toggleOn" class="sidetitle" style="padding-bottom: 12px; padding-top: 12px; border-color: white; color: white;">
					<span><a class="sideOnImg"><i class="fa fa-bars"></i></a></span>
				</div>
				
				<div class="sideroom">
					<span>
						<a href="selectNoticeBoardList"><i class="fa-solid fa-volume-low"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectRoomList"><i class="fa-solid fa-house-user"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectFreeBoardList"><i class="fa-solid fa-comments"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-circle-question"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectInfoBoardList"><i class="fa-solid fa-head-side-virus"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
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
						<a href="selectFreeBoardList"><i class="fa-solid fa-comments"></i>&nbsp;&nbsp;자유방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-circle-question"></i>&nbsp;&nbsp;질문방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-head-side-virus"></i>&nbsp;&nbsp;정보방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;후기방</a>
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
							<td><a href="selectSelBoardList">서울</a></td>
							<td><a href="selectIcnBoardList">인천</a></td>
						</tr>
						<tr>
							<td><a href="selectGgdBoardList">경기</a></td>
							<td><a href="selectGsdBoardList">경상</a></td>
							<td><a href="selectJldBoardList">전라</a></td>
						</tr>
						<tr>
							<td><a href="selectCcdBoardList">충청</a></td>
							<td><a href="selectGwdBoardList">강원</a></td>
							<td><a href="selectJjdBoardList">제주</a></td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</div>
		
</body>

<script type="text/javascript">

$('#sidebar-toggleOff').click(function() {    
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose").removeClass('sideon')
    console.log("off");
});

$('#sidebar-toggleOn').click(function() {
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose").addClass('sideon')
    console.log("on");
});

</script>

</html>