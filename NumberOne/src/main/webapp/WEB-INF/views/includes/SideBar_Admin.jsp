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


.sidetitle{
	color: white! important;
	border-color: white! important;	
}


.side_admin{
    display: grid;
    text-align: left;
    align-items: center;
    height: 50px;
    font-size: 20px;
    padding-left: 10px;
    font-weight: bold;
}


.side_admin span a:hover, .side_mypage a:hover {
	color: #00bcd4;
	text-decoration: none;
}

.side_admin:hover, .side_mypage:hover {
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
			<div class="sidemenu">
			
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
						<a href="#"><i class="fa-solid fa-head-side-virus"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
					</span>
				</div>
			</div>
			
			
		</div>
		
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">

			<div class="sidemenu">
			
				<div class="sidetitle">
					<span><a href="admin_loadToAdminMainPage">관리자페이지</a></span>
				</div>
				
				<div class="side_admin">
					<span>
						<a href="admin_selectMemberList"><i class="fa-solid fa-volume-low"></i>&nbsp;&nbsp;회원</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectNoticeList"><i class="fa-solid fa-house-user"></i>&nbsp;&nbsp;공지방</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectResellList"><i class="fa-solid fa-comments"></i>&nbsp;&nbsp;중고거래</a>
					</span>
				</div>
				
				
				<div class="side_admin" style="height: auto; padding: 10px;">
					<span style="font-weight: bold; font-size: 20px;">
						<a href="admin_selectBoardList"><i class="fa-solid fa-circle-question"></i>&nbsp;&nbsp;커뮤니티</a>
					</span>
				
					<div class="side_mypage">
						<a href="admin_selectBoardList"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;경고/정지</a>
					</div>
					<div class="side_mypage">
						<a href="admin_selectBdfixList"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;배너</a>
					</div>
				</div>
				
				
				
				<div class="side_admin">
					<span>
						<a href="admin_selectReplyList"><i class="fa-solid fa-head-side-virus"></i>&nbsp;&nbsp;댓글</a>
					</span>
				</div>
				<div class="side_admin">
					<span>
						<a href="admin_selectQuestionList"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;문의</a>
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