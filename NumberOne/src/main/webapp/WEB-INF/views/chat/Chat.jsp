<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1채팅</title>
<%@ include file="/resources/css/CommonCss.jsp" %>
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
		padding-right: 10px;
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
		width: 10px;
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
</style>

</head>



<body>

	<div class="row">
		<div class="col-xl-12 col-lg-12">
				<div class="subtitle" style="margin-bottom: 0.5rem;">
					<div class="subtitle">
					
		                <div class="subtitle">
		                	<h6 style="height: 50px; margin:0; font-weight: bold; line-height: 50px; background-color:#00bcd4; color:#ffffff; border-radius: 5px;">1:1채팅</h6>
		                </div>
		                 
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
	                	<div class="col-9" style="padding-right: 0px;">
		                    <textarea class="insertChat" id="inputMsg" placeholder="메세지입력"
		                    style="padding-left: 5px; border: none; background-color: #F2F2FF;"></textarea>
	                    </div>
	                    <div class="col-3" style="padding-left:0;">
	                    	<input type="button" class="btn btn-lg insertBtn" onclick="sendBtn()" value="Talk" style="width:100%;">
	                    	
	                    	
	                    	<!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
	                    	<!-- messageSend()에 넣어야함	<a href="chatList">테스트</a> -->
	                    </div>
	                </div>
	            </div>
			</div>
		</div>
	</div>
	
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

	<script type="text/javascript">
		let crcode = "${param.crcode }";
		console.log("해당 채팅방 코드 : " + crcode)
		// enter키 이벤트
		$(document).on("keydown", $("#inputMsg"), function(e){
			if(e.keyCode == 13 && !e.shiftKey){
				e.preventDefault(); // 엔터키 입력 막기
				sendBtn(); // Talk 버튼 클릭한 것과 동일한 함수 호출
			}
		});
		
		// Talk 버튼 클릭
		function sendBtn(){
			const cmcontents = $("#inputMsg").val();	// 현재 입력된 메세지 저장
			if(cmcontents.trim().length > 0){	// 공백 제외 입력한 글이 있을 때 send
				sendMessage(cmcontents);
			}
			$("#inputMsg").val(""); // 입력창 초기화
			$("#inputMsg").focus();
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
			var data = {
				"cmcrcode" : crcode,
				"cmfrmid" : "${sessionScope.loginId}",
				"cmcontents" : cmcontents
			}
			
			checkLR(data); // 왼쪽, 오른쪽 출력 확인
			
			var jsonData = JSON.stringify(data);
			chatWebSocket.send(jsonData);
		}
		
		// 메세지 수신
		chatWebSocket.onmessage = function(data) {
	   		var receiveMsg = JSON.parse(data.data);
	   		console.log("보낸 사람 닉네임 : " + receiveMsg.cmfrmnickname);
		    
	   		if (receiveMsg.cmfrmid != "${sessionScope.loginId}"){
	   			checkLR(receiveMsg);
	   		}
	    };

	    // 추가된 메세지의 보낸 사람이 나인지 상대방인지 확인
	    function checkLR(data){
	    	var LR = (data.cmfrmid != "${sessionScope.loginId}") ? "left":"right";
	    	appendMessage(LR, data);
	    }
	    
	    // 메세지 append
	    function appendMessage(LR, data){
	    	var message = "";
	    	if (LR == "left"){
			    message = "<div style=\"text-align:left;\"><span>"+data.cmfrmnickname+"</span><div>";
			    message += "<div style=\"display: table;\"><span class=\"chatRe\">"+data.cmcontents+"</span>";
			    message += "<span style=\"vertical-align: bottom; display: table-cell;\">"+data.cmdate+"</span></div>";
	    	} else {
	    		message ="<div style=\"text-align:right; margin-top: 10px;\"><span class=\"chatSe\">"+data.cmcontents+"</span>";
	    		message += "<span style=\"vertical-align: bottom;\">"+data.cmdate+"</span></div>";
	    	}
			$("#chatList").append(message);
			$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
		    	    
	    }

		    
	    
        // 연결이 끊어지면 실행되는 부분
	    chatWebSocket.onclose = function(event) {
	    	console.log("onclose event.data : " + event.data);
		}
		chatWebSocket.onerror = function(event){
			  console.log(event);
		}
	</script>
<!-- 
	<script type="text/javascript">
		function messageSend(){
			var frmid = '${sessionScope.loginId}';
			var tomid = 'chtest';
			var contents = $("#inputMsg").val();
			
			if( contents.trim().length >0 ){

				var sendData = {
					chfrmid : frmid,
					chcontents : contents,
					chtomid : tomid
				};
				chatWebSocket.send(JSON.stringify(sendData));
				var	sendMsg ="<div style=\"text-align:right; margin-top: 10px;\"><span class=\"chatSe\">"+sendData.chcontents+"</span>";

				$("#chatList").append(sendMsg);
				$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );

				console.log("보낸메세지 json : "+JSON.stringify(sendData));
				// console.log("받는사람 닉네임 : "+ sendData.chtomnick);
			}
			$("#inputMsg").val(""); // 입력창 초기화
			
			//location.href="insertChat";
			
		}
	</script> -->
</html>