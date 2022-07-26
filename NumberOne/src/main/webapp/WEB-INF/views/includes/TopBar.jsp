<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/css/BarCss.jsp" %>


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
										<p style="font-size: 12.5px"><a href="selectMyInfoMemberView"> ${sessionScope.loginNickname} 님 &nbsp;&nbsp;
										<img class="img-profile rounded-circle" style="height: 50px; width:50px;" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png">
		
										</a></p>
									</c:when>
									
									<c:when test="${sessionScope.loginId != null && sessionScope.kakaoId == null }">
										<p style="font-size: 12.5px">
											<a href="selectMyInfoMemberView"> ${sessionScope.loginNickname} 님 &nbsp;&nbsp;
												<img class="img-profile rounded-circle" style="height: 50px; width:50px;" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${sessionScope.loginProfile }">
											</a>
										</p>
									</c:when>									
									
									<c:otherwise>
										<p style="font-size: 12.5px">
											<a href="selectMyInfoMemberView"> ${sessionScope.loginNickname} 님 &nbsp;&nbsp;
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
							<li style="margin-right: 15px;" class="dropdown" >
								<a href="#" title="찜목록" id="dropdownZzim" role="button" data-bs-toggle="dropdown" aria-expanded="false" 
									style="display: inline-block !important;">
									<i class="fa-solid fa-heart"></i>
								</a>
								
								<!-- 찜목록 드롭다운 -->
								<div class="dropdown-menu shadow" id="zzimList" aria-labelledby="dropdownZzim"
									style="width: 500px;">
									<div>찜목록 나올거지롱</div>
									<!-- 회원의 찜목록 ajax로 받고 출력되는 부분 -->
                                </div>
							</li>

							<!-- 채팅 -->
							<li style="margin-right: 15px;" class="dropdown" >
								<a href="#" title="1:1채팅" class="nav_chat" id="dropdownChat" role="button" data-bs-toggle="dropdown" aria-expanded="false" 
									style="display: inline-block !important;">
									<i class="fa-solid fa-comment-dots"></i>
									<!-- 안읽은 채팅메세지 갯수 표시 -->
									<span id="chat-badge" class="nav_chat-badge"></span>
								</a>

								<!-- 채팅방 목록 드롭다운 -->
								<div class="dropdown-menu  shadow" id="chatRoomList" aria-labelledby="dropdownChat"
									style="width: 500px;">
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
	function popupChat(crcode, crfrmnickname, crfrmprofile){
		console.log("popupChat 호출");
		let popOption = "width=450px, height=560px, top=300px, left=500px, scrollbars=no, resizable=no";
		let openUrl = "loadToChat?crcode="+crcode;
	  	$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin"
	  					return;
	  				}
	  				return;
	  			}

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
								popChat.crfrMbInfo(crfrmnickname, crfrmprofile);
						 	});
							popChatArr.push(popChat); // 채팅팝업 배열에 담기
						}
						console.log("배열의 길이 : " + popChatArr.length);
					}
				});
				

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
	$(document).on("click", "#dropdownChat", function(e){
	  	$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin"
	  					return;
	  				}
	  				return;
	  			}
				$.ajax({
					type: "post",
					url: "selectChatRoomList",
					data: {"loginId": "${sessionScope.loginId}"},
					async:false,
					dataType: "json",
					success: function(result){
						console.log(result);
						outputChatRoomList(result);
					}
				});
			}
		});
	});

	// 드롭다운 채팅방목록 입력 함수
	function outputChatRoomList(data){
		console.log("채팅방 목록 드롭다운 실행");
		var dropdownList = "<p class=\"dropdown-header\" style=\"font-size:11px;\">채팅방 목록</p>";
		for(var i = 0; i < data.length; i++){
			if (i == 5){ // 최대 5개 목록까지만 출력
				break;
			}
			dropdownList += "<div class=\"\" >";
			dropdownList += "<a class=\" dropdown-item d-flex align-items-center py-2\" href=\"#\" onclick=\"popupChat('" + data[i].crcode + "', '" + data[i].crfrmnickname + "', '" + data[i].crfrmprofile + "')\">";
			dropdownList += "<div class=\"row\" style=\"width: 100%; --bs-gutter-x: 0;\">";
			dropdownList += "<div class=\"col-1 text-center\">";
			if (data[i].crfrmprofile != null){ // 상대방 이미지가 있으면
				dropdownList += "<img src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/" + data[i].crfrmprofile + "\" alt=\"프로필\" class=\"rounded-circle chat-profile\">";
			} else { // 없으면
				dropdownList += "<img src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png\" alt=\"프로필\" class=\"rounded-circle chat-profile\">";
			}
			dropdownList += "</div>";
			dropdownList += "<div class=\"col-11\" style=\"\">";
			dropdownList += "<div class=\"row nav_chat\" style=\"--bs-gutter-x: 0; margin-left: 10px;\">";
			dropdownList += "<div class=\"col-11 overflow_twoline px-0 \" style=\"font-size:13px;\">" + data[i].recentCmcontents + "</div>";
			dropdownList += "<div class=\"col-1 nav_chat\" style=\"text-align: center;\">";
			if (data[i].unreadCount != 0){ // 안읽은 메세지가 있으면
				dropdownList += "<span class=\"chat-badge\" style=\"\">" + data[i].unreadCount + "</span>";
			}
			dropdownList += "</div>";
			dropdownList += "<div class=\"row\"style=\"width: 100%; --bs-gutter-x: 0;\">";
			dropdownList += "<div class=\"col-6 \" style=\"color:gray; text-align:left; font-size:9px;\">" + data[i].crfrmnickname + "</div>";
			dropdownList += "<div class=\"col-6  px-0\" style=\"color:gray; text-align:right; font-size:9px;\">" + data[i].recentCmdate + "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</div>";
			dropdownList += "</a>";
			dropdownList += "</div>";
		}
		dropdownList += "<div class=\"text-center mt-1\">";
		dropdownList += "<a class=\"dropdown-item pt-2\" href=\"selectMyInfoResellView#scroll-chat\" style=\"color: gray; font-size:13px;\">더보기</a>";
		dropdownList += "</div>";
		$("#chatRoomList").html(dropdownList);
	}

