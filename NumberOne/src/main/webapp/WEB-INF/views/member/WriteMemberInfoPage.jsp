<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 작성자 상세 페이지 (Board)</title>
</head>

<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<body>
<style>

/* 폰트 : 프리텐다드 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

body {
	font-family : pretendard;
}

.table {
 	padding : 10px 20px;
	border: 1px solid #949494;
	border-radius:5px;
	height: 50px;
	font-size: 15px;
}

p {
	width: 90px;
	color: #00BCD4; 
	margin: 2px;
}

.pText {
	font-family : pretendard;
	width : 290px;
	height: 25px;
	font-size: 15px;
	font-weight: bold;
	width : 500px;
	border-bottom: 1px solid #D2D2D2;
	/* border: 0px; */
}

.pText a{
	color:black;
	text-decoration: none;
	
}

.spanText {
	font-family : pretendard;
	/* width : 500px; */
	height: 25px;
	font-size: 15px;
	font-weight: bold;
	border: 0px;
}


.btn {
	border : 0px;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family : pretendard;
  color: white;
  font-size: 15px;
  font-weight:bold;
  background: #00BCD4;
  padding: 10px 20px;
  text-decoration: none;
  float: right;
}

.btn:hover {
  background: #396e8f;
  text-decoration: none;
}


#list{ resize:none; overflow-y:scroll; }

	.listArea{
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
 	

 
 li input {
	font-size: 17px;
	font-weight: bold; 
	border: 0px;
 }
 
 .msgTextarea {
 border: 1px solid black;
	height: 550px;
	width: 640px;
	padding:10px;
	resize: none;
  	overflow-y: scroll;
  	margin-left: 2px;
}

.msgTextarea::-webkit-scrollbar {
    width: 10px;  /* 스크롤바의 너비 */
    
}

.msgTextarea::-webkit-scrollbar-thumb {
    height: 470px; /* 스크롤바의 길이 */
    background:  #999999; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

.msgTextarea::-webkit-scrollbar-track {
    background: #EAEAEA;  /*스크롤바 뒷 배경 색상*/
}

ul li a {
	
}

 .msgTextarea2 {
 border-left: 1px solid #949494;
 border-right: 1px solid #949494;
	/* height: 550px; */
	width: 640px;
	padding:10px;
	resize: none;
  	/* overflow-y: scroll; */
  	margin-left: 2px;
}


#inputMmessage {
  display:block; 
  overflow:hidden; 
  width:100%; 
  height:2rem; 
  /* padding-left:1rem;
  padding-top:0.8rem; */
  font-size:1rem; 
  font-weight:bold;
  color:#000; 
  border:1px;
  resize:none;
  border-radius : 4px;
 }
 
 
.parent{
    width: 640px;
    margin: 20px;
    display: flex;
}

.first {
    /* border: 1px solid red; */
    flex:1;
    width:20%;
    box-sizing: border-box;
}

.second{
    /* border: 1px solid green; */
    flex:5;
    padding: 10px 20px;
    width:40%;
    box-sizing: border-box;
}

.third{
    /* border: 1px solid blue; */ 
    flex:1;
    width:20%;
    box-sizing: border-box;
}

.spantitle{

color:#00bcd4; 
display:inline-block; 
width: 130px; 
text-align: right; 
font-weight: bold;

}

.spantitle2{

display:inline-block; 
width: 250px; 
text-align: right; 


}


</style>

<body>

<!-- 프로필 란 -->

 <div> <!--  class ="container" -->

	
	<!-- 프로필 -->

	<div class="row">

		<%-- <c:forEach items="${memberInfo }" var="memberInfo"> --%>
		<div class="parent">
		<c:choose>
		<c:when test="${memberInfo.mprofile != null}">
			<div class="first">
    		<img style="height: 100px; width: 100px; border: 1px solid #949494; padding: 3px; margin: 0px; border-radius: 50%;" 
    			src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${memberInfo.mprofile }" alt="">	
			</div>
			
		</c:when>
		<c:otherwise>
    		<img style="height: 100px; width: 100px; border: 1px solid #949494; padding: 3px; margin: 0px; border-radius: 50%;"  
    			src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="">	
		</c:otherwise>
		</c:choose> 
			<div class="second">	
				
				<span class="profile"> 
				<span class="spantitle">닉네임&nbsp;&nbsp;|</span>
				<span>${memberInfo.mnickname }</span>
				</span>	
					
				<span class="profile" style="display: block;"> 
				<span class="spantitle">지역&nbsp;&nbsp;|</span>
				<span>${memberInfo.mregion }</span>
				</span>	
				
				<span class="profile" style="display: block;"> 
				<span class="spantitle" style="">상태메세지&nbsp;&nbsp;|</span>
				<span>${memberInfo.mmessage }</span>	
				</span>
						
			</div>
			<div class="third">
			<input type="button" class="btn" style="width: 90px;" value="채팅">
			</div>
		</div>
		<%-- </c:forEach> --%>
	</div>	 
	 


<!-- 메뉴 시작 -->

	<div class="row" style="width: 640px; margin-left: 11px;">
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; border-bottom: 0px; background-color: #F2F2FF">
			<input value="활 동 내 역" 
			style="width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;  background-color: #F2F2FF" readonly="readonly">
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; /* border-bottom: 0px; */">
			<input value="판 매 내 역" 
			style="width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;"  readonly="readonly">
		</div>
	</div>
		
	<div class="row"  style="width: 650px; margin-left: 9px;">
	<div class = "msgTextarea2" style="background-color: #F2F2FF; padding-left: 50px;">
	<span style="width: 500px; text-align: center;">
	<button>작성글</button> 
	&nbsp;&nbsp;&nbsp; 
	<button id="wboard_btn">작성댓글</button></span>
	</div>
	<!-- 작성 글 -->
				
	<div class = "msgTextarea col-lg-12 col-md-6 col-sm-6" 
			style="border-top:0px! important ; padding-top: 20px; border: 1px solid #949494; background-color: #F2F2FF;" >
	<div id="WmemberBoard"></div>
	</div>
			 
	<!-- 작성 글 끝 -->

		</div>	
<!-- 메뉴 끝 -->		
</div>

<script type="text/javascript">


 console.log("되나??")


function writeMemberBoard(boardList){
	 
	 var output = "";
	 	
	for (var i = 0; i < boardList.length; i++){
		output+="<ul><li>"		
		output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+boardList[i].bdtitle+"</p>"
		output+="</li></ul>	"		
		output+="</div> "

		$("#WmemberBoard").html(output);
	}
	
 }	



/*   function writeMemberReply(ReplyList){ 
 
	  $("#wboard_btn").on("click",function(){
		
		 var output = "";
			for (var i = 0; i < ReplyList.length; i++){
				output+="<ul><li>"		
				output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; \" >"+ReplyList[i].rpcontents+"</p>"
				output+="</li></ul>	"		
				output+="</div> "

				$("#WmemberBoard").html(output);
			}
					 
		 
	 } 
		 
 }; */
	 
	 
 
	
	
	
	


</script>


</body>
</html>













