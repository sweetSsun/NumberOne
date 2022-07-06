<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">
	header{
	    font-family: 'Jal_Onuel';
		color: #4C4C4C;
	}
	.logoimg{
	    text-align: center;
	    margin-top: auto;
	    padding-bottom: 15px;
	}
	.topimg{
	    right: 55px;
    	float: right;
    	position: relative;
	}
	.menubar{
		margin-top: auto;
		text-align: center;
	}
	
</style>

</head>


<body>
	<header class="bg-white" id="header_menu">
		<div class="topimg">
			<ul class="list-unstyled">
			
				<c:choose>
					<c:when test="${sessionScope.loginId == null}">
						<li class="nav-item active">
							<h5>로그인 해주세요</h5>
						</li>
	                </c:when>
					<c:otherwise>
						<li class="nav-item active">
							<h5>${sessionScope.loginId} 님</h5>
						</li>
						
						<c:choose>
							<c:when test="${sessionScope.loginProfile == null}">
								<a href="selectMyInfoMemberView"><i class="fa-solid fa-circle-user"></i></a>
							</c:when>
							<c:otherwise>
								<a href="selectMyInfoMemberView"><img class="img-profile rounded-circle" style="width:50px" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${sessionScope.loginProfile }"></a>
							</c:otherwise>
						</c:choose>						
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
		
		
		<div class="row">	
		
			<div class="col-lg-2 col-sm-12 logoimg">
			<!-- 로고이미지 -->
				<a href="${pageContext.request.contextPath }/"><img style="height:100px; min-width:140px;"src="${pageContext.request.contextPath }/resources/img/logo_bada.png"></a>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-4 menubar">
			<!-- Home, 커뮤니티, 중고거래 목록 -->
				<ul class="list-unstyle ">
					<li class="nav-item" style="margin-right: 30px;">
						<a href="loadToBoardMainPage">커뮤니티</a>
					</li>
					<li class="nav-item">
						<a href="loadToResellMainPage">중고거래</a>
					</li>
				</ul>
				
			</div>
				
			<div class="col-lg-7 col-md-8 col-sm-8 menubar" style="text-align: right;">
			<!-- 로그인, 회원가입, 고객센터 -->
				<ul class="list-unstyled sytyle="font-size: 20px; margin-bottom: 0;" >
					
					<c:choose>
                    <c:when test="${sessionScope.loginId == null}">
						<li style="margin-right: 15px;" ><a href="loadToRegister">회원가입</a></li>
						<li style="margin-right: 15px;" ><a href="loadToLogin">로그인</a></li>
                    </c:when>
					<c:otherwise>
						<!-- 찜 -->
						<li style="margin-right: 15px;"><a href="#" title="찜목록"><i class="fa-solid fa-heart"></i></a></li>
						<!-- 채팅 -->
						<li style="margin-right: 15px;" ><a href="#" title="1:1채팅" onclick="popupChat()"><i class="fa-solid fa-comment-dots"></i></a></li>
						<!-- 로그아웃 -->
						<li style="margin-right: 15px;" ><a href="selectMemberLogout">로그아웃</a></li>					
					</c:otherwise>
					</c:choose>
						<li ><a href="#">고객센터</a></li>
				</ul>
			</div>
			
		</div>	
	</header>

</body>
<script type="text/javascript">
console.log("스크립트 확인!");

function popupChat(){
	console.log("popupChat 호출");
	let popOption = "width = 450px, height=550px, top=300px, left=500px, scrollbars=no";
	let openUrl = 'loadToChat';
	window.open(openUrl, 'pop', popOption);
};

$(function(){
	$(document).tooltip();
})
</script>


</html>