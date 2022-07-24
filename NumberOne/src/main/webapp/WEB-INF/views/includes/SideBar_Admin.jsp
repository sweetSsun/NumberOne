<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">

	/* 여기 있는 친구들은 css 파일에 합치면 안돼요 */
header {
	border-bottom:solid 5px #2C647E! important;
}
body.sideon {
	padding-left: 15%;
}
.logoimg {
	filter: brightness(0.5);
}


#sidebar {
	background: #2C647E! important;
}
#sidebar.sideon {
	background:#2C647E! important;
}
.sidemenu{
	color: white! important;
}


.sidetitle_close{
	color: white! important;
	border-color: white! important;	
}






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
			<div class="sidemenu">
			
				<div id="sidebar-toggleOn" class="sidetitle_close" style="padding-bottom: 12px; padding-top: 12px; border-color: white; color: white;">
					<span><a class="sideOnImg" title="메뉴 확장"><i class="fa fa-bars"></i></a></span>
				</div>
				
				<div class="sideclose_room">
					<span>
						<a href="admin_selectMemberList" title="회원관리"><i class="fa-solid fa-circle-user"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectNoticeList" title="공지관리"><i class="fa-solid fa-volume-low"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectResellList" title="중고거래관리"><i class="fa-solid fa-carrot"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectBoardList" title="경고/정지관리"><i class="fa-solid fa-ban"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectBdfixList" title="배너관리"><i class="fa-solid fa-thumbtack"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectReplyList" title="댓글관리"><i class="fa-brands fa-replyd"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="admin_selectQuestionList" title="문의관리"><i class="fa-solid fa-headset"></i></a>
					</span>
				</div>
			</div>
		</div>
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">

			<div class="sidemenu">
			
				<div class="sidetitle_close">
					<span><a href="admin_loadToAdminMainPage">관리자페이지</a></span>
				</div>
				
				<div class="side_admin">
					<span>
						<a href="admin_selectMemberList"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;회원</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectNoticeList"><i class="fa-solid fa-volume-low"></i>&nbsp;&nbsp;공지방</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectResellList"><i class="fa-solid fa-carrot"></i>&nbsp;&nbsp;중고거래</a>
					</span>
				</div>
				
				
				<div class="side_admin" style="height: auto; padding: 10px;">
					<span style="font-weight: bold; font-size: 20px;">
						<a href="admin_selectBoardList"><i class="fa-solid fa-square-pen"></i>&nbsp;&nbsp;커뮤니티</a>
					</span>
				
					<div class="side_admin_a">
						<a href="admin_selectBoardList"><i class="fa-solid fa-ban" style="font-size: small;"></i>&nbsp;&nbsp;경고/정지</a>
					</div>
					<div class="side_admin_a">
						<a href="admin_selectBdfixList"><i class="fa-solid fa-thumbtack" style="margin-right: 9px;"></i>배너 고정</a>
					</div>
				</div>
				
				
				
				<div class="side_admin">
					<span>
						<a href="admin_selectReplyList"><i class="fa-brands fa-replyd"></i>&nbsp;&nbsp;댓글</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectQuestionList"><i class="fa-solid fa-headset"></i>&nbsp;&nbsp;문의</a>
					</span>
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
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose", 'body').addClass('sideon')
    console.log("on");
});

</script>

</html>