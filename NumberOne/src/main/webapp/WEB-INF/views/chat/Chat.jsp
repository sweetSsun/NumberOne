<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1채팅</title>
<%@ include file="/resources/css/CommonCss.jsp" %>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style>
	html{
	overflow:hidden;
	}
	.speech-bubble {
		position: relative;
		background: #ffffff;
		border-radius: .4em;
		height: auto;
		width: min-content;
		padding: 5px 5px;
		/* margin : 10px; */
		white-space:nowrap;
	}

	.speech-bubble:after {
		content: '';
		position: absolute;
		left: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 10px solid transparent;
		border-right-color: #ffffff;
		border-left: 0;
		border-top: 0;
		margin-top: -5px;
		margin-left: -10px;
	}

	#receiveMsg{
		width: 300px;
		height: 400px;
		background-color: #9bbbd4;
		margin-top: 10px;
		padding: 15px
	}
	
	.chattingDiv{
		padding : 5px;
		padding-left : 7px;
		width: 300px;
		height: 80px;
		background-color: gray;
	}
	
	#username { 
		width : 200px;
	}
	
	#comment{ 
		width : 200px;
	}

	.speech-bubble2 {
		float: right;
		position: relative;
		background: #fef01b;
		border-radius: .4em;
		height: auto;
		width: min-content;
		padding: 5px 5px;
		/* margin : 10px; */
		white-space:nowrap;
	}

	.speech-bubble2:after {
		content: '';
		position: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 10px solid transparent;
		border-left-color: #fef01b;
		border-right: 0;
		border-top: 0;
		margin-top: -5px;
		margin-right: -10px;
	}
	
	.subtitle{
		text-align: center;
		position: relative;
	    display: flex;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
   		background-color: #ffffff;
	    background-clip: border-box;
	    border: 1px solid #e3e6f0;
	    border-radius: 0.35rem;
	}
	.listArea{
	    min-height: 410px;
	    max-height: 410px;
	    overflow-y: scroll;
		width:-webkit-fill-available;
		padding-right: 5px;
		padding-left: 5px;
	}
	.listArea::-webkit-scrollbar {
		background-color: #F2F2FF;
	}
	.listArea::-webkit-scrollbar-thumb {
   		background-color: #00a5ba;
   		border-radius: 10px;
 	}
	
	.listArea::-webkit-scrollbar-track {
		border-radius: 10px;
 	}
  
	.insertChat{
		padding:10px 0;
		height: 5em; 
		width:-webkit-fill-available;"
	}
	.insertChat::-webkit-scrollbar {
		background-color: #F2F2FF;
		width: 8px;
	}
	.insertChat::-webkit-scrollbar-thumb {
   		background-color: #00a5ba;
   		border-radius: 10px;
 	}
	
	.insertChat::-webkit-scrollbar-track {
		border-radius: 10px;
 	}
 	
 	
	.insertBtn{
		line-height: 55px;
		background-color: #00bcd4;
		color: #ffffff;
		padding-left: 0px;
		padding-right: 0px;
		width: 103px;
	}
	.chatRe{
		width: auto;
		max-width: 300px;
		word-wrap: break-word;
		word-break: break-all;
		float: left;
		display: inline-block;
		background-color: #D2D2D2;
		padding: 0.5rem! important;
		margin-bottom: 10px;
		border-radius: 10px;
		
	}
	.chatSe{
		width: auto;
		max-width: 300px;
		word-wrap: break-word;
		float: right;
		display: inline-block;
		background-color: #00bcd4;
		padding: 0.5rem! important;
		margin-bottom: 10px;
		border-radius: 10px;
		/* margin-right: 3px; */
		color: #ffffff;
	}
	.chatDate{
		/*vertical-align: bottom;
   		display: inline-block; */
		font-size: small;
    	margin-left: 2px;
    	margin-right: 2px;
    	margin-top: 20px;
	}
	.outerDate{
		vertical-align:middle; display:table-cell;
	}
	.dateLine{
		background-color: #F6F6F6;
    	border-radius: 6px;
	}
	#frMemberInfo{
		height: 50px;
		margin:0;
		font-weight: bold; 
		line-height: 50px; 
		background-color:#00bcd4; 
		color:#ffffff; 
		border-radius: 5px;"
	}
	.frMember{
		text-align:left;
		margin-left: 0.5rem;
	}
	.frMbImg{
		height: 40px; 
		width:40px; 
	}
	.warningBtn{
		font-size: 28px; 
		vertical-align: middle;
		cursor: pointer;
	}
</style>

</head>



