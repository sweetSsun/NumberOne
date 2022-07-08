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

<style>

/* 폰트 : 프리텐다드 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

body {
	font-family : pretendard;
}

.table {
	padding : 10px 20px;
	border: 3px solid #949494;
	border-radius:5px;
	height: 50px;
	font-size: 15px;
}

p {
	width: 90px;
	color: #00BCD4; 
	margin: 2px;
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

/*.menuTable {
	border: 3px solid #949494;
	border-radius : 20px 20px 0px 0px ;
	height: 50px;
	font-size: 17px;
	
}*/

/* .menuInput {
	font-family : pretendard;
	text-align: center; 
	font-size: 18px;
	border: 0px;
	font-weight: bold;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
} */

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
 
 li input {
	font-size: 17px;
	font-weight: bold; 
	border: 0px;
 }
 
 .msgTextarea {
 border: 3px solid black;
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
 
</style>

<body>

<!-- 프로필 란 -->

<div class ="con">
	
	<table style="border: 3px solid; width: 600px; margin: 10px;">
	<tr>
	
	<!-- 프로필 -->
	<th rowspan="3" style="padding: 2px 15px 2px 10px; margin: 5px;">	
	<c:choose>
		<c:when test="${memberInfo.mprofile != null}">
    		<img style="height: 100px; width: 100px; border: 2px solid #949494; padding: 3px; margin: 0px; border-radius: 50%;" 
    			src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${memberInfo.mprofile }" alt="">	
		</c:when>
		<c:otherwise>
    		<img style="height: 100px; width: 100px; border: 2px solid #949494; padding: 1px; margin:10px; border-radius: 50%;" 
    			src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="">
		</c:otherwise>
	</c:choose>
	</th>
	
	<!-- 닉네임 -->
	<th><p style="text-align: right;"> 닉네임&nbsp;&nbsp;| </p></th>
	<td colspan="2"><input type="text" class="inputText" value="${memberInfo.mnickname }"></td>
	
	<!-- 채팅 버튼 -->
	<td rowspan="2"><input type="button" class="btn" style="width: 90px; margin-right: 30px;" value="채팅"></td>		
	</tr>
	<tr>
	
	<!-- 지역 -->
	<th><p style="text-align: right;">지역&nbsp;&nbsp;| </p></th>
	<td><input type="text" class="inputText" value="${memberInfo.mregion }"></td>
		<!-- <th><p style="width: 40px;">등급</th> -->
		<!-- <td><input type="hidden" style="width: 90px;" class="inputText" value="sh1234(예시)"></td> -->
	</tr>
	<!-- 상태메세지 -->
	<tr>
	<th><p style="text-align: right;">상태메세지&nbsp;&nbsp;| </p></th>
		<td colspan="4"><input type="text" class="inputText" style="width: 320px;"  value="${memberInfo.mmessage }"></td>
	</tr>	
	</table>
	
<!-- 프로필 란 끝 -->

<!-- 메뉴 시작 -->	
	<div class="row" style="width: 640px; margin-left: 11px;">
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 3px solid; border-radius: 20px 20px 0px 0px; height: 50px;">
			<input value="활 동 내 역" 
			style="width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;" readonly="readonly">
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6" 
		style="border: 3px solid; border-radius: 20px 20px 0px 0px; height: 50px;">
			<input value="판 매 내 역" 
			style="width:280px; border: 0px; margin-top: 7px; text-align: center; font-weight: bold; outline:none;"  readonly="readonly">
		</div>
	</div>
	
	<div class="row"  style="width: 650px; margin-left: 9px;">
			<div class = "msgTextarea col-lg-12 col-md-6 col-sm-6" style="border-top:0px;" >
				<c:forEach items="${Board }" var="Board">			
					<ul>
						<li><input type="text" class="inputText" value="${Board.bdtitle }">
					</ul>					
				</c:forEach>
			 </div>
		</div>	
<!-- 메뉴 끝 -->		
</body>
</html>
















