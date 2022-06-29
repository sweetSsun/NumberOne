<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<style type="text/css">
/* 폰트 : 프리텐다드 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
	*{
		font-family: 'pretendard';
		
	}
	header,nav,aside,section,footer{
		border: solid 1px black;
		margin-bottom: 5px;
		font-size: 24px;
	}
	header{
		position: sticky;
		top: 0px;
		z-index:10;
		padding: 3px;
	}
	#header_menu ul li{
		overflow: auto;
		display: inline;
	}
	
	a{	
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
	.sidebar{
		position: sticky;
		top: 0px;
		height: 1200px;
		width: 200px;
		margin-bottom: 5px;
		z-index: 1;
	}
	
	footer{
		height: 200px;
		background-color: gray;
	}
</style>