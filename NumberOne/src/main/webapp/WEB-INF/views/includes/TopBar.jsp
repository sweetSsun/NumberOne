<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<style type="text/css">
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
		height:1200px;
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
</head>
<body>
	<header class="bg-white" id="header_menu">
		<div class="row">	
			<div class="col-2">
			<!-- 로고이미지 -->
				<a href=""><img style="height:100px;"src="${pageContext.request.contextPath }/resources/logo.jpg"></a>
			</div>
			<div class="col-6 offset-sm-4">
			<div class="row">
				<!-- 로그인, 회원가입, 고객센터 -->
					<ul class="list-unstyled" >
					<!-- 찜 -->
					<li ><a href="#"><i class="fa-solid fa-heart"></i></i>찜</a> |</li>
					<!-- 채팅 -->
					<li ><a href="#"><i class="fa-solid fa-comment-dots"></i>채팅</a> |</li>
					<!-- 마이페이지 -->
					<li ><a href="#"><i class="fa-solid fa-circle-user"></i>마이페이지</a> |</li>
					<li ><a href="#">로그인</a> |</li>
					<li ><a href="#">회원가입</a> |</li>
					<li ><a href="#">고객센터</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="col-6 offset-sm-6">
					<!-- Home, 커뮤니티, 중고거래 목록 -->
					<ul class="list-unstyled " >
						<li class="nav-item active">
							<a href="#">HOME</a>
						</li>
						<li class="nav-item ">
							<a href="#">커뮤니티</a>
						</li>
						<li class="nav-item ">
							<a href="#">중고거래</a>
						</li>
					</ul>
				</div>
			</div>
			</div>
		</div>	
	</header>
</body>
</html>