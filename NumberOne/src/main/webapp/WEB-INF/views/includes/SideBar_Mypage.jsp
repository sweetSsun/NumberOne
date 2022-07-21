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
		<!-- <a class="sideOnImg"><i class="fa fa-bars"></i></a> -->
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
						<a href="selectMyInfoCommunityView#scroll-board" title="글"><i class="fa-solid fa-pencil"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoCommunityView#scroll-reply" title="댓글"><i class="fa-brands fa-replyd"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoCommunityView#scroll-scrap" title="스크랩"><i class="fa-solid fa-star"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoResellView#scroll-sellbuy" title="팔구사구"><i class="fa-solid fa-carrot"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoResellView#scroll-chat" title="채팅"><i class="fa-solid fa-comment-dots"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoResellView#scroll-zzim" title="찜목록"><i class="fa-solid fa-heart"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectMyInfoQuestionListView" title="1:1문의"><i class="fa-solid fa-headset"></i></a>
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
						<a href="selectMyInfoCommunityView#scroll-board"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;글</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoCommunityView#scroll-reply"><i class="fa-brands fa-replyd"></i>&nbsp;&nbsp;댓글</a>
					</div>
					<div class="side_mypage">
						<a href="selectMyInfoCommunityView#scroll-scrap"><i class="fa-solid fa-star"></i>&nbsp;&nbsp;스크랩</a>
					</div>
				</div>
				
				<div class="sidetitle_mypage">
					<span style="font-weight: bold; font-size: 20px;"><a href="selectMyInfoResellView">중고거래</a></span>
					
					<div class="side_mypage">
						<a href="selectMyInfoResellView#scroll-sellbuy"><i class="fa-solid fa-carrot"></i>&nbsp;&nbsp;팔구사구</a>
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