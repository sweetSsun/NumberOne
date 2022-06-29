<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1채팅</title>

<style>
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

</style>

</head>
<body>
	<button onclick="functionCh()"> 안녕~~ </button>
	
</body>
<script type="text/javascript">
	console.log("스크립트 확인!");

	function functionCh(){
		console.log("functionCh() 호출")
	};
</script>

<!-- mav로 메세지에 "상대를 배려하는 어쩌고 " 넣을까용 -->
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg, length);
	if(checkMsg.length > 0){
		alert(checkMsg);
	}
	</script>


<!-- 웹소캣 sockjs -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

	<script type="text/javascript">
		var chatUrl = '${pageContext.request.contextPath }/chatWskMessage';
		var chatWebSocket = new SockJS(chatUrl);
		
		// 연결시 실행
		webSocket.onopen = function() {
		    console.log('open');
		    sock.send('test');
		};
		
		// 서버로부터 메세지/데이터를 받으면 수행할 작업
		webSocket.onmessage = function(e) {
		    console.log('message', e.data);
		    //var output = "<p>"+e.data+"</p>";
	   		var receiveData = JSON.parse(e.data);
		    console.log("Id "+receiveData.msgUserId);
		    console.log("Comment "+receiveData.msgComment);
		    
		    var output = "<div class=\"card-body\" style=\"text-align: left;\"><span>"+receiveData.msgUserId+"</span></div>";
		    output = "<div class=\"card-body\" style=\"text-align: left;\"><span class=\"bg-gradient-primary\">"+receiveData.msgComment+"</span></div>";
		    
		   
		    $("#chatList").append(output);
			// sock.close();
	    };
	    
        // 연결이 끊어지면 실행되는 부분
	    webSocket.onclose = function(e) {
	    	console.log("onclose e.data : " + e.data);
		};
		
	</script>

<!-- 
	<script type="text/javascript">
		function messageSend(){
			var userId = '${sessionScope.loginId}';
			var textMsg = $("#inputMsg").val();
			
			if( textMsg.trim().length >0 ){

				var msgData = {
					msgUserId : userId,
					msgComment : textMsg
				};
				webSocket.send(JSON.stringify(msgData));
			
				var sendMsg = "<div class=\"my-2 p-2 font-weight-bold text-right\">";
				sendMsg += "<span class=\"bg-warning msgSty p-2 text-lg\">"+textMsg+"</span></div>";
				
				$("#chatList").append(sendMsg);
				$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
				console.log("msgData"+JSON.stringify(msgData));
			}
			$("#inputMsg").val(""); // 입력창 초기화
		}
	</script> -->
</html>