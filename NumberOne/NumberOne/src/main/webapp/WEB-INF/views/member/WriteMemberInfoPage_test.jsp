<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 작성자 상세 페이지 (Board)</title>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/BarCss.jsp" type="text/css">

<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>

/* 폰트 : 프리텐다드 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

body {
	font-family : pretendard;
	overflow-x: hidden;
}

.table {
 	padding : 10px 20px;
	border: 1px solid #949494;
	border-radius:5px;
	height: 50px;
	font-size: 15px;
}

.profile_state {
	margin: 3%;
	
}
.profile_state_title { /*  p 스타일부분 여기로 옮김 */
	white-space: nowrap;
	text-align: right;
}
.profile_state_title p {
	color: #00BCD4;
	border-right: solid 1px;
	padding-right: 10px;
}

.inputText {
	font-family : pretendard;
	width : 290px;
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
 	
 .con {
 	margin-left: 1px;
 	
 }	
 
/*  li input {
	font-size: 17px;
	font-weight: bold; 
	border: 0px;
 } */
 
 .msgTextarea {
 border: 3px solid black;
	height: 550px;
	width: 100%;
	padding:10px;
	resize: none;
  	overflow-y: scroll;
  	overflow-x: hidden;
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
 
 .menubar{
 	border: 1px solid #949494; 
 	border-radius: 20px 20px 0px 0px; 
 	height: 50px; 
 	border-bottom: 0px; 
 }
 
</style>

<body>

<!-- 프로필 란 -->

<div class ="con">
	
	<div class="row profile_state">
	
		<!-- 프로필 -->
		<div class="col-lg-2 col-md-2 col-sm-2">
			<c:choose>
			<c:when test="${memberInfo.mprofile != null}">
	    		<img style="height: 100px; width: 100px; border: 1px solid #949494; padding: 3px; margin: 0px; border-radius: 50%;" 
	    			src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${memberInfo.mprofile }" alt="">	
			</c:when>
			<c:otherwise>
	    		<img style="height: 100px; width: 100px; border: 1px solid #949494; padding: 1px; margin:10px; border-radius: 50%;" 
	    			src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="">
			</c:otherwise>
		</c:choose>	
		</div>
		
		<!-- 닉네임/ 지역/ 상태메세지 -->
		<div class="col-lg-2 col-md-2 col-sm-2 profile_state_title">
			<p style="text-align: right;">닉네임</p>
			<p style="text-align: right;">지역</p>
			<p style="text-align: right;">상태메세지</p>	
		</div>
		
		<!-- 프로필 -->
		<div class="col-lg-5 col-md-5 col-sm-5">
			<p>${memberInfo.mnickname }</p>
			<p>${memberInfo.mregion }</p>
			<p>${memberInfo.mmessage }</p>
		</div>
		
		<!-- 채팅 버튼 -->
		<div class="col-lg-3 col-md-3 col-sm-3" style="margin:auto;">
			<input type="button" class="btn" style="width: 90px;" value="채팅">
		</div>

	</div>
</div>	
<!-- 프로필 란 끝 -->

<!-- 메뉴 시작 -->
<div style="margin:5%;">
	<div class="row">
		<div class="menubar" style="width: 50%; background-color: #F2F2FF; text-align: center; padding-top: 12px;">
			<span style="font-weight: bold;">활&nbsp;동&nbsp;내&nbsp;역</span>			
		</div>
		<div class="menubar" style="width: 50%; text-align: center; padding-top: 12px;">
			<span style="font-weight: bold;">판&nbsp;매&nbsp;내&nbsp;역</span>			
		</div>
	</div>
	
	<div class="row">
		<div class = "msgTextarea overflow col-lg-12 col-md-6 col-sm-6" style="border-top:0px! important ; padding-top: 20px; border: 1px solid #949494; background-color: #F2F2FF;" >
			<c:forEach items="${Board }" var="Board">			
				<ul>
					<li><a href="selectBoardView?bdcode=${Board.bdcode }" target="_blank"><!-- 새창 띄우면 내용이 안나와서 다시 확인해봐야함!!!! -->
					<input type="text" class="inputText" style="background-color: #F2F2FF; border-bottom: 1px solid #D2D2D2; outline:none; width: 540px; " 
					readonly="readonly" value="${Board.bdtitle }"></a></li>
				</ul>					
			</c:forEach>
		 </div>
	</div>
</div>
<!-- 메뉴 끝 -->		
</body>
</html>




