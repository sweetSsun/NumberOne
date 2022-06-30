<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</html>