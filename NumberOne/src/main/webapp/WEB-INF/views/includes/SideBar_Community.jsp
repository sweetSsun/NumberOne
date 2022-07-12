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

	/* 사이드바 기본 설정 */
	#sidebar, #sideList, #sidebar-toggleOff {
		-webkit-transition: all 0.2s;
		-moz-transition: all 0.2s;
		-ms-transition:all 0.2s;
		-o-transition: all 0.2s;
		transition: all 0.2s;
		padding-left: 0; 
	}
	
	/* 닫혀있을때 사이드바 */	
	#sidebar {
		-webkit-transform:translate3d(0,0,0);
		-moz-transform:translate3d(0,0,0);
		transform:translate3d(0,0,0);
		overflow:hidden;
		position:fixed;
		width: 50px; height:100%;
		top: auto;
		background: #4cadcc;
	}
	
	/* 열었을 때 사이드바 */ 
	#sidebar.sideon {
		-webkit-transform: translate3d(130px,0,0);
		-moz-transform: translate3d(130px,0,0);
		transform: translate3d(130px,0,0);
		overflow-y: hidden;
		height:100%; width: 120px;
		left: -130px; top: auto;
		background:#F2F2FF; 
	}
	
	
	/* 닫혀있을 때 사이드바 목록 */
	#sideList {
		-webkit-transform: translate3d(-70px,0,0);
		-moz-transform: translate3d(-70px,0,0);
		transform: translate3d(-70px,0,0);
		margin-top: 10%;
		width: 70px;
	}
	
	#sideclose {
		margin-top: 10%;
		white-space: nowrap;
		width: 100%;
	}

	#sideclose span a{
		style="font-size: 40px; color: #fff; width: 70px; line-height: 100px; text-align: center;
	}
	

	/* 열었을 때 사이드바 목록 */
	#sideList.sideon {
		-webkit-transform:translate3d(0,0,0);
		-moz-transform:translate3d(0,0,0);
		transform: translate3d(0,0,0);
		overflow:hidden;
		white-space: nowrap;
		width: 100%;
	}
	
	/* 사이드메뉴 - 커뮤니티 */
	.sidemenu {
    	padding-bottom: 30%;
		color: #4C4C4C;
	}
	
	.sidetitle {
		padding-bottom: 10%;
	    margin-bottom: 10%;
	    margin-top: 10%;
	    border-bottom: solid 1px;
	    border-color: #4cadcc;
		
	    font-size: 2.5vh;
	    text-align: center;
	    font-weight: bold;
	    color: #00bcd4;
	}

	.sideroom {
		display: grid;
		text-align: center;
		align-items: center;
		height: 5vh;
		font-size: 2vh;
	}
	
	/* 사이드메뉴 - 지역 */
	
	.sideregion {
		text-align: center;
		color: #4C4C4C;
	}
	
	.sideregion_title {
		padding-bottom: 5%;
		margin-bottom: 5%;
	    border-bottom: solid 1px;
	    border-color: #4cadcc;
	    font-weight: bold;
		font-size: 2vh;
	}
	
	.sideregion_tags {
		margin: auto;
	}
	.sideregion_tags tr td {
		padding-right: 0.5rem;
	}
	
	/* 열었을 때 햄버거 */
	#sidebar-toggleOff.sideon .sideOffImg {
		position:fixed; display:block;
		margin-top: 2.3vh; margin-left: 120px; float: left;
		width:50px; height:50px; line-height:50px;
		border-radius: 0 10px 10px 0; background:#4cadcc; color:#fff; 
		text-align:center; font-size: 1.5rem;
	}
	
	/* 햄버거 열고닫을 때 CSS 변경 */
	#sidebar-toggleOff .sideOffImg { display:none; }	
	#sidebar-toggleOn.sideon .sideOnImg { display:none; }
	#sideclose.sideon { display:none; }


	.sidetitle span a:hover, .sideroom span a:hover, .sideregion_tags tr td a:hover{
		color: #00bcd4;
		text-decoration: none; 
	}
	.sidemenu .sideroom: hover{
		background-color: white;
		border: solid 1px black;
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
						<!-- 자랑방 -->
						<a href="selectRoomList"><i class="fa-solid fa-house-user"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<!-- 자유방 -->
						<a href="selectFreeBoardList"><i class="fa-solid fa-comments"></i><i class="fa-regular fa-comments"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<!-- 질문방 -->
						<a href="selectQuestionBoardList"><i class="fa-solid fa-circle-question"></i><i class="fa-regular fa-circle-question"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<!-- 정보방 -->
						<a href="selectInfoBoardList"><i class="fa-solid fa-head-side-virus"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<!-- 후기 -->
						<a href="selectReviewBoardList"><i class="fa-solid fa-pen-to-square"></i><i class="fa-regular fa-pen-to-square"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<!-- 공지 -->
						<a href="selectNoticeBoardList"><i class="fa-solid fa-volume-low"></i></a>
					</span>
				</div>
			</div>
			
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
						<a href="selectRoomList"><i class="fa-solid fa-house-user"></i>자랑방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectFreeBoardList"><i class="fa-solid fa-comments"></i>자유방<i class="fa-regular fa-comments"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectQuestionBoardList"><i class="fa-solid fa-circle-question"></i>질문방<i class="fa-regular fa-circle-question"></i></a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectInfoBoardList"><i class="fa-solid fa-head-side-virus"></i>정보방</a>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectReviewBoardList"><i class="fa-solid fa-pen-to-square"></i>후기방</a><i class="fa-regular fa-pen-to-square"></i>
					</span>
				</div>
				<div class="sideroom">
					<span>
						<a href="selectNoticeBoardList"><i class="fa-solid fa-volume-low"></i>공지방</a>
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