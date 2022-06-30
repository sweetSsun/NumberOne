<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1채팅</title>

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

	.chatRe{
		width: auto;
		word-wrap: break-word;
		/* float: left; */
		display: inline-block;
		margin:left;
		background-color: #D2D2D2;
		padding: 0.5rem! important;
		border-radius: 10px;
		margin-right: 3px;
		
	}
	.chatSe{
		width: auto;
		word-wrap: break-word;
		/* float: right; */
		display: inline-block;
		margin: right;
		background-color: #004804;
		padding: 0.5rem! important;
		border-radius: 10px;
		margin-right: 3px;
		color: #ffffff;
	}
</style>

</head>



<body>
	<button onclick="functionCh()"> 안녕~~ </button>
	<a href="chatList">테스트</a>
	
	<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	} else {
		nick = "NICK NULL";
	}
%>




<div id="messageWindow" style="padding:10px 0; overflow: auto; background-color: #ffffff;">

	<div class="row" style="border:solid 1px; min-height:20em;">

		<div id="chatList">
			<!-- 받은 메세지 들어갈 부분 div 왼쪽정렬 -->	        
			<div >
				<h6 style="text-align:left">test</h6>
			</div>
			<div id="chatList">
				<div>
					<p style="color: gray;">보낸사람 닉네임</p>
	        		<span class="chatRe">받은메세지</span>
	        	</div>
	        </div>
	        
			<!-- 보낸 메세지 들어갈 부분 div 오른쪽정렬 -->
	        <div>
	        	<div class="chatSe">
	        		<span>보낸메세지</span>
	        	</div>
	        </div>				
		</div>
			
	</div>
</div>


<div>
	<div>
		<!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
		<input type="text" id="inputMsg" style="padding:10px 0;height: 5em; width:-webkit-fill-available;" placeholder="메세지입력" onkeydown="if(event.keyCode==13){send();}">

		<input type="button" onclick="messageSend()" value="talk">
		<!-- <div id="messageWindow2" style="padding:10px 0;height: 20em; overflow: auto; background-color: #a0c0d7;"></div> -->

	</div>

</div>

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
		var chatUrl = '${pageContext.request.contextPath }/chatWskMessage';
		var chatWebSocket = new SockJS(chatUrl);
		
		// 연결시 실행
		chatWebSocket.onopen = function() {
		    console.log('open');
		    //sock.send('test');
		};
		
		// 서버로부터 메세지/데이터를 받으면 수행할 작업
		chatWebSocket.onmessage = function(evt) {
		    console.log('message', evt.data);
		    //var output = "<p>"+evt.data+"</p>";
	   		var receiveData = JSON.parse(evt.data);
		    console.log("Id "+receiveData.chfrmid); // 보낸사람 :: 본인
		    console.log("Comment "+receiveData.chcontents); // 내용
		    
		    var output = "<div><p style=\"color: gray;\">"+receiveData.msgUserId+"</p>";
		    output += "<span class=\"chatRe\">"+receiveData.msgComment+"</span></div>";
		    
		   
		    $("#chatList").append(output);
			// sock.close();
	    };
	    
        // 연결이 끊어지면 실행되는 부분
	    chatWebSocket.onclose = function(evt) {
	    	console.log("onclose evt.data : " + evt.data);
		};
		
	</script>

	<script type="text/javascript">
		function messageSend(){
			var userId = '${sessionScope.loginId}';
			var textMsg = $("#inputMsg").val();
			
			if( textMsg.trim().length >0 ){

				var msgData = {
					msgUserId : userId,
					msgComment : textMsg
				};
				chatWebSocket.send(JSON.stringify(msgData));
				var sendMsg = "<div><span class=\"chatSe\">"+textMsg+"</span></div>";
				
				$("#chatList").append(sendMsg);
				$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
				console.log("msgData"+JSON.stringify(msgData));
			}
			$("#inputMsg").val(""); // 입력창 초기화
		}
	</script>
</html>