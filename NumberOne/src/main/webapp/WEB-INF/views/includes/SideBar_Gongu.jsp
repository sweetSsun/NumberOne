<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
						<a href="selectGonguBoardList?gbstate=ing" title="진행중"><i class="fa-solid fa-box-open"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectGonguBoardList?gbstate=end" title="진행완료"><i class="fa-solid fa-box"></i></a>
					</span>
				</div>
			</div>
			
		</div>
		
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">

			<div class="sidemenu">
			
				<div class="sidetitle">
					<span><a href="selectBoardList">공동구매</a></span>
				</div>
				
				<div class="sideroom" style="margin-bottom: 15px;">
					<span>
						<a href="selectGonguBoardList?gbstate=ing"><i class="fa-solid fa-box-open"></i>&nbsp;&nbsp;진행중</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectGonguBoardList?gbstate=end"><i class="fa-solid fa-box" style="font-size: x-large"></i>&nbsp;&nbsp;진행완료</a>
					</span>
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