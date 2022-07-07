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


<style>

/* 폰트 : 프리텐다드 */
/* @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'); */


.table {
	padding : 10px 20px;
	border: 3px solid #949494;
	border-radius:5px;
	height: 50px;
	font-size: 17px;
}

p {
	width: 150px;
	color: #00BCD4; 
	margin: 2px;
}

.inputText {
	height: 25px;
	font-size: 17px;
	font-weight: bold;
	border: 0px;
}

.btn {
	border : 0px;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
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

.menuTable {
	border: 3px solid #949494;
	border-radius : 20px 20px 0px 0px ;
	height: 50px;
	font-size: 17px;
	
}

.menuInput {
	text-align: center; 
	font-size: 18px;
	border: 0px;
	font-weight: bold;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
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
 
 li input {
	font-size: 17px;
	font-weight: bold; 
	border: 0px;
 }
</style>

<body>

<!-- 프로필 란 -->

<div class ="con">

	<table class ="table">
	<tr>
	<th rowspan="3" width="150px;">	
    <img style="height: 130px; width: 130px; border: 2px solid #949494; padding: 10px; border-radius: 50%;" 
    src="${pageContext.request.contextPath }/resources/img/logo_bada.png" alt="">	
	</th>
	<th><p>닉네임</p></th>
	<td colspan="2"><input type="text" class="inputText" value="sh1234(예시)"></td>
	<td rowspan="2"><input type="button" class="btn" style="width: 90px;" value="채팅"></td>		
	</tr>
	<tr>
	<th><p>지역</p></th>
	<td><input type="text" class="inputText" value="인천(예시)"></td>
	<!-- <th><p style="width: 40px;">등급</th> -->
<!-- 	<td><input type="hidden" style="width: 90px;" class="inputText" value="sh1234(예시)"></td> -->
	</tr>
	<tr>
	<th><p>상태메세지</p></th>
		<td colspan="4"><input type="text" class="inputText" style="width: 320px;"  value="오늘도 화이팅!!!!!!!!(예시)"></td>
	</tr>	
	</table>
	
	<br>
	
	<table>
	
		<tr class="menuTable">
		<th class="menuTable">	
		<input class="menuInput" value="활동내역" style="width: 333px;">
		</th>
		<th class="menuTable">	
		<input class="menuInput" value="판매내역" style="width: 333px;">
		</th>
		</tr>
	
	
<!-- 내용 란 -->
<!-- 활동내역 -->	
	<tr>
		<c:forEach items="${board }" var="board">
			<td>${board.bdtitle}</td>								
		</c:forEach>
	</tr>	
</table>

</div>	
</body>
</html>
















