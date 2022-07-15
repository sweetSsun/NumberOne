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
							<c:when test="${sessionScope.loginId == null && sessionScope.kakaoId == null }">
								<p style="font-size: 12.5px"><a href="loadToLogin">로그인 해주세요</a></p>
								
			                </c:when>
							<c:otherwise>
							
								<c:choose>
									<c:when test="${sessionScope.loginProfile == null}">
										<p style="font-size: 12.5px"><a href="selectMyInfoMemberView">${sessionScope.loginNickname} 님 &nbsp;&nbsp;
										<img class="img-profile rounded-circle" style="height: 50px; width:50px;" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png">
		
										</a></p>
									</c:when>
									<c:when test="${sessionScope.loginId != null && sessionScope.kakaoId == null }">
										<p style="font-size: 12.5px">
											<a href="selectMyInfoMemberView">${sessionScope.loginNickname} 님 &nbsp;&nbsp;
												<img class="img-profile rounded-circle" style="height: 50px; width:50px;" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${sessionScope.loginProfile }">
											</a>
										</p>
									</c:when>									
									<c:otherwise>
										<p style="font-size: 12.5px">
											<a href="selectMyInfoMemberView">${sessionScope.loginNickname} 님 &nbsp;&nbsp;
												<img class="img-profile rounded-circle" style="height: 50px; width:50px;" src="${sessionScope.loginProfile }">
											</a>
										</p>
									</c:otherwise>
								</c:choose>
								
							</c:otherwise>
						</c:choose>
					 </span>
				 
			 	 </div>
			</div>
			 
			<div class="row">	
				<!-- Home, 커뮤니티, 중고거래 목록 -->
				<div class="col-lg-5 col-md-6 col-sm-6 menubar_left">
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
				<div class="col-lg-7 col-md-6 col-sm-6 menubar_right">
					<ul>
						<c:choose>
	                    <c:when test="${sessionScope.loginId == null && sessionScope.kakaoId == null}">
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
							<!-- 고객센터(문의) -->					
							<li ><a href="selectMyInfoQuestionListView">고객센터</a></li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			
		</div>
	</header>
	
	
	<form name="msgData" id="msgData" method="post">
		<!-- 메세지 리스트 전달받고 팝업창으로 전달하는 부분(동적 생성) -->
	</form>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	console.log("스크립트 확인!");
	var popChat = null;
	//var msgList = [];
	
	function popupChat(){
		var crcode = "CR00001"; // 함수 호출시 파라미터로 받을 값. 임시 crcode
		console.log("popupChat 호출");
		let popOption = "width=450px, height=550px, top=300px, left=500px, scrollbars=no, resizable=no";
		let openUrl = "loadToChat?crcode="+crcode;
		popChat = window.open(openUrl, "popChat", popOption);
		$.ajax({
			url: "selectAllRoomMessage",
			data: {"crcode":crcode},
			async:false,
			dataType:"json",
			success:function(data){
			/* 	for (var i = 0; i < data.length; i++){
					console.log(data[i]);
	 				var message = {
						"cmcode" : data[i].cmcode,
						"cmcrcode" : data[i].cmcrcode,
						"cmfrmid" : data[i].cmfrmid,
						"cmcontents" : data[i].cmcontents,
						"cmfrmnickname" : data[i].cmfrmnickname
					}; 
	 				msgList += message;
				}
				console.log("msgList : " + typeof msgList); */
				
				popChat.window.addEventListener("load", function(){
					//popChat.enterRoom(JSON.stringify(msgList));
					popChat.enterRoom(data);
				});
			}
		});
	};

</script>


</html>