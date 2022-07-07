<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
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
				<a href="admin_loadToAdminMainPage"><img style="height:100px;"src="${pageContext.request.contextPath }/resources/img/logo_beige_remove.png"></a>
			</div>
			<div class="col-6 offset-sm-4">
			<div class="row">
				<!-- 로그인, 회원가입, 고객센터 -->
					<ul class="list-unstyled" >
					<!-- 마이페이지 -->
					<li ><a href="admin_loadToAdminMainPage"><i class="fa-solid fa-circle-user"></i>관리자모드</a> |</li>
					<li ><a href="selectMemberLogout">로그아웃</a> </li>
				</ul>
			</div>
			<div class="row">
				<div class="col-6 offset-sm-6">
					<!-- Home, 커뮤니티, 중고거래 목록 -->
					<ul class="list-unstyled " >
						<li class="nav-item ">
							<h5>로그인 아이디 : ${sessionScope.loginId}<h5>
						</li>					
						<li class="nav-item active">
							<h5>로그인 프로필 : ${sessionScope.loginProfile}<h5>
						</li>	
						<li class="nav-item active">
							<a href="${pageContext.request.contextPath }/">HOME</a>
						</li>
						<li class="nav-item ">
							<a href="loadToBoardMainPage">커뮤니티</a>
						</li>
						<li class="nav-item ">
							<a href="loadToResellMainPage">중고거래</a>
						</li>
					</ul>
				</div>
			</div>
			</div>
		</div>	
	</header>
</body>
<script type="text/javascript">
console.log("스크립트 확인!");

function popupChat(){
	console.log("popupChat 호출");
	let popOption = "width = 650px, height=550px, top=300px, left=500px, scrollbars=yes";
	let openUrl = 'chatPage';
	window.open(openUrl, 'pop', popOption);
};
</script>


</html>