<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%@ include file="/resources/css/BarCss.jsp" %>

<style>

.sidetitle_mypage {
	padding-bottom: 5%;
	margin-bottom: 30%;
    font-weight: bold;
	font-size: 20px;
	margin-top: 40%;
}

.side_mypage {
	display: grid;
	text-align: left;
	align-items: center;
	height: 30px;
	font-size: 16px;
	padding-left: 20px;
}

.sidetitle_mypage span a:hover, .side_mypage a:hover {
	color: #00bcd4;
	text-decoration: none;
}
.sidetitle_mypage:hover, .side_mypage:hover {
	background-color: white;
}


</style>

</head>

<body>
	<!-- 햄버거 -->
	<div id="sidebar-toggleOff">
		<!-- <a class="sideOnImg"><i class="fa fa-bars"></i></a> -->
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
						<a href="selectMyInfoCommunityView"><i class="fa-solid fa-pencil"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoCommunityView#reply"><i class="fa-brands fa-replyd"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoCommunityView#scrap"><i class="fa-solid fa-star"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoResellView"><i class="fa-solid fa-carrot"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoResellView#scroll-chat"><i class="fa-solid fa-comment-dots"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoResellView#scroll-zzim"><i class="fa-solid fa-heart"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectMyInfoQuestionListView"><i class="fa-solid fa-headset"></i></a>
					</span>
				</div>
								
			</div>			
		</div>
		
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">
			<!-- 사이드바 : 마이페이지 -->

			<div class="sidemenu">
			
				<div class="sidetitle">
					<span><a href="selectMyInfoMemberView">회원정보</a></span>
				</div>
				
				<div class="sidetitle_mypage">
					<span style="font-weight: bold; font-size: 20px;"><a href="selectMyInfoCommunityView">커뮤니티</a></span>
					
					<div class="side_mypage">
						<a href="selectMyInfoCommunityView"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;글</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoCommunityView#reply"><i class="fa-brands fa-replyd"></i>&nbsp;&nbsp;댓글</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoCommunityView#scrap"><i class="fa-solid fa-star"></i>&nbsp;&nbsp;스크랩</a>
					</div>
				</div>
				
				<div class="sidetitle_mypage">
					<span style="font-weight: bold; font-size: 20px;"><a href="selectMyInfoResellView">중고거래</a></span>
					
					<div class="side_mypage">
						<a href="selectMyInfoResellView"><i class="fa-solid fa-carrot"></i>&nbsp;&nbsp;팔구사구</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoResellView#scroll-chat"><i class="fa-solid fa-comment-dots"></i>&nbsp;&nbsp;채팅</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoResellView#scroll-zzim"><i class="fa-solid fa-heart"></i>&nbsp;&nbsp;찜목록</a>
					</div>
				</div>
				
				<div class="sidetitle_mypage">
					<span style="font-weight: bold; font-size: 20px;"><a href="selectMyInfoResellView">문의</a></span>
				
					<div class="side_mypage">
						<a href="selectMyInfoQuestionListView"><i class="fa-solid fa-headset"></i>&nbsp;&nbsp;1:1문의</a>
					</div>
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