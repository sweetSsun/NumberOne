<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>

<style type="text/css">
/* 폰트 : 프리텐다드 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
	
/* 폰트 : 오늘의집 */	
	@font-face {
	    font-family: 'Jal_Onuel';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	/* ---------------------- */
	/* ------- topbar ------- */
	/* ---------------------- */
	
	
	body{
		font-family: 'pretendard';
		height: auto;
	}
	
	
	aside, footer{
		/* border: solid 1px black; */
		margin-bottom: 5px;
		font-size: 24px;
	}
	
	header{
		font-family: 'Jal_Onuel'! important;
		color: #4C4C4C;
	    white-space: nowrap;
		margin-bottom: 0px;
		font-size: 24px;
		position: sticky;
		heigth: 100%;
		min-width: 800px;
		top: 0px;
		z-index:10;
		border-bottom: solid 5px #F2F2FF;

	}
	
	#header_menu ul li{
/* 		overflow: auto;
 */		display: inline;
	}
	
	a{	
	text-decoration: none;
    color: inherit; /* 링크의 색상 제거 */
	}
	
	.menubar{	
	text-decoration: none;
    color: inherit; /* 링크의 색상 제거 */
	}
	
	main{
		display: flex;
	}
	
	aside, section{
		flex-grow: 1;
		height:100%;
	}
	
	li a:hover, ul i:hover, p a:hover {
	color: #00bcd4;
	text-decoration: none; 
	}
	
/* 	
footer{
		margin-top: 10%;
		height: 200px;
		border-top: solid #9C9C9C 1px;
		background-color: #F9F9F9;
	}
 */
	
	
	/* ---------------------- */
	/* ------- sidebar ------ */
	/* ---------------------- */
	
	
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
		height:100%; width: 130px;
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
		height: 100%;
	}
	
	/* 사이드메뉴 - 커뮤니티 */
	.sidemenu {
    	padding-bottom: 70px;
		color: #4C4C4C;
	}
	
	.sidetitle, .sidetitle_close {
		padding-bottom: 10%;
	    margin-bottom: 10%;
	    margin-top: 10%;
	    border-bottom: solid 1px;
	    border-color: #4cadcc;
		
	    font-size: 25px;
	    text-align: center;
	    font-weight: bold;
	    color: #00bcd4;
	}

	.sideroom, .sideclose_room {
		display: grid;
		text-align: center;
		align-items: center;
		height: 50px;
		font-size: 20px;
		padding-right: 5px;
		font-weight: bold;
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
		font-size: 20px;
	}
	
	.sideregion_tags {
		margin: auto;
	}
	.sideregion_tags tr td {
		padding-right: 0.5rem;
		font-weight: bold;
		font-size: 17px;
	}
	
	/* 열었을 때 햄버거 */
	#sidebar-toggleOff.sideon .sideOffImg {
		position:fixed; display:block;		
		margin-top: 27px; margin-left: 130px; float: left;
		width:50px; height:50px; line-height:50px;
		border-radius: 0 10px 10px 0; background:#4cadcc; color:#fff; 
		text-align:center; font-size: 1.5rem;
	}
	
	/* 햄버거 열고닫을 때 CSS 변경 */
	#sidebar-toggleOff .sideOffImg { display:none; }	
	#sidebar-toggleOn.sideon .sideOnImg { display:none; }
	#sideclose.sideon { display:none; }
	
	/* ------------------------------ */
	/* ------- sidebar_마이페이지 ------ */
	/* ------------------------------ */
	
	.sidetitle_mypage {
		padding-bottom: 5%;
		margin-bottom: 30%;
	    font-weight: bold;
		font-size: 20px;
		margin-top: 40%;
	}
	.sidetitle_mypage span a {
		margin-left: 7%;
	}
	.side_mypage, .side_admin_a {
		display: grid;
		text-align: left;
		align-items: center;
		height: 30px;
		font-size: 16px;
		padding-left: 20px;
	}


	/* --------------------------------- */
	/* ------- sidebar_중고거래페이지 ------ */
	/* --------------------------------- */
	
	.dropdown-menu {
	list-style:none;
	}
	.dropdown-menu li {
		width: 130px;
	}
	#drop_buy.padding_plus, #chatroom.padding_plus {
		padding-top: 100px;
	}
	
	#drop_sell, #drop_buy { display:none; }
	#drop_sell.sideon, #drop_buy.sideon { display: block; padding-bottom: 0px; margin-bottom: 0px;}

	
	
	
	/* -------------------------------- */
	/* ------- sidebar_관리자페이지 ------ */
	/* -------------------------------- */
			
	.side_admin{
	    display: grid;
	    text-align: left;
	    align-items: center;
	    height: 50px;
	    font-size: 20px;
	    padding-left: 10px;
	    font-weight: bold;
	}
	

	
	/* -------------------------- */
	/* HOVERRRRRRRRRRRRRRRRRRRRRR */
	/* -------------------------- */
	
	.sidetitle span a:hover, .sideroom a:hover, .sideroom span a:hover, .sideregion_tags tr td a:hover, .sidetitle_mypage span a:hover, .side_mypage a:hover {
		color: #00bcd4;
		text-decoration: none;
	}
	
	.sideroom:hover, .sidetitle_mypage:hover, .side_mypage:hover{
		background-color: white;
	}
	
	.sideclose_room span a:hover, .sidetitle_close span a:hover, .side_admin span a:hover, .side_admin_a a:hover{
		color: white;
		text-decoration: none;
	}
	.sideclose_room:hover, .side_admin:hover {
		background-color: rgba( 255, 255, 255, 0.3 );	
	}



	
</style>