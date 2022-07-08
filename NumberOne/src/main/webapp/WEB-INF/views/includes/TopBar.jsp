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
	    white-space: nowrap;		
	}
	
	.logoimg{
		margin-top: 2%;
        padding-left: 45%;    
	}
	
	.menubar_left{
		margin-top: auto;
		text-align: left;
	}
	
	.menubar_right{
		margin-top: auto;
		text-align: right;
		font-size: 16px;
	}
	
</style>

</head>


<body>
	<header class="bg-white" id="header_menu">
		<div class="container" style="width: 70%;">
		
		
			<div class="row">			
				
				<!-- 로고이미지 -->
				<div class="col-lg-12 col-sm-12 logoimg">
					<a href="${pageContext.request.contextPath }/"><img style="height:100px; min-width:140px;"src="${pageContext.request.contextPath }/resources/img/logo_bada.png"></a>
				
					<span style="float:right; margin-top: 5%;">				
						<c:choose>
							<c:when test="${sessionScope.loginId == null}">
								<h5><a href="loadToLogin">로그인 해주세요</a></h5>
								
			                </c:when>
							<c:otherwise>
								<!-- <li class="nav-item active"> -->
								<h5>${sessionScope.loginId} 님 &nbsp;&nbsp;
							
								<c:choose>
									<c:when test="${sessionScope.loginProfile == null}">
										<a href="selectMyInfoMemberView"><img class="img-profile rounded-circle" style="width:50px" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png"></a>
									</c:when>
									<c:otherwise>
										<a href="selectMyInfoMemberView"><img class="img-profile rounded-circle" style="width:50px" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${sessionScope.loginProfile }"></a>
									</c:otherwise>
								</c:choose>
								
								</h5>
								
							</c:otherwise>
						</c:choose>
					 </span>
				 
			 	 </div>
			</div>
			 
			<div class="row">	
				<!-- Home, 커뮤니티, 중고거래 목록 -->
				<div class="col-lg-5 col-md-6 col-sm-12 menubar_left">
					<ul>
						<li style="margin-right: 30px;">
							<a href="loadToBoardMainPage">커뮤니티</a>
						</li>
						<li>
							<a href="selectResellMainPage">중고거래</a>
						</li>
					</ul>
				</div>
	
					
				<!-- 로그인, 회원가입, 고객센터 -->
				<div class="col-lg-7 col-md-6 col-sm-12 menubar_right">
					<ul>
						<c:choose>
	                    <c:when test="${sessionScope.loginId == null}">
							<li style="margin-right: 15px;" ><a href="loadToRegister">회원가입</a></li>
							<li style="margin-right: 15px;" ><a href="loadToLogin">로그인</a></li>
	                    </c:when>
						<c:otherwise>
							<!-- 찜 -->
							<li style="margin-right: 15px;"><a href="#" title="찜목록"><i class="fa-solid fa-heart"></i></a></li>
							<!-- 채팅 -->
							<li style="margin-right: 15px;"><a href="#" title="1:1채팅" onclick="popupChat()"><i class="fa-solid fa-comment-dots"></i></a></li>
							<!-- 로그아웃 -->
							<li style="margin-right: 15px;"><a href="selectMemberLogout">로그아웃</a></li>					
						</c:otherwise>
						</c:choose>
							<li ><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</header>

</body>
<script type="text/javascript">
console.log("스크립트 확인!");

function popupChat(){
	console.log("popupChat 호출");
	let popOption = "width=450px, height=550px, top=300px, left=500px, scrollbars=no, resizable=no";
	let openUrl = 'loadToChat';
	window.open(openUrl, 'pop', popOption);
};

</script>


</html>