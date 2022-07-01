<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1채팅</title>
<%@ include file="/resources/css/CommonCss.jsp" %>

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
	    overflow: scroll;
		width:-webkit-fill-available;
	}
	.insertChat{
		padding:10px 0;
		height: 5em; 
		width:-webkit-fill-available;"
	}
	.insertBtn{
		line-height: 55px;
		background-color: #004804;
		color: #ffffff;
		padding-left: 0px;
		padding-right: 0px;
		width: 103px;
	}
	.chatRe{
		width: auto;
		word-wrap: break-word;
		float: left;
		display: inline-block;
		background-color: #D2D2D2;
		padding: 0.5rem! important;
		border-radius: 10px;
		
	}
	.chatSe{
		width: auto;
		word-wrap: break-word;
		float: right;
		display: inline-block;
		background-color: #004804;
		padding: 0.5rem! important;
		border-radius: 10px;
		/* margin-right: 3px; */
		color: #ffffff;
	}
</style>

</head>



<body>

	<div class="row">
		<div class="col-xl-8 col-lg-8">
				<div class="subtitle" style="margin-bottom: 0.5rem;">
					<div class="subtitle">
					
		                <div class="subtitle">
		                	<h6 style="height: 50px; margin:0; font-weight: bold; line-height: 50px; background-color:#004804; color:#ffffff; border-radius: 5px;">1:1채팅</h6>
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
		                    <input class="insertChat" id="inputMsg" type="text" placeholder="메세지입력" onkeydown="if(event.keyCode==13){messageSend();}"
		                    style="padding-left: 5px; border: none; background-color: #F2F5F2;">
	                    </div>
	                    <div class="col-3" style="padding-left:0;">
	                    	<input type="button" class="btn btn-lg insertBtn" onclick="messageSend()" value="Talk">
	                    	
	                    	
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
		var chatUrl = '${pageContext.request.contextPath }/chatWskMessage';
		var chatWebSocket = new SockJS(chatUrl);
		
		// 연결시 실행
		chatWebSocket.onopen = function() {
		    console.log('open');
		};
		
		// 서버로부터 메세지/데이터를 받으면 수행할 작업
		chatWebSocket.onmessage = function(event) {
			console.log("onmessage event.data : "+event.data);
		    
	   		var receiveData = JSON.parse(event.data);
	   		console.log(receiveData.chcontents);
		    
	   		 	
		    var receiveMsg = "<div style=\"text-align:left;\"><span style=\"color: #004804;\" name=\"chtomid\">"+receiveData.chfrmid+"</span><div>";
		    receiveMsg += "<div><span class=\"chatRe\" name=\"chconents\">"+receiveData.chcontents+"</span></div>";
		    	    
		    
		    $("#chatList").append(receiveMsg);
		    $("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
			console.log("msgData"+JSON.stringify(receiveMsg));

		    
	    };
	    
        // 연결이 끊어지면 실행되는 부분
	    chatWebSocket.onclose = function(event) {
	    	console.log("onclose evt.data : " + event.data);
		};
		
	</script>

	<script type="text/javascript">
		function messageSend(){
			var chFrmid = '${sessionScope.loginId}';
			var chContents = $("#inputMsg").val();
			
			if( chContents.trim().length >0 ){

				var sendData = {
					chfrmid : chFrmid,
					chcontents : chContents
				};
				chatWebSocket.send(JSON.stringify(sendData));
				var sendMsg = "<div style=\"text-align:right;\"><span class=\"chatSe\" name=\"chcontents\">"+chContents+"</span></div>";

				$("#chatList").append(sendMsg);
				$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
				console.log("msgData"+JSON.stringify(sendData));
			}
			$("#inputMsg").val(""); // 입력창 초기화
			
			location.href="insertChat";
			
		}
	</script>
</html>