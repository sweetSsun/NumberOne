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

/* 	.dropdown:hover .dropdown-menu {
	    display: block;
	    margin-top: 0;
	} */
	
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
	
	.nav_chat .nav_list-link{
		position: relative;
	}
	
	.nav_chat .nav_chat-badge{
		position: absolute;
		top: 5px;
		right: 1px;
		color: white;
		background-color: red;
	}
	
	.nav_chat-badge{
		font-size: 0.2rem;
		border-radius: 10px;
		min-width: 14px;
		text-align: center;
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
					<ul class="">
						<c:choose>
	                    <c:when test="${sessionScope.loginId == null && sessionScope.kakaoId == null}">
							<li style="margin-right: 15px;" ><a href="loadToRegister">회원가입</a></li>
							<li style="margin-right: 15px;" ><a href="loadToLogin">로그인</a></li>
	                    </c:when>
						<c:otherwise>
							<!-- 찜 -->
							<li style="margin-right: 15px;"><a href="#" title="찜목록"><i class="fa-solid fa-heart" style="font-size: large;"></i></a></li>
							<!-- 채팅 -->
							<li style="margin-right: 15px;" class="dropdown nav_list-link" >
								<a href="#" title="1:1채팅" class="nav_chat" id="dropdownChat" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fa-solid fa-comment-dots" style="font-size: large;"></i>
									<!-- 안읽은 채팅메세지 표시 -->
									<!-- badge 클래스 끌어와야함 -->
									<span class="nav_chat-badge">10</span>
								</a>

								<!-- 채팅방 목록 드롭다운 -->
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow" id="chatRoomList" aria-labelledby="dropdownChat">
                                <h6 class="dropdown-header">
                                    채팅방 목록
                                </h6>
                                <!-- 채팅방1 -->
                                <a class="dropdown-item d-flex align-items-center" href="#" onclick="popupChat('CR00001')">
                                    <div class="mr-3">
                                    	<!-- 여기 글자가 있으면 이미지가 나오는데 없으면 왜 안나와????? -->
                                    	<!-- 임시이미지 -->
                                    	<img src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="..."
                                    		class="img-profile rounded-circle" style="height: 50px; width:50px;"> 
                                    </div>
                                    <div class="">
                                        <div class="overflow">최신 메세지를 아주 길게아아아아아아웆아주아ㅜㅇ자우ㅏ아주길게아아아아아아웆아주아ㅜㅇ자우ㅏ아주길게 써볼게요~~~~~</div>
                                        <div class="row">
                                        <div class="col-6 small" style="color:gray; text-align:left;">상대방 닉네임</div>
                                        <div class="col-6 small" style="color:gray; text-align:right;">날짜</div>
                                        </div>
                                    </div>
                                </a>
                                
                                <!-- 채팅방2 -->
                                <a class="dropdown-item d-flex align-items-center" href="#" onclick="popupChat('CR00002')">
                                    <div class="mr-3">
                                    	<!-- 여기 글자가 있으면 이미지가 나오는데 없으면 왜 안나와????? -->
                                    	<!-- 임시이미지 -->
                                    	<img src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="..."
                                    		class="img-profile rounded-circle" style="height: 50px; width:50px;"> 
                                    </div>
                                    <div class="">
                                        <div class="overflow">채팅방2</div>
                                        <div class="row">
                                        <div class="col-6 small" style="color:gray; text-align:left;">상대방 닉네임</div>
                                        <div class="col-6 small" style="color:gray; text-align:right;">날짜</div>
                                        </div>
                                    </div>
                                </a>
                                </div>
							</li>
<!--  								
							<!-- 로그아웃 -->
 							<li style="margin-right: 15px;"><a href="selectMemberLogout">로그아웃</a></li>
							<!-- 고객센터(문의)	-->				
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
	
	var popChat;
	
	// 채팅 버튼 클릭시 채팅창 팝업되면서 기존 채팅방 메세지 목록 데이터 보내주는 함수
	function popupChat(crcode){
		//var crcode = "CR00001"; // 함수 호출시 파라미터로 받을 값. 임시 crcode
		console.log("popupChat 호출");
		let popOption = "width=450px, height=550px, top=300px, left=500px, scrollbars=no, resizable=no";
		let openUrl = "loadToChat?crcode="+crcode;
		//console.log($('popChat[name=pop'+crcode+']').closed); // 해당 팝업창이 열려있는지 확인
		$.ajax({
			url: "selectChatRoomMessage",
			data: {"crcode":crcode},
			async:false,
			dataType:"json",
			success:function(data){
				//var popCheck = popChatHistory(crcode); // 팝업창 안열려있으면 true, 열려있으면 false 반환
				
				// 특정 자식창의 name으로 어떻게 접근하는지요......................................
				//if(!(popChat.window.name=crcode) || (popChat.window.name=crcode).closed) { // 안열려있으면 open
					popChat = window.open(openUrl, crcode, popOption);
					popChat.window.addEventListener("load", function(){
						popChat.enterRoom(data);
				 	});
				/*} else { // 열려있으면 focus
					$('popChat[name=pop'+crcode+']').focus();
				} */
			}
		});
	}
	
	// 동일한 코드의 팝업창이 열려있는지 확인
/* 	function popChatHistory(crcode){
		var Obj = popChat.[name=pop'+crcode+'];
		console.log(Obj==undefined);
		console.log(Obj.closed);
		console.log(Obj==null);
		console.log(!Obj);
		if(!Obj || Obj.closed){
			return true;
		} else {
			return false;
		}
	} */
	
	// 채팅 아이콘 클릭하면 채팅방 목록 불러오고 드롭다운(안읽은 메세지 > 최신순)
	$(document).on("click", "#dropdownChat", function(){
		$.ajax({
			type: "post",
			url: "selectChatRoomList",
			data: {"loginId": "${sessionScope.loginId}"},
			async:false,
			dataType: "json",
			success: function(result){
				console.log(result);
				outputDropdown(result);
			}
		});
	});
	
	// 드롭다운 채팅방목록 입력 함수
	function outputDropdown(data){
		var dropdownList = "<h6 class=\"dropdown-header\">채팅방 목록</h6>";
		for(var i = 0; i < data.length; i++){
			if (i == 10){ // 최대 10개 목록까지만 출력
				break;
			}
			dropdownList += "<a class=\"dropdown-item d-flex align-items-center\" href=\"#\" onclick=\"popupChat('" + data[i].crcode + "')\">";
			dropdownList += "<div class=\"mr-3\">";
			dropdownList += "상대방이미지";
			dropdownList += "</div>";
			dropdownList += "<div>";
			dropdownList += "<div class=\"overflow\">" + data[i].recentCmcontents + "</div>";
			dropdownList += "<div class=\"row\">";
			dropdownList += "<div class=\"col-6 small\" style=\"color:gray; text-align:left;\">" + data[i].crfrmnickname + "</div>";
			dropdownList += "<div class=\"col-6 small\" style=\"color:gray; text-align:left;\">" + data[i].recentCmdate + "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</a>";
		}
		$("#chatRoomList").html(dropdownList);
	}

</script>


</html>