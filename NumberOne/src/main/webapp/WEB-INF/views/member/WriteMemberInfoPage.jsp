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

.sTextarea {

	resize: none;
  	overflow-y: scroll;
}

.sTextarea::-webkit-scrollbar {
    width: 5px;  /* 스크롤바의 너비 */
    
}

.sTextarea::-webkit-scrollbar-thumb {
    height: 3%; /* 스크롤바의 길이 */
    background:  #999999; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

.sTextarea::-webkit-scrollbar-track {
    background: white;  /*스크롤바 뒷 배경 색상*/
}

a{
	text-decoration: none;
}

</style>


<body>

<!-- 프로필 란 -->

 <div ><!-- class ="container" -->

	
	<!-- 프로필 -->

	<div class="row">

		<%-- <c:forEach items="${memberInfo }" var="memberInfo"> --%>
		<div class="parent"  style="margin-bottom : 0px;">
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
				<textarea class="spantitle" style="border: 0px; background-color:white; resize: none; height: 25px; overflow: hidden;"  disabled>닉네임&nbsp;&nbsp;|&nbsp;</textarea>
				<textarea style="border: 0px; background-color:white; resize: none; height: 25px; overflow: hidden; text-align: left; color:black;" disabled >${memberInfo.mnickname }</textarea>				
				</span>	
					
				<span class="profile" style="display: block;"> 
				<textarea class="spantitle" style="border: 0px; background-color:white; resize: none; height: 25px; overflow: hidden;"  disabled>지역&nbsp;&nbsp;|&nbsp;</textarea>
				<textarea style="border: 0px; background-color:white; resize: none; height: 25px; overflow: hidden; text-align: left; color:black;" disabled >${memberInfo.mregion }</textarea>
				</span>	
				
				<span class="profile" style="display: block;"> 
				<textarea id="sTextarea" class="spantitle" style="border: 0px; background-color:white; resize: none;" disabled>상태메세지&nbsp;&nbsp;|&nbsp;</textarea>
				<textarea class="sTextarea" style="border: 0px; background-color:white; width: 250px; color:black;" disabled >${memberInfo.mmessage }</textarea>	
				</span>
						
			</div>
			<div class="third">
			<input type="button" class="btn" style="width: 90px;" value="채팅">
			</div>
		</div>
		<%-- </c:forEach> --%>
	</div>	 
</div>	 


<!-- 메뉴 시작 -->
	<div id="WmemberReply">
	<div class="row" style="width: 640px; margin-left: 11px;" >
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; border-bottom: 0px; background-color: #F2F2FF">
			<input type="button" value="활 동 내 역" onclick="boardreplySwitch('a')"
			style="width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;  background-color: #F2F2FF" readonly="readonly">
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; /* border-bottom: 0px; */">
			<input type="button" value="판 매 내 역" onclick="boardreplySwitch('u')"
			style="background-color: white; width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;"  readonly="readonly">
		</div>
	</div>
		
	<div class="row"  style="width: 650px; margin-left: 9px;">
	<div class = "msgTextarea2" style="background-color: #F2F2FF; padding-left: 50px;">
	<span style="width: 500px; text-align: center;">

	<button onclick="boardreplySwitch('a')" id="board"  style="border: 0px; background-color: #F2F2FF; ">작성글보기</button> 
   	&nbsp;&nbsp;&nbsp; 
   	<button id="reply" onclick="boardreplySwitch('r')" style="border: 0px; background-color: #F2F2FF;">작성댓글보기</button></span>	


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


 console.log("스크립트 확인!!!")

function boardreplySwitch(type){
   console.log(type+"버튼 클릭");
   window.opener.boardreplySwitch('${memberInfo.mnickname }', type);
} 


 function writeMemberBoard(boardList){
	   console.log("작성글 출력 연결");
	   var output = "";
       
	   
	   
	   for (var i = 0; i < boardList.length; i++){
		   
		  if(boardList[i].bdcategory == "자랑"){
	      		output+="<ul><li>"
	    		output+="<a href=\"selectRoomList?bdcode="+boardList[i].bdcode+"&jsp=view\" target=\"_blank\">"
	      		output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+boardList[i].bdtitle+"</p>"
	      		output+="</a>"
	      		output+="</li></ul>"      
	      
		   }else {
		      	output+="<ul><li>"
		    	output+="<a href=\"selectBoardView?bdcode="+boardList[i].bdcode+"\" target=\"_blank\">"
		      	output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+boardList[i].bdtitle+"</p>"
		      	output+="</a>"
		      	output+="</li></ul>   " 	    	  
	      }
	      
	      output+="</div>"

	      $("#WmemberBoard").html(output);
	   	}
	  
	 }   

 
 
 

	
 function writeMemberReply(ReplyList){ 
 
	   console.log("작성 댓글 출력 연결");
	   var output = "";
       
	   
	   
	   for (var i = 0; i < ReplyList.length; i++){
		   
		  if(ReplyList[i].rpbdcategory == "자랑"){
	      		output+="<ul><li>"
	    		output+="<a href=\"selectRoomList?bdcode="+ReplyList[i].rpbdcode+"&jsp=view\" target=\"_blank\">"
	      		output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+ReplyList[i].rpcontents+"</p>"
	      		output+="</a>"
	      		output+="</li></ul>"      
	      
		   }else {
		      	output+="<ul><li>"
		    	output+="<a href=\"selectBoardView?bdcode="+ReplyList[i].rpbdcode+"\" target=\"_blank\">"
		      	output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+ReplyList[i].rpcontents+"</p>"
		      	output+="</a>"
		      	output+="</li></ul>" 	    	  
	      }
	      
	      output+="</div>"

	   	}
	  $("#WmemberBoard").html(output);
               
      
} 


// 중고거래 부분
  function writeMemberSellBuy(ubList){ 
	    console.log("중고거래 출력 연결");
		
	      var output = "";
	      output="<div id=\"WmemberBoard2\">"
	      output+="<div class=\"row\" style=\"width: 640px; margin-left: 11px;\"  >"
	    	  output+="<div class=\"col-lg-6 col-md-6 col-sm-6\" style=\"border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px;\">"
	    	  output+="<input type=\"button\" value=\"활 동 내 역\" onclick=\"boardreplySwitch('a')\" style=\"width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;  background-color: white\" readonly=\"readonly\"></div>"
	    	  output+="<div class=\"col-lg-6 col-md-6 col-sm-6\" style=\"border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; border-bottom: 0px; background-color: #F2F2FF;\">"
	    	  output+="<input type=\"button\" value=\"판 매 내 역\" onclick=\"boardreplySwitch('u')\" style=\"background-color: #F2F2FF; width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;\"  readonly=\"readonly\"></div>"
	    	  output+="</div>"  
	    	  output+="<div class=\"row\"  style=\"width: 650px; margin-left: 9px; \">"
	    	  
	    	  //높이 맞추기 위한 여백
	   		  output+="<div class = \"msgTextarea2\" style=\"background-color: #F2F2FF; padding-left: 50px; height: 45px;\"></div>"
	
	    	  output+="<div class = \"msgTextarea col-lg-12 col-md-6 col-sm-6\" style=\"border-top:0px! important ; padding-top: 20px; border: 1px solid #949494; background-color: #F2F2FF;\" >"
      
	        for (var i = 0; i < ubList.length; i++){
	           output+="<ul><li>" 
	        	   output+="<div>"
	           output+="&nbsp;&nbsp;&nbsp;"
	        	   output+="<a href=\"selectResellView?ubcode="+ubList[i].ubbdcode+"&ubsellbuy=S&modifyCheck=LIST\" target=\"_blank\">"
	       	   output+="<img style=\"height: 70px; width: 70px; border: 1px solid #949494; border-radius:5px; padding: 1px;\" src=\"${pageContext.request.contextPath }/resources/img/resell/"+ubList[i].ubmainimg+"\">"
	           output+="<span class=\"pText\" style=\"background-color: #F2F2FF; border: 0px; outline:none; color:black; \" >&nbsp;&nbsp;&nbsp; "+ubList[i].ubgdname+"</span>"
	           		output+="</a>"
	           output+="<div><hr>"
	           output+="</li></ul>"      
	        }
	        	output+="</div>"
	        	output+="</div>"
	        		output+="</div>"
	           //console.log(output);
	           $("#WmemberReply").html(output);
			
	        	
 } 

	
 function writeMemberBoard2(boardList){
	   console.log("작성글2 출력 연결");
	     
	   var output = "";
	   
	   output+="<div>"
		   output+="<div class=\"row\" style=\"width: 640px; margin-left: 11px;\" >"
		   output+="<div class=\"col-lg-6 col-md-6 col-sm-6\" style=\"border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px; border-bottom: 0px; background-color: #F2F2FF;\">"
		   output+="<input type=\"button\" value=\"활 동 내 역\" onclick=\"boardreplySwitch('a')\" "
		   output+="style=\"width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;  background-color: #F2F2FF\" readonly=\"readonly\"></div>"
		   output+="<div class=\"col-lg-6 col-md-6 col-sm-6\" style=\"border: 1px solid #949494; border-radius: 20px 20px 0px 0px; height: 50px;\">"
		   output+="<input type=\"button\" value=\"판 매 내 역\" onclick=\"boardreplySwitch('u')\""
		   output+="style=\"background-color: white; width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;\"  readonly=\"readonly\"></div>"
		   output+="</div>"
		   output+="<div class=\"row\"  style=\"width: 650px; margin-left: 9px;\">"
		   
		   output+="<div class = \"msgTextarea2\" style=\"background-color: #F2F2FF; padding-left: 50px;\">"
		   output+="<span style=\"width: 500px; text-align: center;\">"
		   output+="<button onclick=\"boardreplySwitch('a')\" id=\"board\"  style=\"border: 0px; background-color: #F2F2FF; \">작성글보기</button> "
		   output+="&nbsp;&nbsp;&nbsp; "
		   output+="<button id=\"reply\" onclick=\"boardreplySwitch('r')\" style=\"border: 0px; background-color: #F2F2FF;\">작성댓글보기</button></span></div>"
		   
		   output+="<div class = \"msgTextarea col-lg-12 col-md-6 col-sm-6\" style=\"border-top:0px! important ; padding-top: 20px; border: 1px solid #949494; background-color: #F2F2FF;\" >"
		output+="<div id=\"WmemberBoard\"></div>"
		   
		   for (var i = 0; i < boardList.length; i++){
			
			   if(boardList[i].bdcategory == "자랑"){
		   			output+="<ul><li>"   
			   		output+="<a href=\"selectRoomList?bdcode="+boardList[i].bdcode+"&jsp=view\" target=\"_blank\">"
		   			output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+boardList[i].bdtitle+"</p>"
		   			output+="</a>"
		   			output+="</li></ul>"  
			   }else {
				   	output+="<ul><li>"  
					output+="<a href=\"selectBoardView?bdcode="+boardList[i].bdcode+"\" target=\"_blank\">"
					output+="<p class=\"pText\" style=\"background-color: #F2F2FF; outline:none; width: 540px; color:black; \" >"+boardList[i].bdtitle+"</p>"
					output+="</a>"
					output+="</li></ul>"		   
			   }
		   } 
		   output+="</div>"
		   output+="</div>"		
		   output+="</div>"

		      $("#WmemberBoard2").html(output);
		   
	   
	 }  

</script>

</body>
</html>


