<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="/resources/css/BarCss.jsp" %>
</head>
<body>
	<header class="bg-white" id="header_menu">
		<div class="row">	
			<div class="col-2">
			<!-- 로고이미지 -->
				<a href=""><img style="height:100px;"src="${pageContext.request.contextPath }/resources/img/logo.jpg"></a>
			</div>
			<div class="col-6 offset-sm-4">
			<div class="row">
				<!-- 로그인, 회원가입, 고객센터 -->
					<ul class="list-unstyled" >
					<!-- 찜 -->
					<li ><a href="#"><i class="fa-solid fa-heart"></i></i>찜</a> |</li>
					<!-- 채팅 -->
					<li ><a href="#" onclick="popupChat()"><i class="fa-solid fa-comment-dots"></i>채팅</a> |</li>
					<!-- 마이페이지 -->
					<li ><a href="#"><i class="fa-solid fa-circle-user"></i>마이페이지</a> |</li>
					<li ><a href="loadToLogin">로그인</a> |</li>
					<li ><a href="selectMemberLogout">로그아웃</a> |</li>					
					<li ><a href="loadToRegister">회원가입</a> |</li>
					<li ><a href="#">고객센터</a></li>
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
							<a href="#">HOME</a>
						</li>
						<li class="nav-item ">
							<a href="boardMainPage">커뮤니티</a>
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
<script type="text/javascript">
console.log("스크립트 확인!");

function popupChat(){
	console.log("popupChat 호출");
	let popOption = "width = 650px, height=550px, top=300px, left=500px, scrollbars=yes";
	let openUrl = 'loadToChatPage';
	window.open(openUrl, 'pop', popOption);
};
</script>


</html>