/* 렉 때문에 잠시 지움
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
	 */
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
      
	   // 로그인 확인
	  	$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin"
	  					return;
	  				}
	  				return;
	  			}
	  			
	  			// 판매자정보 팝업
			    $.ajax({
			         url: "selectWriteMemberInfo_ajax",
			         data: {"nickname":nickname},
			         async:false,
			         dataType:"json",
			         success:function(result){
			        	 wMemberPopup = window.open(wMemberPopupUrl, "", wMemberPopupOption, nickname);
			        	 wMemberPopup.window.addEventListener("load", function(){
			        		 wMemberPopup.writeMemberBoard(result);
		        		 });
		        	 }
		         });
	  		}
	  	})
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
           console.log(result);
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


<!-- 찜목록 관련 스크립트 -->
<script type="text/javascript">
	// 찜 아이콘 클릭하면 찜목록 불러오고 드롭다운(최신순 5개까지 + 더보기)
	$(document).on("click", "#dropdownZzim", function(e){
	  	$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin"
	  				}
	  				return;
	  			}
	  			
				$.ajax({
					type: "post",
					url: "selectZzimList_ajax",
					data: {"loginId": "${sessionScope.loginId}"},
					async:false,
					dataType: "json",
					success: function(result){
						console.log(result);
						outputZzimList(result);
					}
				});
			}
		});
	});
	
	// 드롭다운 채팅방목록 입력 함수
	function outputZzimList(data){
		console.log("찜목록 드롭다운 실행");
		var zzimList = "<p class=\"dropdown-header\" style=\"font-size:11px;\">찜 목록</p>";
		for(var i = 0; i < data.length; i++){
			if (i == 5){ // 최대 5개 목록까지만 출력
				break;
			}
			zzimList += "<div class=\"\" >";
			zzimList += "<a class=\" dropdown-item d-flex align-items-center py-2\" href=\"#\" onclick=\"location.href='selectResellView?ubcode=" + data[i].ubcode + "&ubsellbuy=" + data[i].ubsellbuy+ "&modifyCheck=LIST'\">";
			zzimList += "<div class=\"row\" style=\"width: 100%; --bs-gutter-x: 0;\">";
			zzimList += "<div class=\"col-1 text-center\">";
			zzimList += "<img src=\"${pageContext.request.contextPath }/resources/img/resell/" + data[i].ubmainimg + "\" alt=\"메인사진\" class=\" chat-profile\">";
			zzimList += "</div>";
			zzimList += "<div class=\"col-11\" style=\"\">";
			zzimList += "<div class=\"row \" style=\"--bs-gutter-x: 0; margin-left: 10px;\">";
			zzimList += "<div class=\"col-10 overflow_twoline px-0 \" style=\"font-size:13px;\">" + data[i].ubtitle + "</div>";
			zzimList += "<div class=\"col-2 \" style=\"color:#00a5ba; text-align:right; font-size:9px;\">"  + data[i].ubrgcode ;
			zzimList += "</div>";
			zzimList += "<div class=\"row\"style=\"width: 100%; --bs-gutter-x: 0;\">";
			zzimList += "<div class=\"col-6 \" style=\"color:gray; text-align:left; font-size:9px; \">" + data[i].ubnickname + "</div>";
			zzimList += "<div class=\"col-6  px-0\" style=\"color:gray; text-align:right; font-size:9px;\">" + data[i].ubdatedef + "</div>";
			zzimList += "</div>";
			zzimList += "</div>";
			zzimList += "</div>";
			zzimList += "</div>";
			zzimList += "</a>";
			zzimList += "</div>";
		}
		zzimList += "<div class=\"text-center mt-1\">";
		zzimList += "<a class=\"dropdown-item pt-2\" href=\"selectMyInfoResellView#scroll-zzim\" style=\"color: gray; font-size:13px;\">더보기</a>";
		zzimList += "</div>";
		$("#zzimList").html(zzimList);
	}