<body>

	<div class="row">
		<div class="col-xl-12 col-lg-12">
				<div class="subtitle" style="margin-bottom: 0.5rem;">
					<div class="subtitle">
						<!-- 상대방 정보 -->
		                <div class="" id="frMemberInfo">
		                	<div class="row" style="flex-wrap: nowrap;">
								<div class="col-9 frMember">
									<a onclick="opener.writeMemberSellbuy('${crfrMember.mnickname}')" style="cursor:pointer;">
										<c:choose>
											<c:when test="${crfrMember.mprofile != null && crfrMember.mstate == 1 }">
												<img class="img-profile rounded-circle" style="height: 45px; width:45px;" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${crfrMember.mprofile}">
											</c:when>
											
											<c:when test="${crfrMember.mprofile != null && crfrMember.mstate == 9 }">
												<img class="img-profile rounded-circle" style="height: 40px; width:40px;" src="${crfrMember.mprofile}">
											</c:when>
											
											<c:otherwise>
												<img class="img-profile rounded-circle" style="height: 45px; width:45px;" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
											</c:otherwise>
										</c:choose>
			                			<span>${crfrMember.mnickname}</span>
			                		</a>
								</div>
								<div class="col-3">
		                			<i id="mbWarning" onclick="mbWarningCheckModal()" class='fa-solid fa-land-mine-on fa-2x icon warningBtn'></i>
								</div>

		                	</div>
		                </div>
		                
		                
		                <!-- 메세지 출력 -->
		                <div class="subtitle listArea" id="chatList">
			                <!--
			                받은 메세지 들어갈 부분 div 왼쪽정렬
			                보낸 메세지 들어갈 부분 div 오른쪽정렬 -->
			            </div>
					</div>
				</div>
		</div>
	</div>          
	                
	
	<div>
		<div>
			<div class="subtitle" style="margin-bottom: 0.5rem;">
	        	<div>
	            	<div class="row">
	                	<div class="col-9" style="padding-right: 2px;">
		                    <textarea class="insertChat" id="inputMsg" placeholder="메세지입력"
		                    style="padding-left: 5px; border: none; background-color: #F2F2FF; resize: none;"></textarea>
	                    </div>
	                    <div class="col-3" style="padding-left:0;">
	                    	<input type="button" class="btn btn-lg insertBtn" onclick="sendBtn()" value="Talk" style="width:100%; height:80px;">
	                    	
	                    	
	                    	<!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
	                    	<!-- messageSend()에 넣어야함	<a href="chatList">테스트</a> -->
	                    </div>
	                </div>
	            </div>
			</div>
		</div>
	</div>
	
	
	<!-- 게시글 신고 확인 모달 -->
	<div class="modal fade" id="mbWarningCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 회원 신고 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	회원을 신고하시겠습니까?
                	<br> <span class="text-danger fw-bold">(※한번 신고한 회원은 신고취소가 불가능합니다.)</span></div>
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn btn-numberone" onclick="insertMemberWarning()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>


<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
	console.log("스크립트 확인!");

	function functionCh(){
		console.log("functionCh() 호출")
	};
</script>


<!-- 웹소캣 sockjs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<!-- 채팅 관련 스크립트 -->
<script type="text/javascript">
	let crcode = "${param.crcode }";
	console.log("해당 채팅방 코드 : " + crcode)
	
	var wmedNickname = "${crfrMember.mnickname}"; // 대화상대 닉네임
	var msgList = new Array(); // DB에 저장된 메세지 저장할 배열
	
	// 채팅방 입장과 동시에 
	$(document).ready(function (){
    	<c:forEach items="${msgList }" var="msg" varStatus="loop">
			var msg = {
				cmcode: "${msg.cmcode}",
				cmcrcode: "${msg.cmcrcode}",
				cmfrmid: "${msg.cmfrmid}",
				cmfrmnickname: "${msg.cmfrmnickname}",
				cmcontents: "${msg.cmcontents}",
				cmdate: "${msg.cmdate}",
				cmread: "${msg.cmread}"
			}
			msgList.push(msg);
		</c:forEach>
		
		enterRoom(msgList); // 메세지 출력
		
		opener.popChat = this;
		opener.checkMemberWarning(wmedNickname, crcode); // 대화상대 신고 했는지 확인
	});
	
	
	 // 채팅방 접속시 기존 채팅방의 대화목록 불러오기
     function enterRoom(msgList){
        for (var i = 0; i < msgList.length; i++){
           checkLR(msgList[i], false); // DB 입력시간으로 출력하기 위한 boolean값 전송
        } 
     }
	
	// 채팅방 접속시 채팅방의 상대방 정보 출력
