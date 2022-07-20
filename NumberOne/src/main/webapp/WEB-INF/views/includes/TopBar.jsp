<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>

<style type="text/css">

/* 	.dropdown:hover .dropdown-menu {
	    display: block;
	    margin-top: 0;
	} */
	.overflow_twoline{
	    overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
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
	
	.nav_chat .nav_chat-badge{
		position: absolute;
		top: 5px;
		right: 1px;
		color: white;
		background-color: red;
	}
	
	.nav_chat .chat-badge{
		position: absolute;
		color: white;
		background-color: red;
	}
	
	.nav_chat-badge{
		font-size: 0.2rem;
		border-radius: 10px;
		min-width: 14px;
		text-align: center;
	}
	
	.chat-badge{
		font-size: 0.2rem;
		border-radius: 10px;
		min-width: 15px;
		text-align: center;
	}
	
	.chat-profile{
		width: 35px;
		height: 35px;
	}
	
	#chatRoomList{
		overflow: hidden;
	}


	@keyframes blink-effect {
		  50% {
	    opacity: 0;
	  }
	}
	
	.iconBlink{
		animation: blink-effect 1s step-end infinite;
	}
	
	.d_none{
      display: none;
    }
    .dropdown a:link {
      text-decoration: none;
   }
   .dropdown a:visited {
      text-decoration: none;
   }
   .dropdown a:hover {
      text-decoration: none;

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
							<li style="margin-right: 15px;" class="dropdown" >
								<a href="#" title="1:1채팅" class="nav_chat" id="dropdownChat" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fa-solid fa-comment-dots"></i>
									<!-- 안읽은 채팅메세지 갯수 표시 -->
									<span id="chat-badge" class="nav_chat-badge"></span>
								</a>

								<!-- 채팅방 목록 드롭다운 -->
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow" id="chatRoomList" aria-labelledby="dropdownChat"
									style="width: 45rem;">
									<!-- 회원의 채팅방 목록 ajax로 받고 출력되는 부분 -->
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
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	console.log("스크립트 확인!");
	
</script>	
	
<!-- 채팅 관련 스크립트 -->
<script type="text/javascript">
/* 채팅관련 스크립트 */
	var popChat;		 // 채팅팝업 이름
	var popChatArr = []; // 현재 떠있는 채팅 팝업창을 담을 배열
	
	// 채팅 버튼 클릭시 채팅창 팝업되면서 기존 채팅방 메세지 목록 데이터 보내주는 함수
	function popupChat(crcode){
		console.log("popupChat 호출");
		let popOption = "width=450px, height=550px, top=300px, left=500px, scrollbars=no, resizable=no";
		let openUrl = "loadToChat?crcode="+crcode;
		$.ajax({
			url: "selectChatRoomMessage",
			data: {"crcode":crcode},
			async:false,
			dataType:"json",
			success:function(data){
				console.log(popChatArr.some(popChat => popChat.name === crcode));
				// 해당 채팅방 팝업이 열려있으면
				if (popChatArr.some(popChat => popChat.name === crcode)) { 
					var openedIdx = popChatArr.findIndex(popChat => popChat.name === crcode); // 인덱스 찾기
					//console.log(popChatArr[openedIdx]);
					popChatArr[openedIdx].focus(); // 해당 채팅창 팝업에 focus
				} 
				
				// 열려있지 않으면
				else { 
					popChat = window.open(openUrl, crcode, popOption); // 팝업창 열기
					popChat.window.addEventListener("load", function(){
						popChat.enterRoom(data); // 채팅방 목록 불러오기
				 	});
					popChatArr.push(popChat); // 채팅팝업 배열에 담기
				}
				console.log("배열의 길이 : " + popChatArr.length);
			}
		});
	}
	
	// 특정 채팅방(자식창) 닫힐 경우 배열에서 제거하는 함수
	function closeChat(crcode){
		console.log("채팅방 닫힘");
		var openedIdx = popChatArr.findIndex(popChat => popChat.name === crcode); // 인덱스 찾기
		popChatArr.splice(openedIdx, 1); // 채팅팝업 배열에서 제거
	}
	
	// 채팅 아이콘 클릭하면 채팅방 목록 불러오고 드롭다운(안읽은 메세지 > 최신순)
	$(document).on("click", "#dropdownChat", function(){
		$.ajax({
			type: "post",
			url: "selectChatRoomList2",
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
		console.log("채팅방 목록 드롭다운 실행");
		var dropdownList = "<h6 class=\"dropdown-header\">채팅방 목록</h6>";
		for(var i = 0; i < data.length; i++){
			if (i == 5){ // 최대 5개 목록까지만 출력
				break;
			}
			dropdownList += "<div class=\"dropdown-item\" >";
			dropdownList += "<a class=\" d-flex align-items-center py-2\" href=\"#\" onclick=\"popupChat('" + data[i].crcode + "')\">";
			dropdownList += "<div class=\"row\" style=\"width: 100%;\">";
			dropdownList += "<div class=\"col-2 pr-0 text-center\">";
			if (data[i].crfrmprofile != null){ // 상대방 이미지가 있으면
				dropdownList += "<img src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/" + data[i].crfrmprofile + "\" alt=\"프로필\" class=\"rounded-circle chat-profile\">";
			} else { // 없으면
				dropdownList += "<img src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png\" alt=\"프로필\" class=\"rounded-circle chat-profile\">";
			}
			dropdownList += "</div>";
			dropdownList += "<div class=\"col-10\" >";
			dropdownList += "<div class=\"row nav_chat\" style=\"\">";
			dropdownList += "<div class=\"col-11 overflow_twoline px-0\" style=\"font-size:1.25rem;\">" + data[i].recentCmcontents + "</div>";
			dropdownList += "<div class=\"col-1 nav_chat\" style=\"width: 15px; height:15px; text-align: center;\">";
			if (data[i].unreadCount != 0){ // 안읽은 메세지가 있으면
				dropdownList += "<span class=\"chat-badge\" style=\"\">" + data[i].unreadCount + "</span>";
			}
			dropdownList += "</div>";
			dropdownList += "<div class=\"row\"style=\"width: 100%;\">";
			dropdownList += "<div class=\"col-6 small\" style=\"color:gray; text-align:left;\">" + data[i].crfrmnickname + "</div>";
			dropdownList += "<div class=\"col-6 small px-0\" style=\"color:gray; text-align:right;\">" + data[i].recentCmdate + "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</a>";
			dropdownList += "</div>";
		}
		dropdownList += "<div class=\"text-center mt-1\">";
		dropdownList += "<a class=\"dropdown-item pt-2\" href=\"selectMyInfoResellView#scroll-chat\">더보기</a>";
		dropdownList += "</div>";
		$("#chatRoomList").html(dropdownList);
	}


	<!-- 안읽은 채팅메세지 확인 뱃지 -->
	//console.log('${sessionScope.loginId }');
	if(${sessionScope.loginId != null}){
	   $(window).on('load', function(){
	         // 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
	         setInterval(function(){
	             // 읽지 않은 메세지 총 개수 불러오기 
	             var sumUnReadCount = 0;
	                   $.ajax({
	                     url:"selectSumUnReadCount",
	                     data:{"loginId": "${sessionScope.loginId}"},
	                     dataType:"json",
	                     async:false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
	                     success:function(sumUnReadCount){
	                       //console.log(sumUnReadCount);
	                       $("#chat-badge").text(sumUnReadCount);
	                      // 읽지 않은 메세지 총 갯수가 0개가 아니면
	                      if(sumUnReadCount != 0){
	                          // 채팅 icon 깜빡거리기
	                          $('.nav_chat-badge').addClass('iconBlink');
	                          $('.nav_chat-badge').removeClass('d_none');
	                      }else{
	                          // 깜빡거림 없애기
	                          $('.nav_chat-badge').removeClass('iconBlink');
	                          $('.nav_chat-badge').addClass('d_none');
	                      }
	                     }
	              });
	
	               },3000);
	    });
	}
	
	<!-- 로그인 시 세션에 담긴 채팅메세지 갯수 뱃지 출력 -->
 	if (${sessionScope.sumUnReadCount != 0 }){
		var loginUnReadCount = ${sessionScope.sumUnReadCount};
		console.log("안읽은 채팅 메세지 수 : " + loginUnReadCount);
		$("#chat-badge").text(loginUnReadCount);
	}
</script>

<!-- 마이페이지 미니브라우저 (커뮤니티부터!) -->
<script type="text/javascript">

   var wMemberPopup = "";
  
   
   function writeMemberBoard(nickname){
      console.log("팝업 스트립트 확인!!!");
      let wMemberPopupUrl = "loadToWriteMemberBoard?nickname="+nickname;
      let wMemberPopupOption = "width=660, height=820, top=300px, left=500px, scrollbars=no, resizable=no";
      
      
      $.ajax({
         url: "selectWriteMemberInfo_ajax",
         data: {"nickname":nickname},
         async:false,
         dataType:"json",
         success:function(result){
        	 console.log(result);
        	 if (result == "0"){        	 
				alert("로그인 후 이용가능합니다.");
        		location.href = "loadToLogin"
        		return;
        	 }
        	 
        	 wMemberPopup = window.open(wMemberPopupUrl, "", wMemberPopupOption, nickname);
        	 wMemberPopup.window.addEventListener("load", function(){
        		 wMemberPopup.writeMemberBoard(result);

        	 });
        	 
         }
      });
   }

      
   function boardreplySwitch(nickname, type){
         console.log("팝업 작성글 버튼 클릭!!!");
         
         var popUpUrl = "";
         if(type == 'b'){
            popUpUrl = "selectWriteMemberInfo_ajax";
         }else if(type == 'r') {
            popUpUrl = "selectWriteMemberInfoReply_ajax";
         }else if(type == 's') {
           popUpUrl = "selectWriteMemberInfoSellBuy_ajax"; 
         }

         $.ajax({
            url: popUpUrl,   
            data: {"nickname":nickname},
            async:false,
            dataType:"json",
            success:function(result){
               //console.log(result);
               //console.log(nickname);
                  
               if(type == 'b'){
                  wMemberPopup.writeMemberBoard(result);
               }else if(type == 'r') {
                  wMemberPopup.writeMemberReply(result);
               }else if(type == 's') {
                 wMemberPopup.writeMemberSellBuy(result); 
               }

            }
         });
      
   }
   


</script>

<!-- 마이페이지 미니브라우저 (중고거래부터!) -->
<script type="text/javascript">

   var wMemberPopup = "";
  
   
   function writeMemberSellbuy(nickname){
      console.log("(중고거래)팝업 스트립트 확인!!!");
      let wMemberPopupUrl = "loadToWriteMemberBoard?nickname="+nickname;
      let wMemberPopupOption = "width=660, height=820, top=300px, left=500px, scrollbars=no, resizable=no";
      
      
      $.ajax({
         url: "selectWriteMemberInfoSellBuy_ajax",
         data: {"nickname":nickname},
         async:false,
         dataType:"json",
         success:function(result){
           //console.log(result);
            //console.log(nickname);
            wMemberPopup = window.open(wMemberPopupUrl, "", wMemberPopupOption, nickname);
            
            wMemberPopup.window.addEventListener("load", function(){
               wMemberPopup.writeMemberSellBuy(result);
            });
            
         }
      });
   }

      
   function boardreplySwitch(nickname, type){
         console.log("팝업 작성글 버튼 클릭!!!");
         
         var popUpUrl = "";
         if(type == 'b'){
            popUpUrl = "selectWriteMemberInfo_ajax";
         }else if(type == 'r') {
            popUpUrl = "selectWriteMemberInfoReply_ajax";
         }else if(type == 's') {
           popUpUrl = "selectWriteMemberInfoSellBuy_ajax"; 
         }

         $.ajax({
            url: popUpUrl,   
            data: {"nickname":nickname},
            async:false,
            dataType:"json",
            success:function(result){
               //console.log(result);
               //console.log(nickname);
                  
               if(type == 'b'){
                  wMemberPopup.writeMemberBoard(result);
               }else if(type == 'r') {
                  wMemberPopup.writeMemberReply(result);
               }else if(type == 's') {
                 wMemberPopup.writeMemberSellBuy(result); 
               }

            }
         });
      
   }
   


</script>


</html>