</script>


<!-- 회원 신고 관련 스크립트 -->
<script type="text/javascript">
	// 회원 신고 확인 (팝업창 뜸과 동시에 수행)
	function checkMemberWarning(wmedNickname, crcode){ // 여기서 crcode는 팝업창의 고유 name값임
		console.log("checkMemberWarning 실행");		
		console.log("신고 확인할 회원 닉네임 : " + wmedNickname);
		$.ajax({
			type : "get",
			url : "checkMemberWarning_ajax",
			data : { "loginId" : "${sessionScope.loginId}", "wmedNickname" : wmedNickname },
			async: false,
			success : function(mbwnCheck){
				console.log("신고유무 확인 : " + mbwnCheck );
				// 신고된 상태면 신고버튼 빨간색으로 출력
				if( mbwnCheck == "Yes" ){
					var mwOpenedIdx = popChatArr.findIndex(popChat => popChat.name === crcode); // 인덱스 찾기
					popChatArr[mwOpenedIdx].$("#mbWarning").addClass("text-danger");
				}
			}
		});
	}	
	
	// 회원 신고
	function insertMemberWarning(wmedNickname, crcode){ // 여기서 crcode는 팝업창의 고유 name값임
		console.log("신고자 : " + loginId);
		console.log("신고할 회원 닉네임 : " + wmedNickname);
 		$.ajax({
			type : "get",
			url : "insertMemberWarning_ajax",
			data : { "loginId" : "${sessionScope.loginId}", "wmedNickname" : wmedNickname },
			success : function(insertResult){
				console.log(insertResult);
				var mwOpenedIdx = popChatArr.findIndex(popChat => popChat.name === crcode); // 인덱스 찾기
				if( insertResult > 0 ){ // 신고 성공
					
					if(crcode == 'wMemberPopup'){
						console.log("회원 정보에서 신고 성공")
						
						
						} else {
							console.log("채팅창에서 신고 성공")
							var mwOpenedIdx = popChatArr.findIndex(popChat => popChat.name === crcode); // 인덱스 찾기
							popChatArr[mwOpenedIdx].successMemberWarning();
						}
					
				} else { // 신고 실패
					popChatArr[mwOpenedIdx].failMemberWarning();
				}
			}
		});
	}
	
</script>

</html>