/* 	function crfrMbInfo(crfrmnickname, crfrmprofile){
		console.log("crfrMbInfo 호출");
		var crfrMb = "";
		crfrMb += "<div class=\"row\" style=\"flex-wrap: nowrap;\">";
		crfrMb += "<div class=\"col-9 frMember\">";
		crfrMb += "<a onclick=\"opener.writeMemberSellbuy('" + crfrmnickname + "')\" style=\"cursor:pointer;\">";
		if (crfrmprofile.length > 0){
			crfrMb += "<img class=\"img-profile rounded-circle frMbImg\" src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/" + crfrmprofile + "\">";
		} else {
			crfrMb += "<img class=\"img-profile rounded-circle frMbImg\" src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png\">";
		}
		crfrMb += "<span> " + crfrmnickname + "</span>";
		crfrMb += "</a>";
		crfrMb += "</div>";
		crfrMb += "<div class=\"col-3\">";
		crfrMb += "<i id=\"mbWarning\" onclick=\"mbWarningCheckModal()\" class='fa-solid fa-land-mine-on fa-2x icon warningBtn'></i>";
		crfrMb += "</div>";
		crfrMb += "</div>";
			
		wmedNickname = crfrmnickname;
		$("#frMemberInfo").html(crfrMb);
	} */
	
	// enter키 이벤트
	$(document).on("keydown", $("#inputMsg"), function(e){
		if(e.keyCode == 13 && !e.shiftKey){
			e.preventDefault(); // 엔터키 입력 막기 (혹시 모를 중복전송을 막기 위함)
			sendBtn(); // Talk 버튼 클릭한 것과 동일한 함수 호출
		}
	});
	
	// Talk 버튼 클릭
	function sendBtn(){
	  	$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					opener.closePopup(crcode);
	  					opener.location.href = "loadToLogin";
	  					opener.focus();
	  					window.close();
	  					return;
	  				}
	  				return;
	  			}

				const originContents = $("#inputMsg").val();	// 현재 입력된 메세지 저장
				const cmcontents = originContents.replaceAll(/(\n|\r\n)/g, "<br>");
				if(cmcontents.trim().length > 0){	// 공백 제외 입력한 글이 있을 때 send
					sendMessage(cmcontents);
				}
				$("#inputMsg").val(""); // 입력창 초기화
				$("#inputMsg").focus();
			}
		});
	}
	
		
	var chatUrl = "${pageContext.request.contextPath }/chatWskMessage";
	var chatWebSocket = new SockJS(chatUrl);
	
	// 연결시 실행 (채팅방 입장)
	chatWebSocket.onopen = function() {
	    console.log("open");
		// ENTER-CHAT 이라는 메세지를 보내 Java Map에 session을 추가한다.
		const data = {
				"cmcrcode" : crcode,
				"cmfrmid" : "${sessionScope.loginId}",
				"cmcontents" : "ENTER-CHAT"
		}			
		let jsonData = JSON.stringify(data);
		chatWebSocket.send(jsonData);
	}
	
	
	// 메세지 전송
	function sendMessage(cmcontents){
		// 단순히 전송만 함. 전송한 사람에게도 메세지를 다시 뿌려줄 것이고, 거기에서 checkLR 할거임! (시스템 시간 띄우는 것 때문에)
		var data = {
			"cmcrcode" : crcode,
			"cmfrmid" : "${sessionScope.loginId}",
			"cmcontents" : cmcontents
		}
		var jsonData = JSON.stringify(data);
		chatWebSocket.send(jsonData);
	}
		
	
	// 메세지 수신
	chatWebSocket.onmessage = function(data) {
   		var receiveMsg = JSON.parse(data.data);
   		console.log("보낸 사람 닉네임 : " + receiveMsg.cmfrmnickname);
	    
   		checkLR(receiveMsg, true); // 현재 서버시간으로 출력하기 위한 boolean값 전송
    };
    
    
    // 추가된 메세지의 보낸 사람이 나인지 상대방인지 확인
    function checkLR(data, dateCheck){
       var LR = (data.cmfrmid != "${sessionScope.loginId}") ? "left":"right";
       appendMessage(LR, data, dateCheck);
       //console.log("checkLR에서의 dateCheck : " + dateCheck);
    }
	    
	    
    // 메세지 append
    var dateLine = []; // 날짜를 담을 배열
    function appendMessage(LR, data, dateCheck){
    	//console.log(data);
      	var message = ""; // 입력해줄 output
      	
    	/* DB 저장 메세지인지 실시간인지 날짜와 시간 체크 */
        if (dateCheck){
        	var dateInfo = serverDate(); // 실시간이면 서버시간 받아오기
       	} else {
    	  	var dateInfo = data.cmdate; // 실시간이 아니면 DB 저장 날짜 받아오기
       	}
      	// 해당 메세지 날짜/시간 분리
      	var date_split = dateInfo.split(" "); // dateInfo :: "월/일 시:분"
	
     	/* 배열에 해당 날짜가 없으면, 날짜 출력하고 배열에 담기 */
     	// 날짜 한 번만 출력하기 위함
      	if (!dateLine.includes(date_split[0])){ 
    		dateLine.push(date_split[0]);
    		//console.log("dateLine 길이 : " + dateLine.length);
    		//console.log("출력할 날짜 : " + date_split[0]);
    		message += "<div class=\"dateLine\">" + date_split[0] + "</div>";
      	}
    	  
	    if (LR == "left"){ // 왼쪽일 때 (상대방이 전송했을 때)
	        message += "<div style=\"text-align:left;\"><span>" + data.cmfrmnickname + "</span><div>";
	        message += "<div class=\"outerDate\"><span class=\"chatRe\">" + data.cmcontents + "</span>";
	        message += "<span class=\"chatDate\">" + date_split[1] + "</span></div>";
	    } else { // 오른쪽일 때 (자신이 전송했을 때)
	        message += "<div class=\"outerDate\" style=\"text-align:right; margin-top: 10px;\"><span class=\"chatSe\">" + data.cmcontents + "</span>";
	        message += "<span class=\"chatDate\">" + date_split[1] + "</span></div>";
	    }
	    $("#chatList").append(message);
	    $("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
              
    }

    
    // 서버시간 return 함수
    function serverDate(){
		var now = new Date();
			
  		let month = now.getMonth()+1; 	// 월
		if (month < 10) {
			month = "0" + month;
		}
  		let date = now.getDate();  	// 일
		if (date < 10) {
			date = "0" + date;
		}
		let hour = now.getHours();		// 시간
		if (hour < 10) {
			hour = "0" + hour;
		}
		let minute = now.getMinutes();	// 분
		if(minute < 10) {
			minute = "0" + minute;
		}
		var dateInfo = month + "/" + date + " " + hour + ":" + minute;
		
		console.log(dateInfo);
		return dateInfo;
	}
	    
	    
    // 연결이 끊어지면 실행되는 부분
    chatWebSocket.onclose = function(event) {
    	console.log("onclose event.data : " + event.data);
	}
	chatWebSocket.onerror = function(event){
		  console.log(event);
	}
	
	
	// 채팅방 닫힘 이벤트 (부모창의 배열에서 제거)
	window.onbeforeunload = function() {
		console.log("채팅방 닫힘");
		opener.closePopup(crcode);
	};
	
</script>

<!-- 신고 관련 스크립트 -->
<script type="text/javascript">
	// 신고된 회원일 경우 class 부여
	function checkMemberWarning(){
		$("#mbWarning").addClass("text-danger");
	}

	
	// 신고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#mbWarningCheckModal").modal("hide");
		});
	}
	
	
	// 신고 클릭 시 모달창 출력
	function mbWarningCheckModal(){
		if( $("#mbWarning").hasClass("text-danger") ){
			alert("이미 신고접수된 회원입니다.");
		}else{
			$("#mbWarningCheckModal").modal('show');
		}
	}
	
	
	// 모달창에서 "네" 클릭 시 대화상대 신고
	function insertMemberWarning(){
		console.log("신고할 회원 : " + wmedNickname);
		opener.popChat = this;
		opener.insertMemberWarning(wmedNickname, crcode);
	}
	
	
	// 대화상대 신고 성공 시 수행할 기능
	function successMemberWarning(){
		alert("회원 신고가 접수되었습니다.");
		$("#mbWarning").addClass("text-danger");
	}
	
	
	// 대화상대 신고 실패 시 수행할 기능(타입별로 구분)
	function failMemberWarning2(type){
		console.log(type+ "타입 신고 실패");
		if(type == 0){
			//insert fail
			console.log("무결성 제약조건 위반");
			alert("회원 신고에 실패했습니다");
		} else if(type == 2){
			//비로그인
			console.log("비로그인");
			alert("로그인 후 이용가능합니다");
		} else if(type ==3){
			//본인 신고하는 경우
			console.log("본인 신고 불가");
			alert("본인은 신고할 수 없습니다");
		}
	}
	
	// 대화상대 신고 실패 시 수행할 기능
/* 	function failMemberWarning(){
		console.log("신고 실패");
		alert("회원 신고에 실패했습니다");

	} */

	
</script>
</html>