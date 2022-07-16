<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<style type="text/css">
	.menu ::before{
	    font-family: 'Material Icons';
	    font-size: 1.5em;
	    float: left;
	    clear: left;
	}
	.menu label::before{ content: '\e5d2'; }
	.menu li:nth-child(1) a::before{ content: '\f02e'; }
	.menu li:nth-child(2) a::before{ content: '\e8d6'; }
	.menu li:nth-child(3) a::before{ content: '\e88a'; }
	.menu li:nth-child(4) a::before{ content: '\e8cc'; }
	.menu li:nth-child(5) a::before{ content: '\e87d'; }
	.menu li:nth-child(6) a::before{ content: '\e8b8'; }
	
	#expand-menu { /* 체크박스 폼 요소 감춤 */
	    display: none;
		}
	#expand-menu:checked ~ ul { /* 체크박스 체크되었으면 메뉴 목록 표시 - 반응형 표시용 */
	    display: block;
	    height: auto;
	}
		.menu {
	    display: block;
	    width: 200px;
	    background-color: #F2F2FF;
	    border-radius: 20px;
	    padding: 10px;
	    padding-top: 30%;
	    position: fixed;
	    box-sizing: border-box;
	    overflow: hidden; /* 반응형 애니메이션용 */
	    transition: all 0.5s ease; /* 반응형 애니메이션 */
	}
	.menu ul {
	    list-style: none;
	    margin: 0;
	    padding: 0;
	}
	.menu a, .menu > label {
		color: black;
	    display: block;
	    height: 25px;
	    padding: 8px;
	    cursor: pointer;
	    text-decoration: none;
	}
	.menu a:hover {
    	color: #000;
	}
	.menu ul li:hover, .menu > label:hover {
	    background-color: #fff;
	    color: #000;
	    border-radius: 10px;
	}
	.menu div {
		position: absolute; /* 절대 위치로 텍스트 고정 */
    	left: 50px;
	    line-height: 1.5;
	    font-size: 1em;
	    font-family: 'Noto Sans KR';
	    padding: 0 0 0 50px; /* 아이콘과 텍스트 사이 여백 */
	}
	@media screen and (max-width:1023px) {
	    .menu { /* 1단계 */
	        width: 60px;
    	}
	}
	@media screen and (max-width:560px) {
	    .menu #expand-menu:not(:checked) ~ ul { /* 2단계 */
	        display: none;
	    }
	}
	
</style>


</head>
<body>
	<div class="menu">
	    <label for="expand-menu"><div>메뉴</div></label>
	    <input type="checkbox" id="expand-menu" name="expand-menu">
	    <ul>
	        <li><a href="#" class="item"><div>자랑방</div></a></li>
	        <li><a href="#" class="item"><div>자유방</div></a></li>
	        <li><a href="#" class="item"><div>질문방</div></a></li>
	        <li><a href="#" class="item"><div>정보방</div></a></li>
	        <li><a href="#" class="item"><div>후기방</div></a></li>
	        <li><a href="#" class="item"><div>공지방</div></a></li>
	    </ul>
	</div>
	
</body>



</html>